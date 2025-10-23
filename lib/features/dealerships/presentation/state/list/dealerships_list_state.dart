import 'package:equatable/equatable.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';

/// Base state for dealerships list
sealed class DealershipsListState extends Equatable {
  const DealershipsListState();
}

/// Initial state
class DealershipsListInitial extends DealershipsListState {
  const DealershipsListInitial();

  @override
  List<Object?> get props => [];
}

/// Loading state
class DealershipsListLoading extends DealershipsListState {
  const DealershipsListLoading();

  @override
  List<Object?> get props => [];
}

/// Success state with data
class DealershipsListLoaded extends DealershipsListState {
  final List<DealershipEntity> dealerships;

  const DealershipsListLoaded(this.dealerships);

  bool get isEmpty => dealerships.isEmpty;
  bool get isNotEmpty => dealerships.isNotEmpty;

  @override
  List<Object?> get props => [dealerships];
}

/// Empty state (no dealerships)
class DealershipsListEmpty extends DealershipsListState {
  const DealershipsListEmpty();

  @override
  List<Object?> get props => [];
}

/// Error state
class DealershipsListError extends DealershipsListState {
  final String message;
  final Object? error;

  const DealershipsListError(this.message, [this.error]);

  @override
  List<Object?> get props => [message, error];
}

/// Deleting state (showing loading for specific item)
class DealershipsListDeleting extends DealershipsListState {
  final List<DealershipEntity> dealerships;
  final String deletingId;

  const DealershipsListDeleting(this.dealerships, this.deletingId);

  @override
  List<Object?> get props => [dealerships, deletingId];
}
