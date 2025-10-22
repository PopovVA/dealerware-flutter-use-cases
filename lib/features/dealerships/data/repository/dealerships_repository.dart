import 'package:dealerware_flutter_use_cases/core/api/request_client.dart';
import 'package:dealerware_flutter_use_cases/core/api/rest_client.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/dealership_DTO.dart';

typedef DealershipsDTO = List<DealershipDTO>;

abstract interface class IDealershipsRepository {
  Future<DealershipsDTO> getDealerships();
  Future<DealershipDTO> getDealership(String id);
  Future<DealershipDTO> create(DealershipDTO dealership);
  Future<DealershipDTO> update(DealershipDTO dealership);
  Future<void> delete(String id);
}

class DealershipsRepository implements IDealershipsRepository {
  final RestClient restClient;

  DealershipsRepository({required this.restClient});

  @override
  Future<DealershipDTO> create(DealershipDTO dealership) async {
    try {
      final request = AppRequest<DealershipDTO>.rest(
        method: RestMethod.post,
        endpoint: '/dealerships',
        params: dealership.toJson(),
      );
      return await restClient.send<DealershipDTO>(request);
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
  Future<DealershipDTO> getDealership(String id) async {
    try {
      final request = AppRequest<DealershipDTO>.rest(
        method: RestMethod.get,
        endpoint: '/dealerships/$id',
      );
      return await restClient.send<DealershipDTO>(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DealershipsDTO> getDealerships() async {
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
  Future<DealershipDTO> update(DealershipDTO dealership) async {
    try {
      final request = AppRequest<DealershipDTO>.rest(
        method: RestMethod.put,
        endpoint: '/dealerships/${dealership.id}',
        params: dealership.toJson(),
      );
      return await restClient.send<DealershipDTO>(request);
    } catch (e) {
      rethrow;
    }
  }
}
