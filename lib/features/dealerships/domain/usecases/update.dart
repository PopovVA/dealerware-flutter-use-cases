import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/dto/dto.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';

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
    final dto = await repository.update(params.toUpdateRequestDTO());
    return DealershipEntity.fromDTO(dto);
  }
}
