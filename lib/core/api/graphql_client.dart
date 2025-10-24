import 'package:graphql_flutter/graphql_flutter.dart' as gql;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_exceptions.dart';
import 'request_client.dart';

final graphqlClientProvider = Provider<GraphQLClient>((ref) {
  return GraphQLClient(baseUrl: 'https://graphqlzero.almansi.me/api');
});

class GraphQLClient extends RequestClient {
  late final gql.GraphQLClient _client;

  GraphQLClient({
    required super.baseUrl,
    gql.GraphQLClient? client,
    gql.GraphQLCache? cache,
    Map<String, String>? defaultHeaders,
  }) {
    _client =
        client ??
        gql.GraphQLClient(
          link: gql.HttpLink(baseUrl, defaultHeaders: defaultHeaders ?? {}),
          cache: cache ?? gql.GraphQLCache(store: gql.InMemoryStore()),
        );
  }

  /// Access to the underlying GraphQL client for advanced configuration
  gql.GraphQLClient get client => _client;

  @override
  Future<T> send<T>(AppRequest<T> request) async {
    if (request.type is! GraphQLRequest) {
      throw ArgumentError('GraphQLClient requires GraphQLRequest type');
    }

    if (request.query == null) {
      throw ArgumentError('GraphQL request requires a query string');
    }

    final graphqlRequest = request.type as GraphQLRequest;

    try {
      gql.QueryResult result;

      switch (graphqlRequest.operation) {
        case GraphQLOperation.query:
          result = await _client.query(
            gql.QueryOptions(
              document: gql.gql(request.query!),
              variables: request.params ?? {},
              fetchPolicy: gql.FetchPolicy.networkOnly,
            ),
          );
          break;

        case GraphQLOperation.mutation:
          result = await _client.mutate(
            gql.MutationOptions(
              document: gql.gql(request.query!),
              variables: request.params ?? {},
            ),
          );
          break;

        case GraphQLOperation.subscription:
          throw UnimplementedError(
            'Subscriptions should use subscribeToRequest method',
          );
      }

      // Check for errors
      if (result.hasException) {
        throw _handleGraphQLException(result.exception!, StackTrace.current);
      }

      return result.data as T;
    } on ApiException {
      rethrow;
    } catch (e, stackTrace) {
      // Unexpected error -> wrap in NetworkException
      throw NetworkException(e, stackTrace);
    }
  }

  /// Stream-based method for GraphQL subscriptions
  Stream<T> subscribeToRequest<T>(AppRequest<T> request) {
    if (request.type is! GraphQLRequest) {
      throw ArgumentError('GraphQLClient requires GraphQLRequest type');
    }

    if (request.query == null) {
      throw ArgumentError('GraphQL request requires a query string');
    }

    final graphqlRequest = request.type as GraphQLRequest;

    if (graphqlRequest.operation != GraphQLOperation.subscription) {
      throw ArgumentError('This method is only for subscriptions');
    }

    return _client
        .subscribe(
          gql.SubscriptionOptions(
            document: gql.gql(request.query!),
            variables: request.params ?? {},
          ),
        )
        .map((result) {
          if (result.hasException) {
            throw _handleGraphQLException(
              result.exception!,
              StackTrace.current,
            );
          }
          return result.data as T;
        });
  }

  /// Maps GraphQL OperationException to ApiException
  ApiException _handleGraphQLException(
    gql.OperationException exception,
    StackTrace stackTrace,
  ) {
    final errors = exception.graphqlErrors;
    final linkException = exception.linkException;

    // GraphQL errors (validation, query errors, etc.)
    if (errors.isNotEmpty) {
      final errorMessages = errors.map((e) => e.message).join(', ');
      return ServerException(
        null, // GraphQL errors don't have HTTP status codes
        errorMessages,
        exception,
        stackTrace,
      );
    }

    // Network-level errors
    if (linkException != null) {
      if (linkException is gql.NetworkException) {
        return NetworkException(linkException, stackTrace);
      }
      if (linkException is gql.ServerException) {
        final statusCode = linkException.statusCode;
        final responseData = linkException.parsedResponse?.response;
        return ServerException(
          statusCode,
          responseData,
          linkException,
          stackTrace,
        );
      }
      // Other link errors -> treat as network errors
      return NetworkException(linkException, stackTrace);
    }

    // Unknown error -> treat as network error
    return NetworkException(exception, stackTrace);
  }
}
