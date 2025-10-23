// ignore: depend_on_referenced_packages
import 'package:gql/language.dart' as gql_lang;
import 'package:dealerware_flutter_use_cases/core/api/graphql_client.dart';
import 'package:dealerware_flutter_use_cases/core/api/request_client.dart';
import 'package:dealerware_flutter_use_cases/core/graphql/operations/posts.graphql.dart';
import 'package:dealerware_flutter_use_cases/core/graphql/schema.graphql.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/dto/dto.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';

/// GraphQL implementation of Posts repository
class GraphQLPostsRepository implements IPostsRepository {
  final GraphQLClient graphqlClient;

  GraphQLPostsRepository({required this.graphqlClient});

  @override
  Future<PostsDTO> getAll({int page = 1, int limit = 10}) async {
    try {
      final request = AppRequest<Map<String, dynamic>>.graphql(
        operation: GraphQLOperation.query,
        operationName: 'GetPosts',
        query: gql_lang.printNode(documentNodeQueryGetPosts),
        variables: Variables$Query$GetPosts(
          options: Input$PageQueryOptions(
            paginate: Input$PaginateOptions(page: page, limit: limit),
          ),
        ).toJson(),
      );

      final response = await graphqlClient.send(request);
      final data = Query$GetPosts.fromJson(response);

      // Convert generated types to DTOs
      final posts =
          data.posts?.data?.map((post) {
            return PostResponseDTO(
              id: post?.id ?? '',
              title: post?.title,
              body: post?.body,
            );
          }).toList() ??
          [];

      return posts;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostResponseDTO> getOne(String id) async {
    try {
      final request = AppRequest<Map<String, dynamic>>.graphql(
        operation: GraphQLOperation.query,
        operationName: 'GetPost',
        query: gql_lang.printNode(documentNodeQueryGetPost),
        variables: Variables$Query$GetPost(id: id).toJson(),
      );

      final response = await graphqlClient.send(request);
      final data = Query$GetPost.fromJson(response);

      final post = data.post!;
      return PostResponseDTO(
        id: post.id ?? '',
        title: post.title,
        body: post.body,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostResponseDTO> create(PostCreateRequestDTO newPost) async {
    try {
      final request = AppRequest<Map<String, dynamic>>.graphql(
        operation: GraphQLOperation.mutation,
        operationName: 'CreatePost',
        query: gql_lang.printNode(documentNodeMutationCreatePost),
        variables: Variables$Mutation$CreatePost(
          input: Input$CreatePostInput(
            title: newPost.title,
            body: newPost.body,
          ),
        ).toJson(),
      );

      final response = await graphqlClient.send(request);
      final data = Mutation$CreatePost.fromJson(response);

      final post = data.createPost!;
      return PostResponseDTO(
        id: post.id ?? '',
        title: post.title,
        body: post.body,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostResponseDTO> update(PostUpdateRequestDTO updatedPost) async {
    try {
      final request = AppRequest<Map<String, dynamic>>.graphql(
        operation: GraphQLOperation.mutation,
        operationName: 'UpdatePost',
        query: gql_lang.printNode(documentNodeMutationUpdatePost),
        variables: Variables$Mutation$UpdatePost(
          id: updatedPost.id,
          input: Input$UpdatePostInput(
            title: updatedPost.title,
            body: updatedPost.body,
          ),
        ).toJson(),
      );

      final response = await graphqlClient.send(request);
      final data = Mutation$UpdatePost.fromJson(response);

      final post = data.updatePost!;
      return PostResponseDTO(
        id: post.id ?? '',
        title: post.title,
        body: post.body,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final request = AppRequest<Map<String, dynamic>>.graphql(
        operation: GraphQLOperation.mutation,
        operationName: 'DeletePost',
        query: gql_lang.printNode(documentNodeMutationDeletePost),
        variables: Variables$Mutation$DeletePost(id: id).toJson(),
      );

      await graphqlClient.send(request);
    } catch (e) {
      rethrow;
    }
  }
}
