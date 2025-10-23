import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/exceptions/dealership_exceptions.dart';

/// Parameters for updating a dealership
class UpdateDealershipParams extends IUseCaseParams {
  final String id;
  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;

  const UpdateDealershipParams({
    required this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [id, name, address, latitude, longitude];
}

/// Use case for updating an existing dealership
class UpdateDealership
    implements IUseCase<DealershipEntity, UpdateDealershipParams> {
  final IDealershipsRepository repository;

  const UpdateDealership(this.repository);

  @override
  Future<DealershipEntity> call(UpdateDealershipParams params) async {
    try {
      final dto = await repository.update(params.toUpdateRequestDTO());
      return DealershipEntity.fromDTO(dto);
    } on ApiException catch (e) {
      // Map technical exceptions to domain exceptions
      // Pass the ID for better error messages
      throw e.toDealershipException(params.id);
    } catch (e) {
      // Unexpected error
      throw DealershipNetworkException(e);
    }
  }
}
