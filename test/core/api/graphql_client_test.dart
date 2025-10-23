import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gql/language.dart' as gql_lang;
import 'package:graphql_flutter/graphql_flutter.dart' as gql;
import 'package:mocktail/mocktail.dart';
import 'package:dealerware_flutter_use_cases/core/api/graphql_client.dart';
import 'package:dealerware_flutter_use_cases/core/api/request_client.dart';
import 'package:dealerware_flutter_use_cases/core/graphql/operations/posts.graphql.dart';
import 'package:dealerware_flutter_use_cases/core/graphql/schema.graphql.dart';

// Mock classes
class MockGraphQLClient extends Mock implements gql.GraphQLClient {}

class MockQueryResult extends Mock implements gql.QueryResult {}

void main() {
  group('GraphQLClient CRUD Operations', () {
    late MockGraphQLClient mockGqlClient;
    late GraphQLClient graphqlClient;
    const baseUrl = 'https://api.test.com/graphql';

    setUpAll(() {
      registerFallbackValue(
        gql.QueryOptions(document: gql.gql('query { test }')),
      );
      registerFallbackValue(
        gql.MutationOptions(document: gql.gql('mutation { test }')),
      );
    });

    setUp(() {
      mockGqlClient = MockGraphQLClient();
      graphqlClient = GraphQLClient(baseUrl: baseUrl, client: mockGqlClient);
    });

    test(
      'given successful query, when send is called, then should return data',
      () async {
        final mockResult = MockQueryResult();
        final responseData = {
          'post': {'id': '1', 'title': 'Test'},
        };

        when(() => mockResult.hasException).thenReturn(false);
        when(() => mockResult.data).thenReturn(responseData);
        when(
          () => mockGqlClient.query(any()),
        ).thenAnswer((_) async => mockResult);

        final request = AppRequest<Map<String, dynamic>>.graphql(
          operation: GraphQLOperation.query,
          operationName: 'GetPost',
          query: gql_lang.printNode(documentNodeQueryGetPost),
          variables: Variables$Query$GetPost(id: '1').toJson(),
        );

        final result = await graphqlClient.send(request);

        expect(result, responseData);
        verify(() => mockGqlClient.query(any())).called(1);
      },
    );

    test(
      'given successful create mutation, when send is called, then should create',
      () async {
        final mockResult = MockQueryResult();
        final responseData = {
          'createPost': {'id': '1', 'title': 'New Post'},
        };

        when(() => mockResult.hasException).thenReturn(false);
        when(() => mockResult.data).thenReturn(responseData);
        when(
          () => mockGqlClient.mutate(any()),
        ).thenAnswer((_) async => mockResult);

        final request = AppRequest<Map<String, dynamic>>.graphql(
          operation: GraphQLOperation.mutation,
          operationName: 'CreatePost',
          query: gql_lang.printNode(documentNodeMutationCreatePost),
          variables: Variables$Mutation$CreatePost(
            input: Input$CreatePostInput(title: 'New Post', body: 'Content'),
          ).toJson(),
        );

        final result = await graphqlClient.send(request);

        expect(result, responseData);
        verify(() => mockGqlClient.mutate(any())).called(1);
      },
    );

    test(
      'given successful update mutation, when send is called, then should update',
      () async {
        final mockResult = MockQueryResult();
        final responseData = {
          'updatePost': {'id': '1', 'title': 'Updated'},
        };

        when(() => mockResult.hasException).thenReturn(false);
        when(() => mockResult.data).thenReturn(responseData);
        when(
          () => mockGqlClient.mutate(any()),
        ).thenAnswer((_) async => mockResult);

        final request = AppRequest<Map<String, dynamic>>.graphql(
          operation: GraphQLOperation.mutation,
          operationName: 'UpdatePost',
          query: gql_lang.printNode(documentNodeMutationUpdatePost),
          variables: Variables$Mutation$UpdatePost(
            id: '1',
            input: Input$UpdatePostInput(title: 'Updated'),
          ).toJson(),
        );

        final result = await graphqlClient.send(request);

        expect(result, responseData);
        verify(() => mockGqlClient.mutate(any())).called(1);
      },
    );

    test(
      'given successful delete mutation, when send is called, then should delete',
      () async {
        final mockResult = MockQueryResult();
        final responseData = {'deletePost': true};

        when(() => mockResult.hasException).thenReturn(false);
        when(() => mockResult.data).thenReturn(responseData);
        when(
          () => mockGqlClient.mutate(any()),
        ).thenAnswer((_) async => mockResult);

        final request = AppRequest<Map<String, dynamic>>.graphql(
          operation: GraphQLOperation.mutation,
          operationName: 'DeletePost',
          query: gql_lang.printNode(documentNodeMutationDeletePost),
          variables: Variables$Mutation$DeletePost(id: '1').toJson(),
        );

        final result = await graphqlClient.send(request);

        expect(result, responseData);
        verify(() => mockGqlClient.mutate(any())).called(1);
      },
    );
  });
}
