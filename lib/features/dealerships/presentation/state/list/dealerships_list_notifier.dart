import 'package:flutter/foundation.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/delete_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/usecases/get_all.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/presentation/state/list/dealerships_list_state.dart';

/// Notifier for managing dealerships list
class DealershipsListNotifier extends ChangeNotifier {
  final GetDealerships _getAllDealerships;
  final DeleteOneByIdDealership _deleteDealership;

  DealershipsListState _state = const DealershipsListInitial();

  DealershipsListState get state => _state;

  void _setState(DealershipsListState newState) {
    _state = newState;
    notifyListeners();
  }

  DealershipsListNotifier({
    required GetDealerships getAllDealerships,
    required DeleteOneByIdDealership deleteDealership,
  }) : _getAllDealerships = getAllDealerships,
       _deleteDealership = deleteDealership;

  /// Load all dealerships
  Future<void> getAll() async {
    _setState(const DealershipsListLoading());

    try {
      final dealerships = await _getAllDealerships();

      if (dealerships.isEmpty) {
        _setState(const DealershipsListEmpty());
      } else {
        _setState(DealershipsListLoaded(dealerships));
      }
    } catch (e, stackTrace) {
      debugPrint('Error loading dealerships: $e');
      debugPrint(stackTrace.toString());
      _setState(DealershipsListError('Failed to load dealerships', e));
    }
  }

  /// Delete a dealership by ID
  Future<void> deleteOneById(String id) async {
    final currentState = _state;

    // Only allow deletion when we have data
    if (currentState is! DealershipsListLoaded) return;

    // Show deleting state
    _setState(DealershipsListDeleting(currentState.dealerships, id));

    try {
      await _deleteDealership(DeleteOneByIdDealershipParams(id));

      // Remove from list and update state
      final updatedList = currentState.dealerships
          .where((dealership) => dealership.id != id)
          .toList();

      if (updatedList.isEmpty) {
        _setState(const DealershipsListEmpty());
      } else {
        _setState(DealershipsListLoaded(updatedList));
      }
    } catch (e, stackTrace) {
      debugPrint('Error deleting dealership: $e');
      debugPrint(stackTrace.toString());

      // Restore previous state and show error
      _setState(DealershipsListError('Failed to delete dealership', e));
    }
  }

  /// Refresh the list
  Future<void> refresh() async {
    await getAll();
  }

  /// Check if specific dealership is being deleted
  bool isDeletingId(String id) {
    final currentState = _state;
    if (currentState is DealershipsListDeleting) {
      return currentState.deletingId == id;
    }
    return false;
  }
}
