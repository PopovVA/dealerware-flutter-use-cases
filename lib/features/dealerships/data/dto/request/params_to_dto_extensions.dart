import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/request/create_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/request/update_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/update.dart';

/// Extension to convert CreateDealershipParams to Request DTO
extension CreateParamsToDTO on CreateDealershipParams {
  DealershipCreateRequestDTO toCreateRequestDTO() {
    return DealershipCreateRequestDTO(
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

/// Extension to convert UpdateDealershipParams to Request DTO
extension UpdateParamsToDTO on UpdateDealershipParams {
  DealershipUpdateRequestDTO toUpdateRequestDTO() {
    return DealershipUpdateRequestDTO(
      id: id,
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
