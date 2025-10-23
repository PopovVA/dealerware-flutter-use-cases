import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/exceptions/dealership_exceptions.dart';

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
    try {
      final dto = await repository.getOne(params.id);
      return DealershipEntity.fromDTO(dto);
    } on ApiException catch (e) {
      // Map technical exceptions to domain exceptions
      // Pass the ID for better error messages (e.g., "Dealership with id 'X' not found")
      throw e.toDealershipException(params.id);
    } catch (e) {
      // Unexpected error
      throw DealershipNetworkException(e);
    }
  }
}
