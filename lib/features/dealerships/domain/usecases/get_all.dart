import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';

/// Use case for getting list of dealerships
class GetDealerships implements IUseCaseNoParams<List<DealershipEntity>> {
  final IDealershipsRepository repository;

  const GetDealerships(this.repository);

  @override
  Future<List<DealershipEntity>> call() async {
    try {
      final dto = await repository.getAll();
      return dto.map(DealershipEntity.fromDTO).toList();
    } catch (e) {
      rethrow;
    }
  }
}
