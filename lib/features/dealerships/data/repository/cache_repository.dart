import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';

class CacheDealershipsRepository implements IDealershipsRepository {
  // TODO: Implement cache client
  // final CacheClient cacheClient;

  // TODO: Implement cache client
  // CacheDealershipsRepository({required this.cacheClient});

  @override
  Future<DealershipResponseDTO> create(DealershipCreateRequestDTO dealership) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<DealershipsDTO> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<DealershipResponseDTO> getOne(String id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<DealershipResponseDTO> update(DealershipUpdateRequestDTO dealership) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
