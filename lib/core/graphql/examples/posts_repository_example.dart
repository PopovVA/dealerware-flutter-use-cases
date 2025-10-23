import 'package:graphql_flutter/graphql_flutter.dart';
import '../operations/posts.graphql.dart';
import '../schema.graphql.dart';

/// Example repository showing how to use generated GraphQL code
/// This demonstrates the pattern that can be applied to Cars and other entities
class PostsGraphQLRepository {
  final GraphQLClient client;

  PostsGraphQLRepository({required this.client});

  /// Get all posts with pagination
  Future<Query$GetPosts$posts?> getPosts({int page = 1, int limit = 10}) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryGetPosts,
        variables: Variables$Query$GetPosts(
          options: Input$PageQueryOptions(
            paginate: Input$PaginateOptions(page: page, limit: limit),
          ),
        ).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = Query$GetPosts.fromJson(result.data!);
    return data.posts;
  }

  /// Get single post by ID
  Future<Fragment$PostFields?> getPostById(String id) async {
    final result = await client.query(
      QueryOptions(
        document: documentNodeQueryGetPost,
        variables: Variables$Query$GetPost(id: id).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = Query$GetPost.fromJson(result.data!);
    return data.post;
  }

  /// Create new post
  Future<Fragment$PostFields?> createPost({
    required String title,
    required String body,
  }) async {
    final result = await client.mutate(
      MutationOptions(
        document: documentNodeMutationCreatePost,
        variables: Variables$Mutation$CreatePost(
          input: Input$CreatePostInput(title: title, body: body),
        ).toJson(),
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = Mutation$CreatePost.fromJson(result.data!);
    return data.createPost;
  }

  /// Update existing post
  Future<Fragment$PostFields?> updatePost({
    required String id,
    String? title,
    String? body,
  }) async {
    final result = await client.mutate(
      MutationOptions(
        document: documentNodeMutationUpdatePost,
        variables: Variables$Mutation$UpdatePost(
          id: id,
          input: Input$UpdatePostInput(title: title, body: body),
        ).toJson(),
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = Mutation$UpdatePost.fromJson(result.data!);
    return data.updatePost;
  }

  /// Delete post
  Future<bool?> deletePost(String id) async {
    final result = await client.mutate(
      MutationOptions(
        document: documentNodeMutationDeletePost,
        variables: Variables$Mutation$DeletePost(id: id).toJson(),
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final data = Mutation$DeletePost.fromJson(result.data!);
    return data.deletePost;
  }
}

/// Example usage
Future<void> exampleUsage() async {
  // Initialize GraphQL client
  final httpLink = HttpLink('https://graphqlzero.almansi.me/api');
  final client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: InMemoryStore()),
  );

  // Create repository
  final repository = PostsGraphQLRepository(client: client);

  // Fetch posts
  final postsPage = await repository.getPosts(page: 1, limit: 5);
  print('Total posts: ${postsPage?.meta?.totalCount}');
  print('Fetched: ${postsPage?.data?.length} posts');

  // Get single post
  final post = await repository.getPostById('1');
  print('Post title: ${post?.title}');
  print('Author: ${post?.user?.name}');

  // Create post
  final newPost = await repository.createPost(
    title: 'New Post',
    body: 'This is a new post content',
  );
  print('Created post with ID: ${newPost?.id}');

  // Update post
  final updatedPost = await repository.updatePost(
    id: '1',
    title: 'Updated Title',
  );
  print('Updated post: ${updatedPost?.title}');

  // Delete post
  final deleted = await repository.deletePost('1');
  print('Post deleted: $deleted');
}
