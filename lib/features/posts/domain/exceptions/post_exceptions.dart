import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';

/// Base class for all post domain exceptions
sealed class PostException implements Exception {
  final String message;
  final Object? cause;

  const PostException(this.message, [this.cause]);

  @override
  String toString() =>
      'PostException: $message${cause != null ? ' (cause: ${cause.runtimeType})' : ''}';
}

/// Post not found (404)
final class PostNotFoundException extends PostException {
  final String postId;

  const PostNotFoundException(this.postId, [Object? cause])
    : super('Post with id "$postId" not found', cause);

  @override
  String toString() => 'PostNotFoundException: $message';
}

/// Network/Server error (all other cases)
final class PostNetworkException extends PostException {
  const PostNetworkException([Object? cause])
    : super('Network error occurred. Please try again', cause);

  @override
  String toString() => 'PostNetworkException: $message';
}

/// Helper extension for mapping ApiException to PostException
extension ApiExceptionMapper on ApiException {
  /// Maps technical ApiException to domain PostException
  PostException toPostException([String? resourceId]) {
    return switch (this) {
      // 404 - Not Found
      ServerException(statusCode: 404) => PostNotFoundException(
        resourceId ?? 'unknown',
        this,
      ),
      // All other errors -> Network error
      _ => PostNetworkException(this),
    };
  }
}
