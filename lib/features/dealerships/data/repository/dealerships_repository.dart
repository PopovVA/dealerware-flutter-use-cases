import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/response_dto.dart';

typedef DealershipsDTO = List<DealershipResponseDTO>;

abstract interface class IDealershipsRepository {
  Future<DealershipsDTO> getAll();
  Future<DealershipResponseDTO> getOne(String id);
  Future<DealershipResponseDTO> create(DealershipResponseDTO dealership);
  Future<DealershipResponseDTO> update(DealershipResponseDTO dealership);
  Future<void> delete(String id);
}
