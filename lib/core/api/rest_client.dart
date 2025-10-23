import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_exceptions.dart';
import 'request_client.dart';

final restClientProvider = Provider<RestClient>((ref) {
  return RestClient(baseUrl: 'https://68f9578fdeff18f212b9499f.mockapi.io/');
});

class RestClient extends RequestClient {
  late final Dio _dio;

  RestClient({required super.baseUrl, Dio? dio, BaseOptions? options}) {
    _dio =
        dio ??
        Dio(
          options ??
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: const Duration(seconds: 30),
                receiveTimeout: const Duration(seconds: 30),
                headers: {'Content-Type': 'application/json'},
              ),
        );
  }

  /// Access to the underlying Dio instance for advanced configuration
  Dio get dio => _dio;

  @override
  Future<T> send<T>(AppRequest<T> request) async {
    if (request.type is! RestRequest) {
      throw ArgumentError('RestClient requires RestRequest type');
    }

    final restRequest = request.type as RestRequest;
    final endpoint = request.operation;

    try {
      Response<dynamic> response;

      switch (restRequest.method) {
        case RestMethod.get:
          response = await _dio.get(
            endpoint,
            queryParameters: request.params,
            options: Options(headers: request.headers),
          );
          break;

        case RestMethod.post:
          response = await _dio.post(
            endpoint,
            data: request.params,
            options: Options(headers: request.headers),
          );
          break;

        case RestMethod.put:
          response = await _dio.put(
            endpoint,
            data: request.params,
            options: Options(headers: request.headers),
          );
          break;

        case RestMethod.delete:
          response = await _dio.delete(
            endpoint,
            options: Options(headers: request.headers),
          );
          break;

        case RestMethod.patch:
          response = await _dio.patch(
            endpoint,
            data: request.params,
            options: Options(headers: request.headers),
          );
          break;
      }

      // Use fromJson if provided, otherwise try direct cast
      if (request.fromJson != null) {
        return request.fromJson!(response.data);
      }
      return response.data as T;
    } on DioException catch (e, stackTrace) {
      throw _handleDioError(e, stackTrace);
    }
  }

  /// Maps DioException to ApiException
  ApiException _handleDioError(DioException e, StackTrace stackTrace) {
    return switch (e.type) {
      // Server errors (bad response)
      DioExceptionType.badResponse => ServerException(
        e.response?.statusCode,
        e.response?.data,
        e,
        stackTrace,
      ),
      // Network errors (all other types)
      _ => NetworkException(e, stackTrace),
    };
  }
}
