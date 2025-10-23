import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    } catch (e, stackTrace) {
      debugPrint('Error loading dealership: $e');
      debugPrint(stackTrace.toString());
      state = DealershipDetailError('Failed to load dealership', e);
    }
  }

  /// Create new dealership
  Future<void> createDealership(CreateDealershipParams params) async {
    state = const DealershipDetailCreating();

    try {
      final createDealership = ref.read(createDealershipProvider);
      final dealership = await createDealership(params);
      state = DealershipDetailCreated(dealership);
    } catch (e, stackTrace) {
      debugPrint('Error creating dealership: $e');
      debugPrint(stackTrace.toString());
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
    } catch (e, stackTrace) {
      debugPrint('Error updating dealership: $e');
      debugPrint(stackTrace.toString());
      state = DealershipDetailError('Failed to update dealership', e);
    }
  }

  /// Reset to initial state
  void reset() {
    state = const DealershipDetailInitial();
  }
}
