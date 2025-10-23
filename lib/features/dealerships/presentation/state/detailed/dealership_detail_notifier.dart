import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/get_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/detailed/dealership_detail_state.dart';

/// Notifier for managing single dealership (create, update, get by id)
class DealershipDetailNotifier extends Notifier<DealershipDetailState> {
  final GetDealershipById _getDealershipById;
  final CreateDealership _createDealership;
  final UpdateDealership _updateDealership;

  DealershipDetailNotifier({
    required GetDealershipById getDealershipById,
    required CreateDealership createDealership,
    required UpdateDealership updateDealership,
  }) : _getDealershipById = getDealershipById,
       _createDealership = createDealership,
       _updateDealership = updateDealership;

  @override
  DealershipDetailState build() {
    return const DealershipDetailInitial();
  }

  /// Load dealership by ID
  Future<void> loadDealershipById(String id) async {
    state = const DealershipDetailLoading();

    try {
      final dealership = await _getDealershipById(GetOneByIdParams(id));
      state = DealershipDetailLoaded(dealership);
    } catch (e, stackTrace) {
      print('Error loading dealership: $e');
      print(stackTrace);
      state = DealershipDetailError('Failed to load dealership', e);
    }
  }

  /// Create new dealership
  Future<void> createDealership(CreateDealershipParams params) async {
    state = const DealershipDetailCreating();

    try {
      final dealership = await _createDealership(params);
      state = DealershipDetailCreated(dealership);
    } catch (e, stackTrace) {
      print('Error creating dealership: $e');
      print(stackTrace);
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
      final dealership = await _updateDealership(params);
      state = DealershipDetailUpdated(dealership);
    } catch (e, stackTrace) {
      print('Error updating dealership: $e');
      print(stackTrace);
      state = DealershipDetailError('Failed to update dealership', e);
    }
  }

  /// Reset to initial state
  void reset() {
    state = const DealershipDetailInitial();
  }
}
