import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';

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
    return await repository.delete(params.id);
  }
}
