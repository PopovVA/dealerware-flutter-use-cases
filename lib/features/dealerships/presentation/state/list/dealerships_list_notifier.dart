import 'package:flutter/foundation.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/delete_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/list/dealerships_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/di/dealerships_providers.dart';

/// Notifier for managing dealerships list
class DealershipsListNotifier extends Notifier<DealershipsListState> {
  @override
  DealershipsListState build() {
    return const DealershipsListInitial();
  }

  /// Load all dealerships
  Future<void> getAll() async {
    state = const DealershipsListLoading();

    try {
      // Small delay to see loading state
      await Future.delayed(const Duration(milliseconds: 800));

      final dealerships = await ref.read(getDealershipsProvider).call();

      if (dealerships.isEmpty) {
        state = const DealershipsListEmpty();
      } else {
        state = DealershipsListLoaded(dealerships);
      }
    } catch (e, stackTrace) {
      debugPrint('Error loading dealerships: $e');
      debugPrint(stackTrace.toString());
      state = DealershipsListError('Failed to load dealerships', e);
    }
  }

  /// Delete a dealership by ID
  Future<void> deleteOneById(String id) async {
    final currentState = state;

    // Only allow deletion when we have data
    if (currentState is! DealershipsListLoaded) return;

    // Show deleting state
    state = DealershipsListDeleting(currentState.dealerships, id);

    try {
      final deleteDealership = ref.read(deleteDealershipProvider);
      await deleteDealership(DeleteOneByIdDealershipParams(id));

      // Remove from list and update state
      final updatedList = currentState.dealerships
          .where((dealership) => dealership.id != id)
          .toList();

      if (updatedList.isEmpty) {
        state = const DealershipsListEmpty();
      } else {
        state = DealershipsListLoaded(updatedList);
      }
    } catch (e, stackTrace) {
      debugPrint('Error deleting dealership: $e');
      debugPrint(stackTrace.toString());

      // Restore previous state and show error
      state = DealershipsListError('Failed to delete dealership', e);
    }
  }

  /// Refresh the list
  Future<void> refresh() async {
    await getAll();
  }

  /// Check if specific dealership is being deleted
  bool isDeletingId(String id) {
    final currentState = state;
    if (currentState is DealershipsListDeleting) {
      return currentState.deletingId == id;
    }
    return false;
  }
}
