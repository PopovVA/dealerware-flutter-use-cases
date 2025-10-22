import 'package:dio/dio.dart';
import 'request_client.dart';

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
  Future<T> send<T>(Request<T> request) async {
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

      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timeout');
      case DioExceptionType.sendTimeout:
        return Exception('Send timeout');
      case DioExceptionType.receiveTimeout:
        return Exception('Receive timeout');
      case DioExceptionType.badResponse:
        return Exception(
          'Request failed: ${e.response?.statusCode} ${e.response?.data}',
        );
      case DioExceptionType.cancel:
        return Exception('Request cancelled');
      case DioExceptionType.connectionError:
        return Exception('Connection error: ${e.message}');
      case DioExceptionType.badCertificate:
        return Exception('Bad certificate');
      case DioExceptionType.unknown:
        return Exception('Unknown error: ${e.message}');
    }
  }
}
