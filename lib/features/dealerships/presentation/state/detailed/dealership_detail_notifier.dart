import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/exceptions/dealership_exceptions.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/get_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/detailed/dealership_detail_state.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/di/dealerships_providers.dart';

/// Notifier for managing single dealership (create, update, get by id)
class DealershipDetailNotifier extends Notifier<DealershipDetailState> {
  @override
  DealershipDetailState build() {
    return const DealershipDetailInitial();
  }

  /// Load dealership by ID
  Future<void> loadDealershipById(String id) async {
    state = const DealershipDetailLoading();

    try {
      final getDealershipById = ref.read(getDealershipByIdProvider);
      final dealership = await getDealershipById(GetOneByIdParams(id));
      state = DealershipDetailLoaded(dealership);
    } on DealershipNotFoundException catch (e) {
      state = DealershipDetailError('Dealership not found', e);
    } on DealershipNetworkException catch (e) {
      state = DealershipDetailError(
        'Network error. Please check your connection',
        e,
      );
    } on DealershipException catch (e) {
      state = DealershipDetailError(e.message, e);
    } catch (e) {
      state = DealershipDetailError('Something went wrong', e);
    }
  }

  /// Create new dealership
  Future<void> createDealership(CreateDealershipParams params) async {
    state = const DealershipDetailCreating();

    try {
      final createDealership = ref.read(createDealershipProvider);
      final dealership = await createDealership(params);
      state = DealershipDetailCreated(dealership);
    } on DealershipNetworkException catch (e) {
      state = DealershipDetailError(
        'Network error. Failed to create dealership',
        e,
      );
    } on DealershipException catch (e) {
      state = DealershipDetailError(e.message, e);
    } catch (e) {
      state = DealershipDetailError('Failed to create dealership', e);
    }
  }

  /// Update existing dealership
  Future<void> updateDealership(UpdateDealershipParams params) async {
    final currentState = state;

    // Show current dealership while updating if available
    if (currentState is DealershipDetailLoaded) {
      state = DealershipDetailUpdating(currentState.dealership);
    } else {
      state = const DealershipDetailLoading();
    }

    try {
      final updateDealership = ref.read(updateDealershipProvider);
      final dealership = await updateDealership(params);
      state = DealershipDetailUpdated(dealership);
    } on DealershipNotFoundException catch (e) {
      state = DealershipDetailError('Dealership not found', e);
    } on DealershipNetworkException catch (e) {
      state = DealershipDetailError(
        'Network error. Failed to update dealership',
        e,
      );
    } on DealershipException catch (e) {
      state = DealershipDetailError(e.message, e);
    } catch (e) {
      state = DealershipDetailError('Failed to update dealership', e);
    }
  }

  /// Reset to initial state
  void reset() {
    state = const DealershipDetailInitial();
  }
}
