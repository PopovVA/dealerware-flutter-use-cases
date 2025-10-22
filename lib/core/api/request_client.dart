/// Universal request type for REST API and GraphQL
sealed class RequestType {
  const RequestType();
}

/// REST API methods
final class RestRequest extends RequestType {
  final RestMethod method;
  const RestRequest(this.method);
}

enum RestMethod { get, post, put, delete, patch }

/// GraphQL operations
final class GraphQLRequest extends RequestType {
  final GraphQLOperation operation;
  const GraphQLRequest(this.operation);
}

enum GraphQLOperation { query, mutation, subscription }

final class Request<T> {
  /// Request type (REST or GraphQL)
  final RequestType type;

  /// Endpoint for REST API or operation name for GraphQL
  /// REST: "user/info", "user/update", "user/delete"
  /// GraphQL: "GetUser", "UpdateUser", "DeleteUser"
  final String operation;

  /// Request parameters
  /// REST: query params or body
  /// GraphQL: variables
  final Map<String, dynamic>? params;

  /// GraphQL query/mutation string (only for GraphQL)
  final String? query;

  /// Additional headers
  final Map<String, String>? headers;

  const Request({
    required this.type,
    required this.operation,
    this.params,
    this.query,
    this.headers,
  });

  /// Factory for REST requests
  factory Request.rest({
    required RestMethod method,
    required String endpoint,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) {
    return Request(
      type: RestRequest(method),
      operation: endpoint,
      params: params,
      headers: headers,
    );
  }

  /// Factory for GraphQL requests
  factory Request.graphql({
    required GraphQLOperation operation,
    required String query,
    String? operationName,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) {
    return Request(
      type: GraphQLRequest(operation),
      operation: operationName ?? 'GraphQLOperation',
      query: query,
      params: variables,
      headers: headers,
    );
  }
}

abstract class RequestClient {
  /// The base URL of the API.
  /// https://api.example.com for REST
  /// https://api.example.com/graphql for GraphQL
  final String baseUrl;

  RequestClient({required this.baseUrl});

  Future<T> send<T>(Request<T> request);
}
