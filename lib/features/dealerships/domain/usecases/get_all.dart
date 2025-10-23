import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/exceptions/dealership_exceptions.dart';

/// Use case for getting list of dealerships
class GetDealerships implements IUseCaseNoParams<List<DealershipEntity>> {
  final IDealershipsRepository repository;

  const GetDealerships(this.repository);

  @override
  Future<List<DealershipEntity>> call() async {
    try {
      final dto = await repository.getAll();
      return dto.map(DealershipEntity.fromDTO).toList();
    } on ApiException catch (e) {
      // Map technical exceptions to domain exceptions
      throw e.toDealershipException();
    } catch (e) {
      // Unexpected error
      throw DealershipNetworkException(e);
    }
  }
}
