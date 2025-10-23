import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';

/// Base class for all dealership domain exceptions
sealed class DealershipException implements Exception {
  final String message;
  final Object? cause;

  const DealershipException(this.message, [this.cause]);

  @override
  String toString() =>
      'DealershipException: $message${cause != null ? ' (cause: ${cause.runtimeType})' : ''}';
}

/// Dealership not found (404)
final class DealershipNotFoundException extends DealershipException {
  final String dealershipId;

  const DealershipNotFoundException(this.dealershipId, [Object? cause])
    : super('Dealership with id "$dealershipId" not found', cause);

  @override
  String toString() => 'DealershipNotFoundException: $message';
}

/// Network/Server error (all other cases)
final class DealershipNetworkException extends DealershipException {
  const DealershipNetworkException([Object? cause])
    : super('Network error occurred. Please try again', cause);

  @override
  String toString() => 'DealershipNetworkException: $message';
}

/// Helper extension for mapping ApiException to DealershipException
extension ApiExceptionMapper on ApiException {
  /// Maps technical ApiException to domain DealershipException
  DealershipException toDealershipException([String? resourceId]) {
    return switch (this) {
      // 404 - Not Found
      ServerException(statusCode: 404) => DealershipNotFoundException(
        resourceId ?? 'unknown',
        this,
      ),
      // All other errors -> Network error
      _ => DealershipNetworkException(this),
    };
  }
}
