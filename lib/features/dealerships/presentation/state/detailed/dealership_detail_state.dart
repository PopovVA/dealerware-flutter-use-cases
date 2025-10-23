import 'package:equatable/equatable.dart';
import 'package:dealerware_flutter_use_cases/features/dealerships/domain/entities/dealership_entity.dart';

/// Base state for single dealership detail
sealed class DealershipDetailState extends Equatable {
  const DealershipDetailState();
}

/// Initial state
class DealershipDetailInitial extends DealershipDetailState {
  const DealershipDetailInitial();

  @override
  List<Object?> get props => [];
}

/// Loading state
class DealershipDetailLoading extends DealershipDetailState {
  const DealershipDetailLoading();

  @override
  List<Object?> get props => [];
}

/// Loaded state with data
class DealershipDetailLoaded extends DealershipDetailState {
  final DealershipEntity dealership;

  const DealershipDetailLoaded(this.dealership);

  @override
  List<Object?> get props => [dealership];
}

/// Creating state
class DealershipDetailCreating extends DealershipDetailState {
  const DealershipDetailCreating();

  @override
  List<Object?> get props => [];
}

/// Created successfully
class DealershipDetailCreated extends DealershipDetailState {
  final DealershipEntity dealership;

  const DealershipDetailCreated(this.dealership);

  @override
  List<Object?> get props => [dealership];
}

/// Updating state
class DealershipDetailUpdating extends DealershipDetailState {
  final DealershipEntity dealership;

  const DealershipDetailUpdating(this.dealership);

  @override
  List<Object?> get props => [dealership];
}

/// Updated successfully
class DealershipDetailUpdated extends DealershipDetailState {
  final DealershipEntity dealership;

  const DealershipDetailUpdated(this.dealership);

  @override
  List<Object?> get props => [dealership];
}

/// Error state
class DealershipDetailError extends DealershipDetailState {
  final String message;
  final Object? error;

  const DealershipDetailError(this.message, [this.error]);

  @override
  List<Object?> get props => [message, error];
}
