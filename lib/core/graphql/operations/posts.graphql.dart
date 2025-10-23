import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$PostFields {
  Fragment$PostFields({
    this.id,
    this.title,
    this.body,
    this.user,
    this.$__typename = 'Post',
  });

  factory Fragment$PostFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Fragment$PostFields(
      id: (l$id as String?),
      title: (l$title as String?),
      body: (l$body as String?),
      user: l$user == null
          ? null
          : Fragment$PostFields$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? title;

  final String? body;

  final Fragment$PostFields$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$body = body;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$title, l$body, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$PostFields || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$PostFields on Fragment$PostFields {
  CopyWith$Fragment$PostFields<Fragment$PostFields> get copyWith =>
      CopyWith$Fragment$PostFields(this, (i) => i);
}

abstract class CopyWith$Fragment$PostFields<TRes> {
  factory CopyWith$Fragment$PostFields(
    Fragment$PostFields instance,
    TRes Function(Fragment$PostFields) then,
  ) = _CopyWithImpl$Fragment$PostFields;

  factory CopyWith$Fragment$PostFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PostFields;

  TRes call({
    String? id,
    String? title,
    String? body,
    Fragment$PostFields$user? user,
    String? $__typename,
  });
  CopyWith$Fragment$PostFields$user<TRes> get user;
}

class _CopyWithImpl$Fragment$PostFields<TRes>
    implements CopyWith$Fragment$PostFields<TRes> {
  _CopyWithImpl$Fragment$PostFields(this._instance, this._then);

  final Fragment$PostFields _instance;

  final TRes Function(Fragment$PostFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$PostFields(
      id: id == _undefined ? _instance.id : (id as String?),
      title: title == _undefined ? _instance.title : (title as String?),
      body: body == _undefined ? _instance.body : (body as String?),
      user: user == _undefined
          ? _instance.user
          : (user as Fragment$PostFields$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$PostFields$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Fragment$PostFields$user.stub(_then(_instance))
        : CopyWith$Fragment$PostFields$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Fragment$PostFields<TRes>
    implements CopyWith$Fragment$PostFields<TRes> {
  _CopyWithStubImpl$Fragment$PostFields(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? body,
    Fragment$PostFields$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$PostFields$user<TRes> get user =>
      CopyWith$Fragment$PostFields$user.stub(_res);
}

const fragmentDefinitionPostFields = FragmentDefinitionNode(
  name: NameNode(value: 'PostFields'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Post'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'title'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'email'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentPostFields = DocumentNode(
  definitions: [fragmentDefinitionPostFields],
);

extension ClientExtension$Fragment$PostFields on graphql.GraphQLClient {
  void writeFragment$PostFields({
    required Fragment$PostFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'PostFields',
        document: documentNodeFragmentPostFields,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$PostFields? readFragment$PostFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PostFields',
          document: documentNodeFragmentPostFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$PostFields.fromJson(result);
  }
}

class Fragment$PostFields$user {
  Fragment$PostFields$user({
    this.id,
    this.name,
    this.email,
    this.$__typename = 'User',
  });

  factory Fragment$PostFields$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Fragment$PostFields$user(
      id: (l$id as String?),
      name: (l$name as String?),
      email: (l$email as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? name;

  final String? email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$email, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$PostFields$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$PostFields$user
    on Fragment$PostFields$user {
  CopyWith$Fragment$PostFields$user<Fragment$PostFields$user> get copyWith =>
      CopyWith$Fragment$PostFields$user(this, (i) => i);
}

abstract class CopyWith$Fragment$PostFields$user<TRes> {
  factory CopyWith$Fragment$PostFields$user(
    Fragment$PostFields$user instance,
    TRes Function(Fragment$PostFields$user) then,
  ) = _CopyWithImpl$Fragment$PostFields$user;

  factory CopyWith$Fragment$PostFields$user.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PostFields$user;

  TRes call({String? id, String? name, String? email, String? $__typename});
}

class _CopyWithImpl$Fragment$PostFields$user<TRes>
    implements CopyWith$Fragment$PostFields$user<TRes> {
  _CopyWithImpl$Fragment$PostFields$user(this._instance, this._then);

  final Fragment$PostFields$user _instance;

  final TRes Function(Fragment$PostFields$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$PostFields$user(
      id: id == _undefined ? _instance.id : (id as String?),
      name: name == _undefined ? _instance.name : (name as String?),
      email: email == _undefined ? _instance.email : (email as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$PostFields$user<TRes>
    implements CopyWith$Fragment$PostFields$user<TRes> {
  _CopyWithStubImpl$Fragment$PostFields$user(this._res);

  TRes _res;

  call({String? id, String? name, String? email, String? $__typename}) => _res;
}

class Variables$Query$GetPosts {
  factory Variables$Query$GetPosts({Input$PageQueryOptions? options}) =>
      Variables$Query$GetPosts._({if (options != null) r'options': options});

  Variables$Query$GetPosts._(this._$data);

  factory Variables$Query$GetPosts.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('options')) {
      final l$options = data['options'];
      result$data['options'] = l$options == null
          ? null
          : Input$PageQueryOptions.fromJson(
              (l$options as Map<String, dynamic>),
            );
    }
    return Variables$Query$GetPosts._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PageQueryOptions? get options =>
      (_$data['options'] as Input$PageQueryOptions?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('options')) {
      final l$options = options;
      result$data['options'] = l$options?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetPosts<Variables$Query$GetPosts> get copyWith =>
      CopyWith$Variables$Query$GetPosts(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetPosts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (_$data.containsKey('options') != other._$data.containsKey('options')) {
      return false;
    }
    if (l$options != lOther$options) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$options = options;
    return Object.hashAll([
      _$data.containsKey('options') ? l$options : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetPosts<TRes> {
  factory CopyWith$Variables$Query$GetPosts(
    Variables$Query$GetPosts instance,
    TRes Function(Variables$Query$GetPosts) then,
  ) = _CopyWithImpl$Variables$Query$GetPosts;

  factory CopyWith$Variables$Query$GetPosts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetPosts;

  TRes call({Input$PageQueryOptions? options});
}

class _CopyWithImpl$Variables$Query$GetPosts<TRes>
    implements CopyWith$Variables$Query$GetPosts<TRes> {
  _CopyWithImpl$Variables$Query$GetPosts(this._instance, this._then);

  final Variables$Query$GetPosts _instance;

  final TRes Function(Variables$Query$GetPosts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? options = _undefined}) => _then(
    Variables$Query$GetPosts._({
      ..._instance._$data,
      if (options != _undefined)
        'options': (options as Input$PageQueryOptions?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetPosts<TRes>
    implements CopyWith$Variables$Query$GetPosts<TRes> {
  _CopyWithStubImpl$Variables$Query$GetPosts(this._res);

  TRes _res;

  call({Input$PageQueryOptions? options}) => _res;
}

class Query$GetPosts {
  Query$GetPosts({this.posts, this.$__typename = 'Query'});

  factory Query$GetPosts.fromJson(Map<String, dynamic> json) {
    final l$posts = json['posts'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts(
      posts: l$posts == null
          ? null
          : Query$GetPosts$posts.fromJson((l$posts as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetPosts$posts? posts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$posts = posts;
    _resultData['posts'] = l$posts?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$posts = posts;
    final l$$__typename = $__typename;
    return Object.hashAll([l$posts, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$posts = posts;
    final lOther$posts = other.posts;
    if (l$posts != lOther$posts) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts on Query$GetPosts {
  CopyWith$Query$GetPosts<Query$GetPosts> get copyWith =>
      CopyWith$Query$GetPosts(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts<TRes> {
  factory CopyWith$Query$GetPosts(
    Query$GetPosts instance,
    TRes Function(Query$GetPosts) then,
  ) = _CopyWithImpl$Query$GetPosts;

  factory CopyWith$Query$GetPosts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts;

  TRes call({Query$GetPosts$posts? posts, String? $__typename});
  CopyWith$Query$GetPosts$posts<TRes> get posts;
}

class _CopyWithImpl$Query$GetPosts<TRes>
    implements CopyWith$Query$GetPosts<TRes> {
  _CopyWithImpl$Query$GetPosts(this._instance, this._then);

  final Query$GetPosts _instance;

  final TRes Function(Query$GetPosts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? posts = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetPosts(
          posts: posts == _undefined
              ? _instance.posts
              : (posts as Query$GetPosts$posts?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetPosts$posts<TRes> get posts {
    final local$posts = _instance.posts;
    return local$posts == null
        ? CopyWith$Query$GetPosts$posts.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts(local$posts, (e) => call(posts: e));
  }
}

class _CopyWithStubImpl$Query$GetPosts<TRes>
    implements CopyWith$Query$GetPosts<TRes> {
  _CopyWithStubImpl$Query$GetPosts(this._res);

  TRes _res;

  call({Query$GetPosts$posts? posts, String? $__typename}) => _res;

  CopyWith$Query$GetPosts$posts<TRes> get posts =>
      CopyWith$Query$GetPosts$posts.stub(_res);
}

const documentNodeQueryGetPosts = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetPosts'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'options')),
          type: NamedTypeNode(
            name: NameNode(value: 'PageQueryOptions'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'posts'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'options'),
                value: VariableNode(name: NameNode(value: 'options')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'data'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'PostFields'),
                        directives: [],
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'meta'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'totalCount'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'links'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'first'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'page'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'limit'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'prev'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'page'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'limit'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'next'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'page'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'limit'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'last'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'page'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'limit'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionPostFields,
  ],
);
Query$GetPosts _parserFn$Query$GetPosts(Map<String, dynamic> data) =>
    Query$GetPosts.fromJson(data);
typedef OnQueryComplete$Query$GetPosts =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetPosts?);

class Options$Query$GetPosts extends graphql.QueryOptions<Query$GetPosts> {
  Options$Query$GetPosts({
    String? operationName,
    Variables$Query$GetPosts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPosts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetPosts? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetPosts(data),
               ),
         onError: onError,
         document: documentNodeQueryGetPosts,
         parserFn: _parserFn$Query$GetPosts,
       );

  final OnQueryComplete$Query$GetPosts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetPosts
    extends graphql.WatchQueryOptions<Query$GetPosts> {
  WatchOptions$Query$GetPosts({
    String? operationName,
    Variables$Query$GetPosts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPosts? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetPosts,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetPosts,
       );
}

class FetchMoreOptions$Query$GetPosts extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetPosts({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetPosts? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetPosts,
       );
}

extension ClientExtension$Query$GetPosts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetPosts>> query$GetPosts([
    Options$Query$GetPosts? options,
  ]) async => await this.query(options ?? Options$Query$GetPosts());

  graphql.ObservableQuery<Query$GetPosts> watchQuery$GetPosts([
    WatchOptions$Query$GetPosts? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetPosts());

  void writeQuery$GetPosts({
    required Query$GetPosts data,
    Variables$Query$GetPosts? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetPosts),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetPosts? readQuery$GetPosts({
    Variables$Query$GetPosts? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetPosts),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetPosts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetPosts> useQuery$GetPosts([
  Options$Query$GetPosts? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetPosts());
graphql.ObservableQuery<Query$GetPosts> useWatchQuery$GetPosts([
  WatchOptions$Query$GetPosts? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetPosts());

class Query$GetPosts$Widget extends graphql_flutter.Query<Query$GetPosts> {
  Query$GetPosts$Widget({
    widgets.Key? key,
    Options$Query$GetPosts? options,
    required graphql_flutter.QueryBuilder<Query$GetPosts> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetPosts(),
         builder: builder,
       );
}

class Query$GetPosts$posts {
  Query$GetPosts$posts({
    this.data,
    this.meta,
    this.links,
    this.$__typename = 'PostsPage',
  });

  factory Query$GetPosts$posts.fromJson(Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$meta = json['meta'];
    final l$links = json['links'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts(
      data: (l$data as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$PostFields.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      meta: l$meta == null
          ? null
          : Query$GetPosts$posts$meta.fromJson(
              (l$meta as Map<String, dynamic>),
            ),
      links: l$links == null
          ? null
          : Query$GetPosts$posts$links.fromJson(
              (l$links as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$PostFields?>? data;

  final Query$GetPosts$posts$meta? meta;

  final Query$GetPosts$posts$links? links;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$data = data;
    _resultData['data'] = l$data?.map((e) => e?.toJson()).toList();
    final l$meta = meta;
    _resultData['meta'] = l$meta?.toJson();
    final l$links = links;
    _resultData['links'] = l$links?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$meta = meta;
    final l$links = links;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$data == null ? null : Object.hashAll(l$data.map((v) => v)),
      l$meta,
      l$links,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != null && lOther$data != null) {
      if (l$data.length != lOther$data.length) {
        return false;
      }
      for (int i = 0; i < l$data.length; i++) {
        final l$data$entry = l$data[i];
        final lOther$data$entry = lOther$data[i];
        if (l$data$entry != lOther$data$entry) {
          return false;
        }
      }
    } else if (l$data != lOther$data) {
      return false;
    }
    final l$meta = meta;
    final lOther$meta = other.meta;
    if (l$meta != lOther$meta) {
      return false;
    }
    final l$links = links;
    final lOther$links = other.links;
    if (l$links != lOther$links) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts on Query$GetPosts$posts {
  CopyWith$Query$GetPosts$posts<Query$GetPosts$posts> get copyWith =>
      CopyWith$Query$GetPosts$posts(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts<TRes> {
  factory CopyWith$Query$GetPosts$posts(
    Query$GetPosts$posts instance,
    TRes Function(Query$GetPosts$posts) then,
  ) = _CopyWithImpl$Query$GetPosts$posts;

  factory CopyWith$Query$GetPosts$posts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts;

  TRes call({
    List<Fragment$PostFields?>? data,
    Query$GetPosts$posts$meta? meta,
    Query$GetPosts$posts$links? links,
    String? $__typename,
  });
  TRes data(
    Iterable<Fragment$PostFields?>? Function(
      Iterable<CopyWith$Fragment$PostFields<Fragment$PostFields>?>?,
    )
    _fn,
  );
  CopyWith$Query$GetPosts$posts$meta<TRes> get meta;
  CopyWith$Query$GetPosts$posts$links<TRes> get links;
}

class _CopyWithImpl$Query$GetPosts$posts<TRes>
    implements CopyWith$Query$GetPosts$posts<TRes> {
  _CopyWithImpl$Query$GetPosts$posts(this._instance, this._then);

  final Query$GetPosts$posts _instance;

  final TRes Function(Query$GetPosts$posts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? meta = _undefined,
    Object? links = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts(
      data: data == _undefined
          ? _instance.data
          : (data as List<Fragment$PostFields?>?),
      meta: meta == _undefined
          ? _instance.meta
          : (meta as Query$GetPosts$posts$meta?),
      links: links == _undefined
          ? _instance.links
          : (links as Query$GetPosts$posts$links?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes data(
    Iterable<Fragment$PostFields?>? Function(
      Iterable<CopyWith$Fragment$PostFields<Fragment$PostFields>?>?,
    )
    _fn,
  ) => call(
    data: _fn(
      _instance.data?.map(
        (e) => e == null ? null : CopyWith$Fragment$PostFields(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetPosts$posts$meta<TRes> get meta {
    final local$meta = _instance.meta;
    return local$meta == null
        ? CopyWith$Query$GetPosts$posts$meta.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts$meta(local$meta, (e) => call(meta: e));
  }

  CopyWith$Query$GetPosts$posts$links<TRes> get links {
    final local$links = _instance.links;
    return local$links == null
        ? CopyWith$Query$GetPosts$posts$links.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts$links(
            local$links,
            (e) => call(links: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetPosts$posts<TRes>
    implements CopyWith$Query$GetPosts$posts<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts(this._res);

  TRes _res;

  call({
    List<Fragment$PostFields?>? data,
    Query$GetPosts$posts$meta? meta,
    Query$GetPosts$posts$links? links,
    String? $__typename,
  }) => _res;

  data(_fn) => _res;

  CopyWith$Query$GetPosts$posts$meta<TRes> get meta =>
      CopyWith$Query$GetPosts$posts$meta.stub(_res);

  CopyWith$Query$GetPosts$posts$links<TRes> get links =>
      CopyWith$Query$GetPosts$posts$links.stub(_res);
}

class Query$GetPosts$posts$meta {
  Query$GetPosts$posts$meta({
    this.totalCount,
    this.$__typename = 'PageMetadata',
  });

  factory Query$GetPosts$posts$meta.fromJson(Map<String, dynamic> json) {
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts$meta(
      totalCount: (l$totalCount as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([l$totalCount, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts$meta ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts$meta
    on Query$GetPosts$posts$meta {
  CopyWith$Query$GetPosts$posts$meta<Query$GetPosts$posts$meta> get copyWith =>
      CopyWith$Query$GetPosts$posts$meta(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts$meta<TRes> {
  factory CopyWith$Query$GetPosts$posts$meta(
    Query$GetPosts$posts$meta instance,
    TRes Function(Query$GetPosts$posts$meta) then,
  ) = _CopyWithImpl$Query$GetPosts$posts$meta;

  factory CopyWith$Query$GetPosts$posts$meta.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts$meta;

  TRes call({int? totalCount, String? $__typename});
}

class _CopyWithImpl$Query$GetPosts$posts$meta<TRes>
    implements CopyWith$Query$GetPosts$posts$meta<TRes> {
  _CopyWithImpl$Query$GetPosts$posts$meta(this._instance, this._then);

  final Query$GetPosts$posts$meta _instance;

  final TRes Function(Query$GetPosts$posts$meta) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts$meta(
      totalCount: totalCount == _undefined
          ? _instance.totalCount
          : (totalCount as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPosts$posts$meta<TRes>
    implements CopyWith$Query$GetPosts$posts$meta<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts$meta(this._res);

  TRes _res;

  call({int? totalCount, String? $__typename}) => _res;
}

class Query$GetPosts$posts$links {
  Query$GetPosts$posts$links({
    this.first,
    this.prev,
    this.next,
    this.last,
    this.$__typename = 'PaginationLinks',
  });

  factory Query$GetPosts$posts$links.fromJson(Map<String, dynamic> json) {
    final l$first = json['first'];
    final l$prev = json['prev'];
    final l$next = json['next'];
    final l$last = json['last'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts$links(
      first: l$first == null
          ? null
          : Query$GetPosts$posts$links$first.fromJson(
              (l$first as Map<String, dynamic>),
            ),
      prev: l$prev == null
          ? null
          : Query$GetPosts$posts$links$prev.fromJson(
              (l$prev as Map<String, dynamic>),
            ),
      next: l$next == null
          ? null
          : Query$GetPosts$posts$links$next.fromJson(
              (l$next as Map<String, dynamic>),
            ),
      last: l$last == null
          ? null
          : Query$GetPosts$posts$links$last.fromJson(
              (l$last as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetPosts$posts$links$first? first;

  final Query$GetPosts$posts$links$prev? prev;

  final Query$GetPosts$posts$links$next? next;

  final Query$GetPosts$posts$links$last? last;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$first = first;
    _resultData['first'] = l$first?.toJson();
    final l$prev = prev;
    _resultData['prev'] = l$prev?.toJson();
    final l$next = next;
    _resultData['next'] = l$next?.toJson();
    final l$last = last;
    _resultData['last'] = l$last?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$prev = prev;
    final l$next = next;
    final l$last = last;
    final l$$__typename = $__typename;
    return Object.hashAll([l$first, l$prev, l$next, l$last, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts$links ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    final l$prev = prev;
    final lOther$prev = other.prev;
    if (l$prev != lOther$prev) {
      return false;
    }
    final l$next = next;
    final lOther$next = other.next;
    if (l$next != lOther$next) {
      return false;
    }
    final l$last = last;
    final lOther$last = other.last;
    if (l$last != lOther$last) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts$links
    on Query$GetPosts$posts$links {
  CopyWith$Query$GetPosts$posts$links<Query$GetPosts$posts$links>
  get copyWith => CopyWith$Query$GetPosts$posts$links(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts$links<TRes> {
  factory CopyWith$Query$GetPosts$posts$links(
    Query$GetPosts$posts$links instance,
    TRes Function(Query$GetPosts$posts$links) then,
  ) = _CopyWithImpl$Query$GetPosts$posts$links;

  factory CopyWith$Query$GetPosts$posts$links.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts$links;

  TRes call({
    Query$GetPosts$posts$links$first? first,
    Query$GetPosts$posts$links$prev? prev,
    Query$GetPosts$posts$links$next? next,
    Query$GetPosts$posts$links$last? last,
    String? $__typename,
  });
  CopyWith$Query$GetPosts$posts$links$first<TRes> get first;
  CopyWith$Query$GetPosts$posts$links$prev<TRes> get prev;
  CopyWith$Query$GetPosts$posts$links$next<TRes> get next;
  CopyWith$Query$GetPosts$posts$links$last<TRes> get last;
}

class _CopyWithImpl$Query$GetPosts$posts$links<TRes>
    implements CopyWith$Query$GetPosts$posts$links<TRes> {
  _CopyWithImpl$Query$GetPosts$posts$links(this._instance, this._then);

  final Query$GetPosts$posts$links _instance;

  final TRes Function(Query$GetPosts$posts$links) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? prev = _undefined,
    Object? next = _undefined,
    Object? last = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts$links(
      first: first == _undefined
          ? _instance.first
          : (first as Query$GetPosts$posts$links$first?),
      prev: prev == _undefined
          ? _instance.prev
          : (prev as Query$GetPosts$posts$links$prev?),
      next: next == _undefined
          ? _instance.next
          : (next as Query$GetPosts$posts$links$next?),
      last: last == _undefined
          ? _instance.last
          : (last as Query$GetPosts$posts$links$last?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetPosts$posts$links$first<TRes> get first {
    final local$first = _instance.first;
    return local$first == null
        ? CopyWith$Query$GetPosts$posts$links$first.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts$links$first(
            local$first,
            (e) => call(first: e),
          );
  }

  CopyWith$Query$GetPosts$posts$links$prev<TRes> get prev {
    final local$prev = _instance.prev;
    return local$prev == null
        ? CopyWith$Query$GetPosts$posts$links$prev.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts$links$prev(
            local$prev,
            (e) => call(prev: e),
          );
  }

  CopyWith$Query$GetPosts$posts$links$next<TRes> get next {
    final local$next = _instance.next;
    return local$next == null
        ? CopyWith$Query$GetPosts$posts$links$next.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts$links$next(
            local$next,
            (e) => call(next: e),
          );
  }

  CopyWith$Query$GetPosts$posts$links$last<TRes> get last {
    final local$last = _instance.last;
    return local$last == null
        ? CopyWith$Query$GetPosts$posts$links$last.stub(_then(_instance))
        : CopyWith$Query$GetPosts$posts$links$last(
            local$last,
            (e) => call(last: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetPosts$posts$links<TRes>
    implements CopyWith$Query$GetPosts$posts$links<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts$links(this._res);

  TRes _res;

  call({
    Query$GetPosts$posts$links$first? first,
    Query$GetPosts$posts$links$prev? prev,
    Query$GetPosts$posts$links$next? next,
    Query$GetPosts$posts$links$last? last,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetPosts$posts$links$first<TRes> get first =>
      CopyWith$Query$GetPosts$posts$links$first.stub(_res);

  CopyWith$Query$GetPosts$posts$links$prev<TRes> get prev =>
      CopyWith$Query$GetPosts$posts$links$prev.stub(_res);

  CopyWith$Query$GetPosts$posts$links$next<TRes> get next =>
      CopyWith$Query$GetPosts$posts$links$next.stub(_res);

  CopyWith$Query$GetPosts$posts$links$last<TRes> get last =>
      CopyWith$Query$GetPosts$posts$links$last.stub(_res);
}

class Query$GetPosts$posts$links$first {
  Query$GetPosts$posts$links$first({
    this.page,
    this.limit,
    this.$__typename = 'PageLimitPair',
  });

  factory Query$GetPosts$posts$links$first.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$limit = json['limit'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts$links$first(
      page: (l$page as int?),
      limit: (l$limit as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? page;

  final int? limit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$limit = limit;
    _resultData['limit'] = l$limit;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$limit = limit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$limit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts$links$first ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts$links$first
    on Query$GetPosts$posts$links$first {
  CopyWith$Query$GetPosts$posts$links$first<Query$GetPosts$posts$links$first>
  get copyWith => CopyWith$Query$GetPosts$posts$links$first(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts$links$first<TRes> {
  factory CopyWith$Query$GetPosts$posts$links$first(
    Query$GetPosts$posts$links$first instance,
    TRes Function(Query$GetPosts$posts$links$first) then,
  ) = _CopyWithImpl$Query$GetPosts$posts$links$first;

  factory CopyWith$Query$GetPosts$posts$links$first.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts$links$first;

  TRes call({int? page, int? limit, String? $__typename});
}

class _CopyWithImpl$Query$GetPosts$posts$links$first<TRes>
    implements CopyWith$Query$GetPosts$posts$links$first<TRes> {
  _CopyWithImpl$Query$GetPosts$posts$links$first(this._instance, this._then);

  final Query$GetPosts$posts$links$first _instance;

  final TRes Function(Query$GetPosts$posts$links$first) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? limit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts$links$first(
      page: page == _undefined ? _instance.page : (page as int?),
      limit: limit == _undefined ? _instance.limit : (limit as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPosts$posts$links$first<TRes>
    implements CopyWith$Query$GetPosts$posts$links$first<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts$links$first(this._res);

  TRes _res;

  call({int? page, int? limit, String? $__typename}) => _res;
}

class Query$GetPosts$posts$links$prev {
  Query$GetPosts$posts$links$prev({
    this.page,
    this.limit,
    this.$__typename = 'PageLimitPair',
  });

  factory Query$GetPosts$posts$links$prev.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$limit = json['limit'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts$links$prev(
      page: (l$page as int?),
      limit: (l$limit as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? page;

  final int? limit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$limit = limit;
    _resultData['limit'] = l$limit;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$limit = limit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$limit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts$links$prev ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts$links$prev
    on Query$GetPosts$posts$links$prev {
  CopyWith$Query$GetPosts$posts$links$prev<Query$GetPosts$posts$links$prev>
  get copyWith => CopyWith$Query$GetPosts$posts$links$prev(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts$links$prev<TRes> {
  factory CopyWith$Query$GetPosts$posts$links$prev(
    Query$GetPosts$posts$links$prev instance,
    TRes Function(Query$GetPosts$posts$links$prev) then,
  ) = _CopyWithImpl$Query$GetPosts$posts$links$prev;

  factory CopyWith$Query$GetPosts$posts$links$prev.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts$links$prev;

  TRes call({int? page, int? limit, String? $__typename});
}

class _CopyWithImpl$Query$GetPosts$posts$links$prev<TRes>
    implements CopyWith$Query$GetPosts$posts$links$prev<TRes> {
  _CopyWithImpl$Query$GetPosts$posts$links$prev(this._instance, this._then);

  final Query$GetPosts$posts$links$prev _instance;

  final TRes Function(Query$GetPosts$posts$links$prev) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? limit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts$links$prev(
      page: page == _undefined ? _instance.page : (page as int?),
      limit: limit == _undefined ? _instance.limit : (limit as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPosts$posts$links$prev<TRes>
    implements CopyWith$Query$GetPosts$posts$links$prev<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts$links$prev(this._res);

  TRes _res;

  call({int? page, int? limit, String? $__typename}) => _res;
}

class Query$GetPosts$posts$links$next {
  Query$GetPosts$posts$links$next({
    this.page,
    this.limit,
    this.$__typename = 'PageLimitPair',
  });

  factory Query$GetPosts$posts$links$next.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$limit = json['limit'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts$links$next(
      page: (l$page as int?),
      limit: (l$limit as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? page;

  final int? limit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$limit = limit;
    _resultData['limit'] = l$limit;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$limit = limit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$limit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts$links$next ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts$links$next
    on Query$GetPosts$posts$links$next {
  CopyWith$Query$GetPosts$posts$links$next<Query$GetPosts$posts$links$next>
  get copyWith => CopyWith$Query$GetPosts$posts$links$next(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts$links$next<TRes> {
  factory CopyWith$Query$GetPosts$posts$links$next(
    Query$GetPosts$posts$links$next instance,
    TRes Function(Query$GetPosts$posts$links$next) then,
  ) = _CopyWithImpl$Query$GetPosts$posts$links$next;

  factory CopyWith$Query$GetPosts$posts$links$next.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts$links$next;

  TRes call({int? page, int? limit, String? $__typename});
}

class _CopyWithImpl$Query$GetPosts$posts$links$next<TRes>
    implements CopyWith$Query$GetPosts$posts$links$next<TRes> {
  _CopyWithImpl$Query$GetPosts$posts$links$next(this._instance, this._then);

  final Query$GetPosts$posts$links$next _instance;

  final TRes Function(Query$GetPosts$posts$links$next) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? limit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts$links$next(
      page: page == _undefined ? _instance.page : (page as int?),
      limit: limit == _undefined ? _instance.limit : (limit as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPosts$posts$links$next<TRes>
    implements CopyWith$Query$GetPosts$posts$links$next<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts$links$next(this._res);

  TRes _res;

  call({int? page, int? limit, String? $__typename}) => _res;
}

class Query$GetPosts$posts$links$last {
  Query$GetPosts$posts$links$last({
    this.page,
    this.limit,
    this.$__typename = 'PageLimitPair',
  });

  factory Query$GetPosts$posts$links$last.fromJson(Map<String, dynamic> json) {
    final l$page = json['page'];
    final l$limit = json['limit'];
    final l$$__typename = json['__typename'];
    return Query$GetPosts$posts$links$last(
      page: (l$page as int?),
      limit: (l$limit as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final int? page;

  final int? limit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$page = page;
    _resultData['page'] = l$page;
    final l$limit = limit;
    _resultData['limit'] = l$limit;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$limit = limit;
    final l$$__typename = $__typename;
    return Object.hashAll([l$page, l$limit, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPosts$posts$links$last ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (l$page != lOther$page) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPosts$posts$links$last
    on Query$GetPosts$posts$links$last {
  CopyWith$Query$GetPosts$posts$links$last<Query$GetPosts$posts$links$last>
  get copyWith => CopyWith$Query$GetPosts$posts$links$last(this, (i) => i);
}

abstract class CopyWith$Query$GetPosts$posts$links$last<TRes> {
  factory CopyWith$Query$GetPosts$posts$links$last(
    Query$GetPosts$posts$links$last instance,
    TRes Function(Query$GetPosts$posts$links$last) then,
  ) = _CopyWithImpl$Query$GetPosts$posts$links$last;

  factory CopyWith$Query$GetPosts$posts$links$last.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPosts$posts$links$last;

  TRes call({int? page, int? limit, String? $__typename});
}

class _CopyWithImpl$Query$GetPosts$posts$links$last<TRes>
    implements CopyWith$Query$GetPosts$posts$links$last<TRes> {
  _CopyWithImpl$Query$GetPosts$posts$links$last(this._instance, this._then);

  final Query$GetPosts$posts$links$last _instance;

  final TRes Function(Query$GetPosts$posts$links$last) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? page = _undefined,
    Object? limit = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPosts$posts$links$last(
      page: page == _undefined ? _instance.page : (page as int?),
      limit: limit == _undefined ? _instance.limit : (limit as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPosts$posts$links$last<TRes>
    implements CopyWith$Query$GetPosts$posts$links$last<TRes> {
  _CopyWithStubImpl$Query$GetPosts$posts$links$last(this._res);

  TRes _res;

  call({int? page, int? limit, String? $__typename}) => _res;
}

class Variables$Query$GetPost {
  factory Variables$Query$GetPost({required String id}) =>
      Variables$Query$GetPost._({r'id': id});

  Variables$Query$GetPost._(this._$data);

  factory Variables$Query$GetPost.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetPost._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetPost<Variables$Query$GetPost> get copyWith =>
      CopyWith$Variables$Query$GetPost(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetPost || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetPost<TRes> {
  factory CopyWith$Variables$Query$GetPost(
    Variables$Query$GetPost instance,
    TRes Function(Variables$Query$GetPost) then,
  ) = _CopyWithImpl$Variables$Query$GetPost;

  factory CopyWith$Variables$Query$GetPost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetPost;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetPost<TRes>
    implements CopyWith$Variables$Query$GetPost<TRes> {
  _CopyWithImpl$Variables$Query$GetPost(this._instance, this._then);

  final Variables$Query$GetPost _instance;

  final TRes Function(Variables$Query$GetPost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetPost._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetPost<TRes>
    implements CopyWith$Variables$Query$GetPost<TRes> {
  _CopyWithStubImpl$Variables$Query$GetPost(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetPost {
  Query$GetPost({this.post, this.$__typename = 'Query'});

  factory Query$GetPost.fromJson(Map<String, dynamic> json) {
    final l$post = json['post'];
    final l$$__typename = json['__typename'];
    return Query$GetPost(
      post: l$post == null
          ? null
          : Query$GetPost$post.fromJson((l$post as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetPost$post? post;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$post = post;
    _resultData['post'] = l$post?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$post = post;
    final l$$__typename = $__typename;
    return Object.hashAll([l$post, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPost || runtimeType != other.runtimeType) {
      return false;
    }
    final l$post = post;
    final lOther$post = other.post;
    if (l$post != lOther$post) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPost on Query$GetPost {
  CopyWith$Query$GetPost<Query$GetPost> get copyWith =>
      CopyWith$Query$GetPost(this, (i) => i);
}

abstract class CopyWith$Query$GetPost<TRes> {
  factory CopyWith$Query$GetPost(
    Query$GetPost instance,
    TRes Function(Query$GetPost) then,
  ) = _CopyWithImpl$Query$GetPost;

  factory CopyWith$Query$GetPost.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPost;

  TRes call({Query$GetPost$post? post, String? $__typename});
  CopyWith$Query$GetPost$post<TRes> get post;
}

class _CopyWithImpl$Query$GetPost<TRes>
    implements CopyWith$Query$GetPost<TRes> {
  _CopyWithImpl$Query$GetPost(this._instance, this._then);

  final Query$GetPost _instance;

  final TRes Function(Query$GetPost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? post = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetPost(
          post: post == _undefined
              ? _instance.post
              : (post as Query$GetPost$post?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetPost$post<TRes> get post {
    final local$post = _instance.post;
    return local$post == null
        ? CopyWith$Query$GetPost$post.stub(_then(_instance))
        : CopyWith$Query$GetPost$post(local$post, (e) => call(post: e));
  }
}

class _CopyWithStubImpl$Query$GetPost<TRes>
    implements CopyWith$Query$GetPost<TRes> {
  _CopyWithStubImpl$Query$GetPost(this._res);

  TRes _res;

  call({Query$GetPost$post? post, String? $__typename}) => _res;

  CopyWith$Query$GetPost$post<TRes> get post =>
      CopyWith$Query$GetPost$post.stub(_res);
}

const documentNodeQueryGetPost = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetPost'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'post'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'PostFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: 'comments'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                      name: NameNode(value: 'options'),
                      value: ObjectValueNode(
                        fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'paginate'),
                            value: ObjectValueNode(
                              fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'page'),
                                  value: IntValueNode(value: '1'),
                                ),
                                ObjectFieldNode(
                                  name: NameNode(value: 'limit'),
                                  value: IntValueNode(value: '10'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'data'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'id'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'email'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'body'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionPostFields,
  ],
);
Query$GetPost _parserFn$Query$GetPost(Map<String, dynamic> data) =>
    Query$GetPost.fromJson(data);
typedef OnQueryComplete$Query$GetPost =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetPost?);

class Options$Query$GetPost extends graphql.QueryOptions<Query$GetPost> {
  Options$Query$GetPost({
    String? operationName,
    required Variables$Query$GetPost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPost? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetPost? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetPost(data),
               ),
         onError: onError,
         document: documentNodeQueryGetPost,
         parserFn: _parserFn$Query$GetPost,
       );

  final OnQueryComplete$Query$GetPost? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetPost
    extends graphql.WatchQueryOptions<Query$GetPost> {
  WatchOptions$Query$GetPost({
    String? operationName,
    required Variables$Query$GetPost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPost? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetPost,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetPost,
       );
}

class FetchMoreOptions$Query$GetPost extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetPost({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetPost variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetPost,
       );
}

extension ClientExtension$Query$GetPost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetPost>> query$GetPost(
    Options$Query$GetPost options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetPost> watchQuery$GetPost(
    WatchOptions$Query$GetPost options,
  ) => this.watchQuery(options);

  void writeQuery$GetPost({
    required Query$GetPost data,
    required Variables$Query$GetPost variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetPost),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetPost? readQuery$GetPost({
    required Variables$Query$GetPost variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetPost),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetPost.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetPost> useQuery$GetPost(
  Options$Query$GetPost options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetPost> useWatchQuery$GetPost(
  WatchOptions$Query$GetPost options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetPost$Widget extends graphql_flutter.Query<Query$GetPost> {
  Query$GetPost$Widget({
    widgets.Key? key,
    required Options$Query$GetPost options,
    required graphql_flutter.QueryBuilder<Query$GetPost> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetPost$post implements Fragment$PostFields {
  Query$GetPost$post({
    this.id,
    this.title,
    this.body,
    this.user,
    this.$__typename = 'Post',
    this.comments,
  });

  factory Query$GetPost$post.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    final l$comments = json['comments'];
    return Query$GetPost$post(
      id: (l$id as String?),
      title: (l$title as String?),
      body: (l$body as String?),
      user: l$user == null
          ? null
          : Query$GetPost$post$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
      comments: l$comments == null
          ? null
          : Query$GetPost$post$comments.fromJson(
              (l$comments as Map<String, dynamic>),
            ),
    );
  }

  final String? id;

  final String? title;

  final String? body;

  final Query$GetPost$post$user? user;

  final String $__typename;

  final Query$GetPost$post$comments? comments;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$comments = comments;
    _resultData['comments'] = l$comments?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$body = body;
    final l$user = user;
    final l$$__typename = $__typename;
    final l$comments = comments;
    return Object.hashAll([
      l$id,
      l$title,
      l$body,
      l$user,
      l$$__typename,
      l$comments,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPost$post || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments != lOther$comments) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPost$post on Query$GetPost$post {
  CopyWith$Query$GetPost$post<Query$GetPost$post> get copyWith =>
      CopyWith$Query$GetPost$post(this, (i) => i);
}

abstract class CopyWith$Query$GetPost$post<TRes> {
  factory CopyWith$Query$GetPost$post(
    Query$GetPost$post instance,
    TRes Function(Query$GetPost$post) then,
  ) = _CopyWithImpl$Query$GetPost$post;

  factory CopyWith$Query$GetPost$post.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPost$post;

  TRes call({
    String? id,
    String? title,
    String? body,
    Query$GetPost$post$user? user,
    String? $__typename,
    Query$GetPost$post$comments? comments,
  });
  CopyWith$Query$GetPost$post$user<TRes> get user;
  CopyWith$Query$GetPost$post$comments<TRes> get comments;
}

class _CopyWithImpl$Query$GetPost$post<TRes>
    implements CopyWith$Query$GetPost$post<TRes> {
  _CopyWithImpl$Query$GetPost$post(this._instance, this._then);

  final Query$GetPost$post _instance;

  final TRes Function(Query$GetPost$post) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
    Object? comments = _undefined,
  }) => _then(
    Query$GetPost$post(
      id: id == _undefined ? _instance.id : (id as String?),
      title: title == _undefined ? _instance.title : (title as String?),
      body: body == _undefined ? _instance.body : (body as String?),
      user: user == _undefined
          ? _instance.user
          : (user as Query$GetPost$post$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
      comments: comments == _undefined
          ? _instance.comments
          : (comments as Query$GetPost$post$comments?),
    ),
  );

  CopyWith$Query$GetPost$post$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetPost$post$user.stub(_then(_instance))
        : CopyWith$Query$GetPost$post$user(local$user, (e) => call(user: e));
  }

  CopyWith$Query$GetPost$post$comments<TRes> get comments {
    final local$comments = _instance.comments;
    return local$comments == null
        ? CopyWith$Query$GetPost$post$comments.stub(_then(_instance))
        : CopyWith$Query$GetPost$post$comments(
            local$comments,
            (e) => call(comments: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetPost$post<TRes>
    implements CopyWith$Query$GetPost$post<TRes> {
  _CopyWithStubImpl$Query$GetPost$post(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? body,
    Query$GetPost$post$user? user,
    String? $__typename,
    Query$GetPost$post$comments? comments,
  }) => _res;

  CopyWith$Query$GetPost$post$user<TRes> get user =>
      CopyWith$Query$GetPost$post$user.stub(_res);

  CopyWith$Query$GetPost$post$comments<TRes> get comments =>
      CopyWith$Query$GetPost$post$comments.stub(_res);
}

class Query$GetPost$post$user implements Fragment$PostFields$user {
  Query$GetPost$post$user({
    this.id,
    this.name,
    this.email,
    this.$__typename = 'User',
  });

  factory Query$GetPost$post$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetPost$post$user(
      id: (l$id as String?),
      name: (l$name as String?),
      email: (l$email as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? name;

  final String? email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$email, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPost$post$user || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPost$post$user on Query$GetPost$post$user {
  CopyWith$Query$GetPost$post$user<Query$GetPost$post$user> get copyWith =>
      CopyWith$Query$GetPost$post$user(this, (i) => i);
}

abstract class CopyWith$Query$GetPost$post$user<TRes> {
  factory CopyWith$Query$GetPost$post$user(
    Query$GetPost$post$user instance,
    TRes Function(Query$GetPost$post$user) then,
  ) = _CopyWithImpl$Query$GetPost$post$user;

  factory CopyWith$Query$GetPost$post$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPost$post$user;

  TRes call({String? id, String? name, String? email, String? $__typename});
}

class _CopyWithImpl$Query$GetPost$post$user<TRes>
    implements CopyWith$Query$GetPost$post$user<TRes> {
  _CopyWithImpl$Query$GetPost$post$user(this._instance, this._then);

  final Query$GetPost$post$user _instance;

  final TRes Function(Query$GetPost$post$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPost$post$user(
      id: id == _undefined ? _instance.id : (id as String?),
      name: name == _undefined ? _instance.name : (name as String?),
      email: email == _undefined ? _instance.email : (email as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPost$post$user<TRes>
    implements CopyWith$Query$GetPost$post$user<TRes> {
  _CopyWithStubImpl$Query$GetPost$post$user(this._res);

  TRes _res;

  call({String? id, String? name, String? email, String? $__typename}) => _res;
}

class Query$GetPost$post$comments {
  Query$GetPost$post$comments({this.data, this.$__typename = 'CommentsPage'});

  factory Query$GetPost$post$comments.fromJson(Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$GetPost$post$comments(
      data: (l$data as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetPost$post$comments$data.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetPost$post$comments$data?>? data;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$data = data;
    _resultData['data'] = l$data?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$data == null ? null : Object.hashAll(l$data.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPost$post$comments ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != null && lOther$data != null) {
      if (l$data.length != lOther$data.length) {
        return false;
      }
      for (int i = 0; i < l$data.length; i++) {
        final l$data$entry = l$data[i];
        final lOther$data$entry = lOther$data[i];
        if (l$data$entry != lOther$data$entry) {
          return false;
        }
      }
    } else if (l$data != lOther$data) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPost$post$comments
    on Query$GetPost$post$comments {
  CopyWith$Query$GetPost$post$comments<Query$GetPost$post$comments>
  get copyWith => CopyWith$Query$GetPost$post$comments(this, (i) => i);
}

abstract class CopyWith$Query$GetPost$post$comments<TRes> {
  factory CopyWith$Query$GetPost$post$comments(
    Query$GetPost$post$comments instance,
    TRes Function(Query$GetPost$post$comments) then,
  ) = _CopyWithImpl$Query$GetPost$post$comments;

  factory CopyWith$Query$GetPost$post$comments.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPost$post$comments;

  TRes call({
    List<Query$GetPost$post$comments$data?>? data,
    String? $__typename,
  });
  TRes data(
    Iterable<Query$GetPost$post$comments$data?>? Function(
      Iterable<
        CopyWith$Query$GetPost$post$comments$data<
          Query$GetPost$post$comments$data
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetPost$post$comments<TRes>
    implements CopyWith$Query$GetPost$post$comments<TRes> {
  _CopyWithImpl$Query$GetPost$post$comments(this._instance, this._then);

  final Query$GetPost$post$comments _instance;

  final TRes Function(Query$GetPost$post$comments) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? data = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetPost$post$comments(
          data: data == _undefined
              ? _instance.data
              : (data as List<Query$GetPost$post$comments$data?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes data(
    Iterable<Query$GetPost$post$comments$data?>? Function(
      Iterable<
        CopyWith$Query$GetPost$post$comments$data<
          Query$GetPost$post$comments$data
        >?
      >?,
    )
    _fn,
  ) => call(
    data: _fn(
      _instance.data?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetPost$post$comments$data(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetPost$post$comments<TRes>
    implements CopyWith$Query$GetPost$post$comments<TRes> {
  _CopyWithStubImpl$Query$GetPost$post$comments(this._res);

  TRes _res;

  call({List<Query$GetPost$post$comments$data?>? data, String? $__typename}) =>
      _res;

  data(_fn) => _res;
}

class Query$GetPost$post$comments$data {
  Query$GetPost$post$comments$data({
    this.id,
    this.name,
    this.email,
    this.body,
    this.$__typename = 'Comment',
  });

  factory Query$GetPost$post$comments$data.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$body = json['body'];
    final l$$__typename = json['__typename'];
    return Query$GetPost$post$comments$data(
      id: (l$id as String?),
      name: (l$name as String?),
      email: (l$email as String?),
      body: (l$body as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? id;

  final String? name;

  final String? email;

  final String? body;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$body = body;
    _resultData['body'] = l$body;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$body = body;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$email, l$body, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetPost$post$comments$data ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPost$post$comments$data
    on Query$GetPost$post$comments$data {
  CopyWith$Query$GetPost$post$comments$data<Query$GetPost$post$comments$data>
  get copyWith => CopyWith$Query$GetPost$post$comments$data(this, (i) => i);
}

abstract class CopyWith$Query$GetPost$post$comments$data<TRes> {
  factory CopyWith$Query$GetPost$post$comments$data(
    Query$GetPost$post$comments$data instance,
    TRes Function(Query$GetPost$post$comments$data) then,
  ) = _CopyWithImpl$Query$GetPost$post$comments$data;

  factory CopyWith$Query$GetPost$post$comments$data.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPost$post$comments$data;

  TRes call({
    String? id,
    String? name,
    String? email,
    String? body,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetPost$post$comments$data<TRes>
    implements CopyWith$Query$GetPost$post$comments$data<TRes> {
  _CopyWithImpl$Query$GetPost$post$comments$data(this._instance, this._then);

  final Query$GetPost$post$comments$data _instance;

  final TRes Function(Query$GetPost$post$comments$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? body = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetPost$post$comments$data(
      id: id == _undefined ? _instance.id : (id as String?),
      name: name == _undefined ? _instance.name : (name as String?),
      email: email == _undefined ? _instance.email : (email as String?),
      body: body == _undefined ? _instance.body : (body as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetPost$post$comments$data<TRes>
    implements CopyWith$Query$GetPost$post$comments$data<TRes> {
  _CopyWithStubImpl$Query$GetPost$post$comments$data(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    String? body,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$CreatePost {
  factory Variables$Mutation$CreatePost({
    required Input$CreatePostInput input,
  }) => Variables$Mutation$CreatePost._({r'input': input});

  Variables$Mutation$CreatePost._(this._$data);

  factory Variables$Mutation$CreatePost.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreatePostInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreatePost._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreatePostInput get input => (_$data['input'] as Input$CreatePostInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreatePost<Variables$Mutation$CreatePost>
  get copyWith => CopyWith$Variables$Mutation$CreatePost(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreatePost ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreatePost<TRes> {
  factory CopyWith$Variables$Mutation$CreatePost(
    Variables$Mutation$CreatePost instance,
    TRes Function(Variables$Mutation$CreatePost) then,
  ) = _CopyWithImpl$Variables$Mutation$CreatePost;

  factory CopyWith$Variables$Mutation$CreatePost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreatePost;

  TRes call({Input$CreatePostInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreatePost<TRes>
    implements CopyWith$Variables$Mutation$CreatePost<TRes> {
  _CopyWithImpl$Variables$Mutation$CreatePost(this._instance, this._then);

  final Variables$Mutation$CreatePost _instance;

  final TRes Function(Variables$Mutation$CreatePost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreatePost._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreatePostInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreatePost<TRes>
    implements CopyWith$Variables$Mutation$CreatePost<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreatePost(this._res);

  TRes _res;

  call({Input$CreatePostInput? input}) => _res;
}

class Mutation$CreatePost {
  Mutation$CreatePost({this.createPost, this.$__typename = 'Mutation'});

  factory Mutation$CreatePost.fromJson(Map<String, dynamic> json) {
    final l$createPost = json['createPost'];
    final l$$__typename = json['__typename'];
    return Mutation$CreatePost(
      createPost: l$createPost == null
          ? null
          : Fragment$PostFields.fromJson(
              (l$createPost as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PostFields? createPost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createPost = createPost;
    _resultData['createPost'] = l$createPost?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createPost = createPost;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createPost, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreatePost || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createPost = createPost;
    final lOther$createPost = other.createPost;
    if (l$createPost != lOther$createPost) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreatePost on Mutation$CreatePost {
  CopyWith$Mutation$CreatePost<Mutation$CreatePost> get copyWith =>
      CopyWith$Mutation$CreatePost(this, (i) => i);
}

abstract class CopyWith$Mutation$CreatePost<TRes> {
  factory CopyWith$Mutation$CreatePost(
    Mutation$CreatePost instance,
    TRes Function(Mutation$CreatePost) then,
  ) = _CopyWithImpl$Mutation$CreatePost;

  factory CopyWith$Mutation$CreatePost.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreatePost;

  TRes call({Fragment$PostFields? createPost, String? $__typename});
  CopyWith$Fragment$PostFields<TRes> get createPost;
}

class _CopyWithImpl$Mutation$CreatePost<TRes>
    implements CopyWith$Mutation$CreatePost<TRes> {
  _CopyWithImpl$Mutation$CreatePost(this._instance, this._then);

  final Mutation$CreatePost _instance;

  final TRes Function(Mutation$CreatePost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createPost = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreatePost(
      createPost: createPost == _undefined
          ? _instance.createPost
          : (createPost as Fragment$PostFields?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$PostFields<TRes> get createPost {
    final local$createPost = _instance.createPost;
    return local$createPost == null
        ? CopyWith$Fragment$PostFields.stub(_then(_instance))
        : CopyWith$Fragment$PostFields(
            local$createPost,
            (e) => call(createPost: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreatePost<TRes>
    implements CopyWith$Mutation$CreatePost<TRes> {
  _CopyWithStubImpl$Mutation$CreatePost(this._res);

  TRes _res;

  call({Fragment$PostFields? createPost, String? $__typename}) => _res;

  CopyWith$Fragment$PostFields<TRes> get createPost =>
      CopyWith$Fragment$PostFields.stub(_res);
}

const documentNodeMutationCreatePost = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreatePost'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreatePostInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'createPost'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'PostFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionPostFields,
  ],
);
Mutation$CreatePost _parserFn$Mutation$CreatePost(Map<String, dynamic> data) =>
    Mutation$CreatePost.fromJson(data);
typedef OnMutationCompleted$Mutation$CreatePost =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreatePost?);

class Options$Mutation$CreatePost
    extends graphql.MutationOptions<Mutation$CreatePost> {
  Options$Mutation$CreatePost({
    String? operationName,
    required Variables$Mutation$CreatePost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePost? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreatePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreatePost>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$CreatePost(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreatePost,
         parserFn: _parserFn$Mutation$CreatePost,
       );

  final OnMutationCompleted$Mutation$CreatePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreatePost
    extends graphql.WatchQueryOptions<Mutation$CreatePost> {
  WatchOptions$Mutation$CreatePost({
    String? operationName,
    required Variables$Mutation$CreatePost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePost? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationCreatePost,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreatePost,
       );
}

extension ClientExtension$Mutation$CreatePost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreatePost>> mutate$CreatePost(
    Options$Mutation$CreatePost options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreatePost> watchMutation$CreatePost(
    WatchOptions$Mutation$CreatePost options,
  ) => this.watchMutation(options);
}

class Mutation$CreatePost$HookResult {
  Mutation$CreatePost$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreatePost runMutation;

  final graphql.QueryResult<Mutation$CreatePost> result;
}

Mutation$CreatePost$HookResult useMutation$CreatePost([
  WidgetOptions$Mutation$CreatePost? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreatePost(),
  );
  return Mutation$CreatePost$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreatePost> useWatchMutation$CreatePost(
  WatchOptions$Mutation$CreatePost options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreatePost
    extends graphql.MutationOptions<Mutation$CreatePost> {
  WidgetOptions$Mutation$CreatePost({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePost? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreatePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreatePost>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$CreatePost(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreatePost,
         parserFn: _parserFn$Mutation$CreatePost,
       );

  final OnMutationCompleted$Mutation$CreatePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreatePost =
    graphql.MultiSourceResult<Mutation$CreatePost> Function(
      Variables$Mutation$CreatePost, {
      Object? optimisticResult,
      Mutation$CreatePost? typedOptimisticResult,
    });
typedef Builder$Mutation$CreatePost =
    widgets.Widget Function(
      RunMutation$Mutation$CreatePost,
      graphql.QueryResult<Mutation$CreatePost>?,
    );

class Mutation$CreatePost$Widget
    extends graphql_flutter.Mutation<Mutation$CreatePost> {
  Mutation$CreatePost$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreatePost? options,
    required Builder$Mutation$CreatePost builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreatePost(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Mutation$UpdatePost {
  factory Variables$Mutation$UpdatePost({
    required String id,
    required Input$UpdatePostInput input,
  }) => Variables$Mutation$UpdatePost._({r'id': id, r'input': input});

  Variables$Mutation$UpdatePost._(this._$data);

  factory Variables$Mutation$UpdatePost.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    final l$input = data['input'];
    result$data['input'] = Input$UpdatePostInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdatePost._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Input$UpdatePostInput get input => (_$data['input'] as Input$UpdatePostInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdatePost<Variables$Mutation$UpdatePost>
  get copyWith => CopyWith$Variables$Mutation$UpdatePost(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdatePost ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$input = input;
    return Object.hashAll([l$id, l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdatePost<TRes> {
  factory CopyWith$Variables$Mutation$UpdatePost(
    Variables$Mutation$UpdatePost instance,
    TRes Function(Variables$Mutation$UpdatePost) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdatePost;

  factory CopyWith$Variables$Mutation$UpdatePost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdatePost;

  TRes call({String? id, Input$UpdatePostInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdatePost<TRes>
    implements CopyWith$Variables$Mutation$UpdatePost<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdatePost(this._instance, this._then);

  final Variables$Mutation$UpdatePost _instance;

  final TRes Function(Variables$Mutation$UpdatePost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? input = _undefined}) => _then(
    Variables$Mutation$UpdatePost._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (input != _undefined && input != null)
        'input': (input as Input$UpdatePostInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdatePost<TRes>
    implements CopyWith$Variables$Mutation$UpdatePost<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdatePost(this._res);

  TRes _res;

  call({String? id, Input$UpdatePostInput? input}) => _res;
}

class Mutation$UpdatePost {
  Mutation$UpdatePost({this.updatePost, this.$__typename = 'Mutation'});

  factory Mutation$UpdatePost.fromJson(Map<String, dynamic> json) {
    final l$updatePost = json['updatePost'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdatePost(
      updatePost: l$updatePost == null
          ? null
          : Fragment$PostFields.fromJson(
              (l$updatePost as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$PostFields? updatePost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updatePost = updatePost;
    _resultData['updatePost'] = l$updatePost?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updatePost = updatePost;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updatePost, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdatePost || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updatePost = updatePost;
    final lOther$updatePost = other.updatePost;
    if (l$updatePost != lOther$updatePost) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdatePost on Mutation$UpdatePost {
  CopyWith$Mutation$UpdatePost<Mutation$UpdatePost> get copyWith =>
      CopyWith$Mutation$UpdatePost(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdatePost<TRes> {
  factory CopyWith$Mutation$UpdatePost(
    Mutation$UpdatePost instance,
    TRes Function(Mutation$UpdatePost) then,
  ) = _CopyWithImpl$Mutation$UpdatePost;

  factory CopyWith$Mutation$UpdatePost.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdatePost;

  TRes call({Fragment$PostFields? updatePost, String? $__typename});
  CopyWith$Fragment$PostFields<TRes> get updatePost;
}

class _CopyWithImpl$Mutation$UpdatePost<TRes>
    implements CopyWith$Mutation$UpdatePost<TRes> {
  _CopyWithImpl$Mutation$UpdatePost(this._instance, this._then);

  final Mutation$UpdatePost _instance;

  final TRes Function(Mutation$UpdatePost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updatePost = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdatePost(
      updatePost: updatePost == _undefined
          ? _instance.updatePost
          : (updatePost as Fragment$PostFields?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$PostFields<TRes> get updatePost {
    final local$updatePost = _instance.updatePost;
    return local$updatePost == null
        ? CopyWith$Fragment$PostFields.stub(_then(_instance))
        : CopyWith$Fragment$PostFields(
            local$updatePost,
            (e) => call(updatePost: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdatePost<TRes>
    implements CopyWith$Mutation$UpdatePost<TRes> {
  _CopyWithStubImpl$Mutation$UpdatePost(this._res);

  TRes _res;

  call({Fragment$PostFields? updatePost, String? $__typename}) => _res;

  CopyWith$Fragment$PostFields<TRes> get updatePost =>
      CopyWith$Fragment$PostFields.stub(_res);
}

const documentNodeMutationUpdatePost = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdatePost'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdatePostInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updatePost'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'PostFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionPostFields,
  ],
);
Mutation$UpdatePost _parserFn$Mutation$UpdatePost(Map<String, dynamic> data) =>
    Mutation$UpdatePost.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdatePost =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdatePost?);

class Options$Mutation$UpdatePost
    extends graphql.MutationOptions<Mutation$UpdatePost> {
  Options$Mutation$UpdatePost({
    String? operationName,
    required Variables$Mutation$UpdatePost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePost? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdatePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdatePost>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UpdatePost(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdatePost,
         parserFn: _parserFn$Mutation$UpdatePost,
       );

  final OnMutationCompleted$Mutation$UpdatePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdatePost
    extends graphql.WatchQueryOptions<Mutation$UpdatePost> {
  WatchOptions$Mutation$UpdatePost({
    String? operationName,
    required Variables$Mutation$UpdatePost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePost? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUpdatePost,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdatePost,
       );
}

extension ClientExtension$Mutation$UpdatePost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdatePost>> mutate$UpdatePost(
    Options$Mutation$UpdatePost options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdatePost> watchMutation$UpdatePost(
    WatchOptions$Mutation$UpdatePost options,
  ) => this.watchMutation(options);
}

class Mutation$UpdatePost$HookResult {
  Mutation$UpdatePost$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdatePost runMutation;

  final graphql.QueryResult<Mutation$UpdatePost> result;
}

Mutation$UpdatePost$HookResult useMutation$UpdatePost([
  WidgetOptions$Mutation$UpdatePost? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdatePost(),
  );
  return Mutation$UpdatePost$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdatePost> useWatchMutation$UpdatePost(
  WatchOptions$Mutation$UpdatePost options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdatePost
    extends graphql.MutationOptions<Mutation$UpdatePost> {
  WidgetOptions$Mutation$UpdatePost({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePost? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdatePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdatePost>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UpdatePost(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdatePost,
         parserFn: _parserFn$Mutation$UpdatePost,
       );

  final OnMutationCompleted$Mutation$UpdatePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdatePost =
    graphql.MultiSourceResult<Mutation$UpdatePost> Function(
      Variables$Mutation$UpdatePost, {
      Object? optimisticResult,
      Mutation$UpdatePost? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdatePost =
    widgets.Widget Function(
      RunMutation$Mutation$UpdatePost,
      graphql.QueryResult<Mutation$UpdatePost>?,
    );

class Mutation$UpdatePost$Widget
    extends graphql_flutter.Mutation<Mutation$UpdatePost> {
  Mutation$UpdatePost$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdatePost? options,
    required Builder$Mutation$UpdatePost builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdatePost(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Mutation$DeletePost {
  factory Variables$Mutation$DeletePost({required String id}) =>
      Variables$Mutation$DeletePost._({r'id': id});

  Variables$Mutation$DeletePost._(this._$data);

  factory Variables$Mutation$DeletePost.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Mutation$DeletePost._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeletePost<Variables$Mutation$DeletePost>
  get copyWith => CopyWith$Variables$Mutation$DeletePost(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeletePost ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$DeletePost<TRes> {
  factory CopyWith$Variables$Mutation$DeletePost(
    Variables$Mutation$DeletePost instance,
    TRes Function(Variables$Mutation$DeletePost) then,
  ) = _CopyWithImpl$Variables$Mutation$DeletePost;

  factory CopyWith$Variables$Mutation$DeletePost.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeletePost;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Mutation$DeletePost<TRes>
    implements CopyWith$Variables$Mutation$DeletePost<TRes> {
  _CopyWithImpl$Variables$Mutation$DeletePost(this._instance, this._then);

  final Variables$Mutation$DeletePost _instance;

  final TRes Function(Variables$Mutation$DeletePost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Mutation$DeletePost._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeletePost<TRes>
    implements CopyWith$Variables$Mutation$DeletePost<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeletePost(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Mutation$DeletePost {
  Mutation$DeletePost({this.deletePost, this.$__typename = 'Mutation'});

  factory Mutation$DeletePost.fromJson(Map<String, dynamic> json) {
    final l$deletePost = json['deletePost'];
    final l$$__typename = json['__typename'];
    return Mutation$DeletePost(
      deletePost: (l$deletePost as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? deletePost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deletePost = deletePost;
    _resultData['deletePost'] = l$deletePost;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deletePost = deletePost;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deletePost, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeletePost || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deletePost = deletePost;
    final lOther$deletePost = other.deletePost;
    if (l$deletePost != lOther$deletePost) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeletePost on Mutation$DeletePost {
  CopyWith$Mutation$DeletePost<Mutation$DeletePost> get copyWith =>
      CopyWith$Mutation$DeletePost(this, (i) => i);
}

abstract class CopyWith$Mutation$DeletePost<TRes> {
  factory CopyWith$Mutation$DeletePost(
    Mutation$DeletePost instance,
    TRes Function(Mutation$DeletePost) then,
  ) = _CopyWithImpl$Mutation$DeletePost;

  factory CopyWith$Mutation$DeletePost.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeletePost;

  TRes call({bool? deletePost, String? $__typename});
}

class _CopyWithImpl$Mutation$DeletePost<TRes>
    implements CopyWith$Mutation$DeletePost<TRes> {
  _CopyWithImpl$Mutation$DeletePost(this._instance, this._then);

  final Mutation$DeletePost _instance;

  final TRes Function(Mutation$DeletePost) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deletePost = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeletePost(
      deletePost: deletePost == _undefined
          ? _instance.deletePost
          : (deletePost as bool?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DeletePost<TRes>
    implements CopyWith$Mutation$DeletePost<TRes> {
  _CopyWithStubImpl$Mutation$DeletePost(this._res);

  TRes _res;

  call({bool? deletePost, String? $__typename}) => _res;
}

const documentNodeMutationDeletePost = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeletePost'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deletePost'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Mutation$DeletePost _parserFn$Mutation$DeletePost(Map<String, dynamic> data) =>
    Mutation$DeletePost.fromJson(data);
typedef OnMutationCompleted$Mutation$DeletePost =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeletePost?);

class Options$Mutation$DeletePost
    extends graphql.MutationOptions<Mutation$DeletePost> {
  Options$Mutation$DeletePost({
    String? operationName,
    required Variables$Mutation$DeletePost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeletePost? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeletePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeletePost>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$DeletePost(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeletePost,
         parserFn: _parserFn$Mutation$DeletePost,
       );

  final OnMutationCompleted$Mutation$DeletePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeletePost
    extends graphql.WatchQueryOptions<Mutation$DeletePost> {
  WatchOptions$Mutation$DeletePost({
    String? operationName,
    required Variables$Mutation$DeletePost variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeletePost? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeletePost,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeletePost,
       );
}

extension ClientExtension$Mutation$DeletePost on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeletePost>> mutate$DeletePost(
    Options$Mutation$DeletePost options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeletePost> watchMutation$DeletePost(
    WatchOptions$Mutation$DeletePost options,
  ) => this.watchMutation(options);
}

class Mutation$DeletePost$HookResult {
  Mutation$DeletePost$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeletePost runMutation;

  final graphql.QueryResult<Mutation$DeletePost> result;
}

Mutation$DeletePost$HookResult useMutation$DeletePost([
  WidgetOptions$Mutation$DeletePost? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeletePost(),
  );
  return Mutation$DeletePost$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeletePost> useWatchMutation$DeletePost(
  WatchOptions$Mutation$DeletePost options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeletePost
    extends graphql.MutationOptions<Mutation$DeletePost> {
  WidgetOptions$Mutation$DeletePost({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeletePost? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeletePost? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeletePost>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$DeletePost(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeletePost,
         parserFn: _parserFn$Mutation$DeletePost,
       );

  final OnMutationCompleted$Mutation$DeletePost? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeletePost =
    graphql.MultiSourceResult<Mutation$DeletePost> Function(
      Variables$Mutation$DeletePost, {
      Object? optimisticResult,
      Mutation$DeletePost? typedOptimisticResult,
    });
typedef Builder$Mutation$DeletePost =
    widgets.Widget Function(
      RunMutation$Mutation$DeletePost,
      graphql.QueryResult<Mutation$DeletePost>?,
    );

class Mutation$DeletePost$Widget
    extends graphql_flutter.Mutation<Mutation$DeletePost> {
  Mutation$DeletePost$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeletePost? options,
    required Builder$Mutation$DeletePost builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeletePost(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}
