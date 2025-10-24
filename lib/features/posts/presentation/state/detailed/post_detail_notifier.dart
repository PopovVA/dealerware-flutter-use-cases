import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/get_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/detailed/post_detail_state.dart';
import 'package:dealerware_flutter_use_cases/features/posts/di/posts_providers.dart';

/// Notifier for managing single post (create, update, get by id)
class PostDetailNotifier extends Notifier<PostDetailState> {
  @override
  PostDetailState build() {
    return const PostDetailInitial();
  }

  /// Load post by ID
  Future<void> loadPostById(String id) async {
    state = const PostDetailLoading();

    try {
      final getPostById = ref.read(getPostByIdProvider);
      final post = await getPostById(GetOneByIdPostParams(id));
      state = PostDetailLoaded(post);
    } on PostNotFoundException catch (e) {
      state = PostDetailError('Post not found', e);
    } on PostNetworkException catch (e) {
      state = PostDetailError('Network error. Please check your connection', e);
    } on PostException catch (e) {
      state = PostDetailError(e.message, e);
    } catch (e) {
      state = PostDetailError('Something went wrong', e);
    }
  }

  /// Create new post
  Future<void> createPost(CreatePostParams params) async {
    state = const PostDetailCreating();

    try {
      final createPost = ref.read(createPostProvider);
      final post = await createPost(params);
      state = PostDetailCreated(post);
    } on PostNetworkException catch (e) {
      state = PostDetailError('Network error. Failed to create post', e);
    } on PostException catch (e) {
      state = PostDetailError(e.message, e);
    } catch (e) {
      state = PostDetailError('Failed to create post', e);
    }
  }

  /// Update existing post
  Future<void> updatePost(UpdatePostParams params) async {
    final currentState = state;

    // Show current post while updating if available
    if (currentState is PostDetailLoaded) {
      state = PostDetailUpdating(currentState.post);
    } else {
      state = const PostDetailLoading();
    }

    try {
      final updatePost = ref.read(updatePostProvider);
      final post = await updatePost(params);
      state = PostDetailUpdated(post);
    } on PostNotFoundException catch (e) {
      state = PostDetailError('Post not found', e);
    } on PostNetworkException catch (e) {
      state = PostDetailError('Network error. Failed to update post', e);
    } on PostException catch (e) {
      state = PostDetailError(e.message, e);
    } catch (e) {
      state = PostDetailError('Failed to update post', e);
    }
  }

  /// Reset to initial state
  void reset() {
    state = const PostDetailInitial();
  }
}
