import 'package:dealerware_flutter_use_cases/core/api/rest_client.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/data/repository/dealerships_repository.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/delete_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/get_all.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/get_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/detailed/dealership_detail_notifier.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/detailed/dealership_detail_state.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/list/dealerships_list_notifier.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/list/dealerships_list_state.dart';

/// Repository provider
final dealershipsRepositoryProvider = Provider<IDealershipsRepository>((ref) {
  final restClient = ref.read(restClientProvider);
  return ApiDealershipsRepository(restClient: restClient);
});

/// Use Cases Providers
final getDealershipsProvider = Provider<GetDealerships>((ref) {
  final repository = ref.watch(dealershipsRepositoryProvider);
  return GetDealerships(repository);
});

final getDealershipByIdProvider = Provider<GetDealershipById>((ref) {
  final repository = ref.watch(dealershipsRepositoryProvider);
  return GetDealershipById(repository);
});

final createDealershipProvider = Provider<CreateDealership>((ref) {
  final repository = ref.watch(dealershipsRepositoryProvider);
  return CreateDealership(repository);
});

final updateDealershipProvider = Provider<UpdateDealership>((ref) {
  final repository = ref.watch(dealershipsRepositoryProvider);
  return UpdateDealership(repository);
});

final deleteDealershipProvider = Provider<DeleteOneByIdDealership>((ref) {
  final repository = ref.watch(dealershipsRepositoryProvider);
  return DeleteOneByIdDealership(repository);
});

/// Dealerships List Notifier Provider
final dealershipsListNotifierProvider =
    NotifierProvider<DealershipsListNotifier, DealershipsListState>(
      DealershipsListNotifier.new,
      dependencies: [getDealershipsProvider, deleteDealershipProvider],
    );

/// Dealership Detail Notifier Provider
final dealershipDetailNotifierProvider =
    NotifierProvider<DealershipDetailNotifier, DealershipDetailState>(
      DealershipDetailNotifier.new,
      dependencies: [
        getDealershipByIdProvider,
        createDealershipProvider,
        updateDealershipProvider,
      ],
    );
