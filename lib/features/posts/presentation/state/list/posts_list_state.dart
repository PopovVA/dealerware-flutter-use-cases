import 'package:equatable/equatable.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';

/// Base state for posts list
sealed class PostsListState extends Equatable {
  const PostsListState();
}

/// Initial state
class PostsListInitial extends PostsListState {
  const PostsListInitial();

  @override
  List<Object?> get props => [];
}

/// Loading state
class PostsListLoading extends PostsListState {
  const PostsListLoading();

  @override
  List<Object?> get props => [];
}

/// Success state with data
class PostsListLoaded extends PostsListState {
  final List<PostEntity> posts;
  final int currentPage;
  final bool hasMore;

  const PostsListLoaded(
    this.posts, {
    this.currentPage = 1,
    this.hasMore = true,
  });

  bool get isEmpty => posts.isEmpty;
  bool get isNotEmpty => posts.isNotEmpty;

  @override
  List<Object?> get props => [posts, currentPage, hasMore];
}

/// Empty state (no posts)
class PostsListEmpty extends PostsListState {
  const PostsListEmpty();

  @override
  List<Object?> get props => [];
}

/// Error state
class PostsListError extends PostsListState {
  final String message;
  final Object? error;

  const PostsListError(this.message, [this.error]);

  @override
  List<Object?> get props => [message, error];
}

/// Deleting state (showing loading for specific item)
class PostsListDeleting extends PostsListState {
  final List<PostEntity> posts;
  final String deletingId;

  const PostsListDeleting(this.posts, this.deletingId);

  @override
  List<Object?> get props => [posts, deletingId];
}
