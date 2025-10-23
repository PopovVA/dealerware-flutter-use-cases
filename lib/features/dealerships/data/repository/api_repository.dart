import 'package:dealerware_flutter_use_cases/core/api/request_client.dart';
import 'package:dealerware_flutter_use_cases/core/api/rest_client.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/response_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';

class ApiDealershipsRepository implements IDealershipsRepository {
  final RestClient restClient;

  ApiDealershipsRepository({required this.restClient});

  @override
  Future<DealershipResponseDTO> create(DealershipResponseDTO dealership) async {
    try {
      final request = AppRequest<DealershipResponseDTO>.rest(
        method: RestMethod.post,
        endpoint: '/dealerships',
        params: dealership.toJson(),
      );
      return await restClient.send<DealershipResponseDTO>(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final request = AppRequest<void>.rest(
        method: RestMethod.delete,
        endpoint: '/dealerships/$id',
      );
      await restClient.send<void>(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DealershipResponseDTO> getOne(String id) async {
    try {
      final request = AppRequest<DealershipResponseDTO>.rest(
        method: RestMethod.get,
        endpoint: '/dealerships/$id',
      );
      return await restClient.send<DealershipResponseDTO>(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DealershipsDTO> getAll() async {
    try {
      final request = AppRequest<DealershipsDTO>.rest(
        method: RestMethod.get,
        endpoint: '/dealerships',
      );
      return await restClient.send<DealershipsDTO>(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DealershipResponseDTO> update(DealershipResponseDTO dealership) async {
    try {
      final request = AppRequest<DealershipResponseDTO>.rest(
        method: RestMethod.put,
        endpoint: '/dealerships/${dealership.id}',
        params: dealership.toJson(),
      );
      return await restClient.send<DealershipResponseDTO>(request);
    } catch (e) {
      rethrow;
    }
  }
}
