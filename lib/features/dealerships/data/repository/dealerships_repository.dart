import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/request/create_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/response/response_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/request/update_request_dto.dart';

typedef DealershipsDTO = List<DealershipResponseDTO>;

abstract interface class IDealershipsRepository {
  Future<DealershipsDTO> getAll();
  Future<DealershipResponseDTO> getOne(String id);
  Future<DealershipResponseDTO> create(
    DealershipCreateRequestDTO newDealership,
  );
  Future<DealershipResponseDTO> update(
    DealershipUpdateRequestDTO updatedDealership,
  );
  Future<void> delete(String id);
}
