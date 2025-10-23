import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';

/// Parameters for getting dealership by ID
class GetOneByIdParams extends IUseCaseParams {
  final String id;

  const GetOneByIdParams(this.id);

  @override
  List<Object?> get props => [id];
}

/// Use case for getting a single dealership by ID
class GetDealershipById
    implements IUseCase<DealershipEntity, GetOneByIdParams> {
  final IDealershipsRepository repository;

  const GetDealershipById(this.repository);

  @override
  Future<DealershipEntity> call(GetOneByIdParams params) async {
    final dto = await repository.getOne(params.id);
    return DealershipEntity.fromDTO(dto);
  }
}
