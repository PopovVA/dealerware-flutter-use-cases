import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/api/rest_client.dart';
import 'package:dealerware_flutter_use_cases/core/api/request_client.dart';

// Mock classes
class MockDio extends Mock implements Dio {}

class MockResponse<T> extends Mock implements Response<T> {}

void main() {
  group('RestClient CRUD Operations', () {
    late MockDio mockDio;
    late RestClient restClient;
    const baseUrl = 'https://api.test.com';

    setUpAll(() {
      // Register fallback values for mocktail
      registerFallbackValue(Options());
    });

    setUp(() {
      mockDio = MockDio();
      restClient = RestClient(baseUrl: baseUrl, dio: mockDio);
    });

    group('Read (GET)', () {
      test('given successful GET request, '
          'when send is called, '
          'then should return data', () async {
        // Arrange (Given)
        final mockResponse = MockResponse<Map<String, dynamic>>();
        final responseData = {'id': '1', 'name': 'Test'};

        when(() => mockResponse.data).thenReturn(responseData);
        when(
          () => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final request = AppRequest<Map<String, dynamic>>.rest(
          method: RestMethod.get,
          endpoint: '/dealerships/1',
        );

        // Act (When)
        final result = await restClient.send(request);

        // Assert (Then)
        expect(result, responseData);
        verify(
          () => mockDio.get(
            '/dealerships/1',
            queryParameters: null,
            options: any(named: 'options'),
          ),
        ).called(1);
      });
    });

    group('Create (POST)', () {
      test('given successful POST request, '
          'when send is called, '
          'then should create and return data', () async {
        // Arrange (Given)
        final mockResponse = MockResponse<Map<String, dynamic>>();
        final requestData = {'name': 'New Dealership', 'address': 'Test St'};
        final responseData = {
          'id': '1',
          'name': 'New Dealership',
          'address': 'Test St',
        };

        when(() => mockResponse.data).thenReturn(responseData);
        when(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final request = AppRequest<Map<String, dynamic>>.rest(
          method: RestMethod.post,
          endpoint: '/dealerships',
          params: requestData,
        );

        // Act (When)
        final result = await restClient.send(request);

        // Assert (Then)
        expect(result, responseData);
        verify(
          () => mockDio.post(
            '/dealerships',
            data: requestData,
            options: any(named: 'options'),
          ),
        ).called(1);
      });
    });

    group('Update (PUT)', () {
      test('given successful PUT request, '
          'when send is called, '
          'then should return updated data', () async {
        // Arrange (Given)
        final mockResponse = MockResponse<Map<String, dynamic>>();
        final requestData = {'name': 'Updated Dealership', 'address': 'New St'};
        final responseData = {
          'id': '1',
          'name': 'Updated Dealership',
          'address': 'New St',
        };

        when(() => mockResponse.data).thenReturn(responseData);
        when(
          () => mockDio.put(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final request = AppRequest<Map<String, dynamic>>.rest(
          method: RestMethod.put,
          endpoint: '/dealerships/1',
          params: requestData,
        );

        // Act (When)
        final result = await restClient.send(request);

        // Assert (Then)
        expect(result, responseData);
        verify(
          () => mockDio.put(
            '/dealerships/1',
            data: requestData,
            options: any(named: 'options'),
          ),
        ).called(1);
      });
    });

    group('Delete (DELETE)', () {
      test('given successful DELETE request, '
          'when send is called, '
          'then should complete successfully', () async {
        // Arrange (Given)
        final mockResponse = MockResponse<dynamic>();

        when(() => mockResponse.data).thenReturn(null);
        when(
          () => mockDio.delete(any(), options: any(named: 'options')),
        ).thenAnswer((_) async => mockResponse);

        final request = AppRequest<dynamic>.rest(
          method: RestMethod.delete,
          endpoint: '/dealerships/1',
        );

        // Act (When)
        await restClient.send(request);

        // Assert (Then)
        verify(
          () =>
              mockDio.delete('/dealerships/1', options: any(named: 'options')),
        ).called(1);
      });
    });

    group('Error Handling', () {
      test('given network error (connection timeout), '
          'when send is called, '
          'then should throw NetworkException', () async {
        // Arrange (Given)
        when(
          () => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/dealerships/1'),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        final request = AppRequest<Map<String, dynamic>>.rest(
          method: RestMethod.get,
          endpoint: '/dealerships/1',
        );

        // Act & Assert (When & Then)
        expect(
          () => restClient.send(request),
          throwsA(isA<NetworkException>()),
        );
      });

      test('given server error 404, '
          'when send is called, '
          'then should throw ServerException with status code', () async {
        // Arrange (Given)
        final response = Response(
          requestOptions: RequestOptions(path: '/dealerships/999'),
          statusCode: 404,
          data: 'Not found',
        );

        when(
          () => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/dealerships/999'),
            response: response,
            type: DioExceptionType.badResponse,
          ),
        );

        final request = AppRequest<Map<String, dynamic>>.rest(
          method: RestMethod.get,
          endpoint: '/dealerships/999',
        );

        // Act & Assert (When & Then)
        expect(
          () => restClient.send(request),
          throwsA(
            isA<ServerException>()
                .having((e) => e.statusCode, 'statusCode', 404)
                .having((e) => e.responseData, 'responseData', 'Not found'),
          ),
        );
      });
    });
  });
}
