import 'package:graphql_flutter/graphql_flutter.dart' as gql;
import 'request_client.dart';

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
  Future<T> send<T>(Request<T> request) async {
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
        throw _handleGraphQLException(result.exception!);
      }

      return result.data as T;
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('GraphQL request failed: $e');
    }
  }

  /// Stream-based method for GraphQL subscriptions
  Stream<T> subscribeToRequest<T>(Request<T> request) {
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
            throw _handleGraphQLException(result.exception!);
          }
          return result.data as T;
        });
  }

  Exception _handleGraphQLException(gql.OperationException exception) {
    final errors = exception.graphqlErrors;
    final linkException = exception.linkException;

    if (errors.isNotEmpty) {
      final errorMessages = errors.map((e) => e.message).join(', ');
      return Exception('GraphQL errors: $errorMessages');
    }

    if (linkException != null) {
      if (linkException is gql.NetworkException) {
        return Exception('Network error: ${linkException.message}');
      }
      if (linkException is gql.ServerException) {
        return Exception(
          'Server error: ${linkException.parsedResponse?.response}',
        );
      }
      return Exception('Link error: ${linkException.toString()}');
    }

    return Exception('Unknown GraphQL error: ${exception.toString()}');
  }
}
