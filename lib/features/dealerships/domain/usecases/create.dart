import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';

/// Parameters for creating a new dealership
class CreateDealershipParams extends IUseCaseParams {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  const CreateDealershipParams({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [name, address, latitude, longitude];
}

/// Use case for creating a new dealership
class CreateDealership
    implements IUseCase<DealershipEntity, CreateDealershipParams> {
  final IDealershipsRepository repository;

  const CreateDealership(this.repository);

  @override
  Future<DealershipEntity> call(CreateDealershipParams params) async {
    final dto = await repository.create(
      name: params.name,
      address: params.address,
      latitude: params.latitude,
      longitude: params.longitude,
    );
    return DealershipEntity.fromDTO(dto);
  }
}
