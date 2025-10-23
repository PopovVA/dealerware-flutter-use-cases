import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';

/// Parameters for deleting a dealership
class DeleteDealershipParams extends IUseCaseParams {
  final String id;

  const DeleteDealershipParams(this.id);

  @override
  List<Object?> get props => [id];
}

/// Use case for deleting a dealership
class DeleteDealership implements IUseCase<void, DeleteDealershipParams> {
  final IDealershipsRepository repository;

  const DeleteDealership(this.repository);

  @override
  Future<void> call(DeleteDealershipParams params) async {
    return await repository.delete(params.id);
  }
}
