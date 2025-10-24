import 'package:dealerware_flutter_use_cases/core/api/graphql_client.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/graphql_posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/delete_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/get_all.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/get_one_by_id.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/update.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/detailed/post_detail_notifier.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/detailed/post_detail_state.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/list/posts_list_notifier.dart';
import 'package:dealerware_flutter_use_cases/features/posts/presentation/state/list/posts_list_state.dart';

/// Repository provider
final postsRepositoryProvider = Provider<IPostsRepository>((ref) {
  final graphqlClient = ref.read(graphqlClientProvider);
  return GraphQLPostsRepository(graphqlClient: graphqlClient);
});

/// Use Cases Providers
final getPostsProvider = Provider<GetPosts>((ref) {
  final repository = ref.watch(postsRepositoryProvider);
  return GetPosts(repository);
});

final getPostByIdProvider = Provider<GetOneByIdPost>((ref) {
  final repository = ref.watch(postsRepositoryProvider);
  return GetOneByIdPost(repository);
});

final createPostProvider = Provider<CreatePost>((ref) {
  final repository = ref.watch(postsRepositoryProvider);
  return CreatePost(repository);
});

final updatePostProvider = Provider<UpdatePost>((ref) {
  final repository = ref.watch(postsRepositoryProvider);
  return UpdatePost(repository);
});

final deletePostProvider = Provider<DeleteOneByIdPost>((ref) {
  final repository = ref.watch(postsRepositoryProvider);
  return DeleteOneByIdPost(repository);
});

/// Posts List Notifier Provider
final postsListNotifierProvider =
    NotifierProvider<PostsListNotifier, PostsListState>(
      PostsListNotifier.new,
      dependencies: [getPostsProvider, deletePostProvider],
    );

/// Post Detail Notifier Provider
final postDetailNotifierProvider =
    NotifierProvider<PostDetailNotifier, PostDetailState>(
      PostDetailNotifier.new,
      dependencies: [
        getPostByIdProvider,
        createPostProvider,
        updatePostProvider,
      ],
    );
