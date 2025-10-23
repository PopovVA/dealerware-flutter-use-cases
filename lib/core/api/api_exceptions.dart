/// Base class for all API exceptions
sealed class ApiException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const ApiException(this.message, [this.cause, this.stackTrace]);

  @override
  String toString() =>
      'ApiException: $message${cause != null ? ' (cause: $cause)' : ''}';
}

/// Network connection error
final class NetworkException extends ApiException {
  const NetworkException([Object? cause, StackTrace? stackTrace])
    : super('Network connection error', cause, stackTrace);

  @override
  String toString() =>
      'NetworkException: $message${cause != null ? ' - $cause' : ''}';
}

/// Bad response from server (4xx, 5xx)
final class ServerException extends ApiException {
  final int? statusCode;
  final dynamic responseData;

  const ServerException(
    this.statusCode,
    this.responseData, [
    Object? cause,
    StackTrace? stackTrace,
  ]) : super('Server error: ${statusCode ?? 'unknown'}', cause, stackTrace);

  @override
  String toString() =>
      'ServerException: $message${responseData != null ? ' - $responseData' : ''}';
}
