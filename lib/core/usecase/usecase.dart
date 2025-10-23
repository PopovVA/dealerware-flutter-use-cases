import 'package:equatable/equatable.dart';

/// Base interface for all use cases
/// [Type] - return type
/// [Params] - input parameters type
abstract class IUseCase<T, Params> {
  Future<T> call(Params params);
}

/// Use case without parameters
abstract class IUseCaseNoParams<T> {
  Future<T> call();
}

/// Base class for use case parameters
abstract class IUseCaseParams extends Equatable {
  const IUseCaseParams();
}

/// Empty parameters for use cases without input
class NoParams extends IUseCaseParams {
  const NoParams();

  @override
  List<Object?> get props => [];
}
