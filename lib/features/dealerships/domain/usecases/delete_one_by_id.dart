import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/exceptions/dealership_exceptions.dart';

/// Parameters for deleting a dealership
class DeleteOneByIdDealershipParams extends IUseCaseParams {
  final String id;

  const DeleteOneByIdDealershipParams(this.id);

  @override
  List<Object?> get props => [id];
}

/// Use case for deleting a dealership
class DeleteOneByIdDealership
    implements IUseCase<void, DeleteOneByIdDealershipParams> {
  final IDealershipsRepository repository;

  const DeleteOneByIdDealership(this.repository);

  @override
  Future<void> call(DeleteOneByIdDealershipParams params) async {
    try {
      return await repository.delete(params.id);
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
