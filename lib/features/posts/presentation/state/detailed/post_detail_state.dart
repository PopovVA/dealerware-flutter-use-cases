import 'package:equatable/equatable.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';

/// Base state for single post detail
sealed class PostDetailState extends Equatable {
  const PostDetailState();
}

/// Initial state
class PostDetailInitial extends PostDetailState {
  const PostDetailInitial();

  @override
  List<Object?> get props => [];
}

/// Loading state
class PostDetailLoading extends PostDetailState {
  const PostDetailLoading();

  @override
  List<Object?> get props => [];
}

/// Loaded state with data
class PostDetailLoaded extends PostDetailState {
  final PostEntity post;

  const PostDetailLoaded(this.post);

  @override
  List<Object?> get props => [post];
}

/// Creating state
class PostDetailCreating extends PostDetailState {
  const PostDetailCreating();

  @override
  List<Object?> get props => [];
}

/// Created successfully
class PostDetailCreated extends PostDetailState {
  final PostEntity post;

  const PostDetailCreated(this.post);

  @override
  List<Object?> get props => [post];
}

/// Updating state
class PostDetailUpdating extends PostDetailState {
  final PostEntity post;

  const PostDetailUpdating(this.post);

  @override
  List<Object?> get props => [post];
}

/// Updated successfully
class PostDetailUpdated extends PostDetailState {
  final PostEntity post;

  const PostDetailUpdated(this.post);

  @override
  List<Object?> get props => [post];
}

/// Error state
class PostDetailError extends PostDetailState {
  final String message;
  final Object? error;

  const PostDetailError(this.message, [this.error]);

  @override
  List<Object?> get props => [message, error];
}
