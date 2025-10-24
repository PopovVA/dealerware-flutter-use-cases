import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/delete_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/get_all.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/list/posts_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/posts/di/posts_providers.dart';

/// Notifier for managing posts list
class PostsListNotifier extends Notifier<PostsListState> {
  @override
  PostsListState build() {
    return const PostsListInitial();
  }

  /// Load all posts
  Future<void> getAll({int page = 1, int limit = 10}) async {
    state = const PostsListLoading();

    try {
      // Small delay to see loading state
      await Future.delayed(const Duration(milliseconds: 800));

      final posts = await ref
          .read(getPostsProvider)
          .call(GetPostsParams(page: page, limit: limit));

      if (posts.isEmpty) {
        state = const PostsListEmpty();
      } else {
        state = PostsListLoaded(posts, currentPage: page);
      }
    } on PostNetworkException catch (e) {
      state = PostsListError(
        'Network error. Please check your connection and try again',
        e,
      );
    } on PostException catch (e) {
      state = PostsListError(e.message, e);
    } catch (e) {
      state = PostsListError('Something went wrong. Please try again', e);
    }
  }

  /// Delete a post by ID
  Future<void> deleteOneById(String id) async {
    final currentState = state;

    // Only allow deletion when we have data
    if (currentState is! PostsListLoaded) return;

    // Show deleting state
    state = PostsListDeleting(currentState.posts, id);

    try {
      final deletePost = ref.read(deletePostProvider);
      await deletePost(DeleteOneByIdPostParams(id));

      // Remove from list and update state
      final updatedList = currentState.posts
          .where((post) => post.id != id)
          .toList();

      if (updatedList.isEmpty) {
        state = const PostsListEmpty();
      } else {
        state = PostsListLoaded(
          updatedList,
          currentPage: currentState.currentPage,
          hasMore: currentState.hasMore,
        );
      }
    } on PostNotFoundException catch (e) {
      state = PostsListError('Post not found', e);
    } on PostNetworkException catch (e) {
      state = PostsListError('Network error. Failed to delete post', e);
    } on PostException catch (e) {
      state = PostsListError(e.message, e);
    } catch (e) {
      state = PostsListError('Failed to delete post', e);
    }
  }

  /// Refresh the list
  Future<void> refresh() async {
    await getAll();
  }

  /// Check if specific post is being deleted
  bool isDeletingId(String id) {
    final currentState = state;
    if (currentState is PostsListDeleting) {
      return currentState.deletingId == id;
    }
    return false;
  }
}
