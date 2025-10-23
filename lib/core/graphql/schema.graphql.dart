class Input$AddressInput {
  factory Input$AddressInput({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Input$GeoInput? geo,
  }) => Input$AddressInput._({
    if (street != null) r'street': street,
    if (suite != null) r'suite': suite,
    if (city != null) r'city': city,
    if (zipcode != null) r'zipcode': zipcode,
    if (geo != null) r'geo': geo,
  });

  Input$AddressInput._(this._$data);

  factory Input$AddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('street')) {
      final l$street = data['street'];
      result$data['street'] = (l$street as String?);
    }
    if (data.containsKey('suite')) {
      final l$suite = data['suite'];
      result$data['suite'] = (l$suite as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('zipcode')) {
      final l$zipcode = data['zipcode'];
      result$data['zipcode'] = (l$zipcode as String?);
    }
    if (data.containsKey('geo')) {
      final l$geo = data['geo'];
      result$data['geo'] = l$geo == null
          ? null
          : Input$GeoInput.fromJson((l$geo as Map<String, dynamic>));
    }
    return Input$AddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get street => (_$data['street'] as String?);

  String? get suite => (_$data['suite'] as String?);

  String? get city => (_$data['city'] as String?);

  String? get zipcode => (_$data['zipcode'] as String?);

  Input$GeoInput? get geo => (_$data['geo'] as Input$GeoInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('street')) {
      final l$street = street;
      result$data['street'] = l$street;
    }
    if (_$data.containsKey('suite')) {
      final l$suite = suite;
      result$data['suite'] = l$suite;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('zipcode')) {
      final l$zipcode = zipcode;
      result$data['zipcode'] = l$zipcode;
    }
    if (_$data.containsKey('geo')) {
      final l$geo = geo;
      result$data['geo'] = l$geo?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$AddressInput<Input$AddressInput> get copyWith =>
      CopyWith$Input$AddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AddressInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (_$data.containsKey('street') != other._$data.containsKey('street')) {
      return false;
    }
    if (l$street != lOther$street) {
      return false;
    }
    final l$suite = suite;
    final lOther$suite = other.suite;
    if (_$data.containsKey('suite') != other._$data.containsKey('suite')) {
      return false;
    }
    if (l$suite != lOther$suite) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$zipcode = zipcode;
    final lOther$zipcode = other.zipcode;
    if (_$data.containsKey('zipcode') != other._$data.containsKey('zipcode')) {
      return false;
    }
    if (l$zipcode != lOther$zipcode) {
      return false;
    }
    final l$geo = geo;
    final lOther$geo = other.geo;
    if (_$data.containsKey('geo') != other._$data.containsKey('geo')) {
      return false;
    }
    if (l$geo != lOther$geo) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$street = street;
    final l$suite = suite;
    final l$city = city;
    final l$zipcode = zipcode;
    final l$geo = geo;
    return Object.hashAll([
      _$data.containsKey('street') ? l$street : const {},
      _$data.containsKey('suite') ? l$suite : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('zipcode') ? l$zipcode : const {},
      _$data.containsKey('geo') ? l$geo : const {},
    ]);
  }
}

abstract class CopyWith$Input$AddressInput<TRes> {
  factory CopyWith$Input$AddressInput(
    Input$AddressInput instance,
    TRes Function(Input$AddressInput) then,
  ) = _CopyWithImpl$Input$AddressInput;

  factory CopyWith$Input$AddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AddressInput;

  TRes call({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Input$GeoInput? geo,
  });
  CopyWith$Input$GeoInput<TRes> get geo;
}

class _CopyWithImpl$Input$AddressInput<TRes>
    implements CopyWith$Input$AddressInput<TRes> {
  _CopyWithImpl$Input$AddressInput(this._instance, this._then);

  final Input$AddressInput _instance;

  final TRes Function(Input$AddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? street = _undefined,
    Object? suite = _undefined,
    Object? city = _undefined,
    Object? zipcode = _undefined,
    Object? geo = _undefined,
  }) => _then(
    Input$AddressInput._({
      ..._instance._$data,
      if (street != _undefined) 'street': (street as String?),
      if (suite != _undefined) 'suite': (suite as String?),
      if (city != _undefined) 'city': (city as String?),
      if (zipcode != _undefined) 'zipcode': (zipcode as String?),
      if (geo != _undefined) 'geo': (geo as Input$GeoInput?),
    }),
  );

  CopyWith$Input$GeoInput<TRes> get geo {
    final local$geo = _instance.geo;
    return local$geo == null
        ? CopyWith$Input$GeoInput.stub(_then(_instance))
        : CopyWith$Input$GeoInput(local$geo, (e) => call(geo: e));
  }
}

class _CopyWithStubImpl$Input$AddressInput<TRes>
    implements CopyWith$Input$AddressInput<TRes> {
  _CopyWithStubImpl$Input$AddressInput(this._res);

  TRes _res;

  call({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Input$GeoInput? geo,
  }) => _res;

  CopyWith$Input$GeoInput<TRes> get geo => CopyWith$Input$GeoInput.stub(_res);
}

class Input$CompanyInput {
  factory Input$CompanyInput({String? name, String? catchPhrase, String? bs}) =>
      Input$CompanyInput._({
        if (name != null) r'name': name,
        if (catchPhrase != null) r'catchPhrase': catchPhrase,
        if (bs != null) r'bs': bs,
      });

  Input$CompanyInput._(this._$data);

  factory Input$CompanyInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('catchPhrase')) {
      final l$catchPhrase = data['catchPhrase'];
      result$data['catchPhrase'] = (l$catchPhrase as String?);
    }
    if (data.containsKey('bs')) {
      final l$bs = data['bs'];
      result$data['bs'] = (l$bs as String?);
    }
    return Input$CompanyInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get catchPhrase => (_$data['catchPhrase'] as String?);

  String? get bs => (_$data['bs'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('catchPhrase')) {
      final l$catchPhrase = catchPhrase;
      result$data['catchPhrase'] = l$catchPhrase;
    }
    if (_$data.containsKey('bs')) {
      final l$bs = bs;
      result$data['bs'] = l$bs;
    }
    return result$data;
  }

  CopyWith$Input$CompanyInput<Input$CompanyInput> get copyWith =>
      CopyWith$Input$CompanyInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CompanyInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$catchPhrase = catchPhrase;
    final lOther$catchPhrase = other.catchPhrase;
    if (_$data.containsKey('catchPhrase') !=
        other._$data.containsKey('catchPhrase')) {
      return false;
    }
    if (l$catchPhrase != lOther$catchPhrase) {
      return false;
    }
    final l$bs = bs;
    final lOther$bs = other.bs;
    if (_$data.containsKey('bs') != other._$data.containsKey('bs')) {
      return false;
    }
    if (l$bs != lOther$bs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$catchPhrase = catchPhrase;
    final l$bs = bs;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('catchPhrase') ? l$catchPhrase : const {},
      _$data.containsKey('bs') ? l$bs : const {},
    ]);
  }
}

abstract class CopyWith$Input$CompanyInput<TRes> {
  factory CopyWith$Input$CompanyInput(
    Input$CompanyInput instance,
    TRes Function(Input$CompanyInput) then,
  ) = _CopyWithImpl$Input$CompanyInput;

  factory CopyWith$Input$CompanyInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CompanyInput;

  TRes call({String? name, String? catchPhrase, String? bs});
}

class _CopyWithImpl$Input$CompanyInput<TRes>
    implements CopyWith$Input$CompanyInput<TRes> {
  _CopyWithImpl$Input$CompanyInput(this._instance, this._then);

  final Input$CompanyInput _instance;

  final TRes Function(Input$CompanyInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? catchPhrase = _undefined,
    Object? bs = _undefined,
  }) => _then(
    Input$CompanyInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (catchPhrase != _undefined) 'catchPhrase': (catchPhrase as String?),
      if (bs != _undefined) 'bs': (bs as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$CompanyInput<TRes>
    implements CopyWith$Input$CompanyInput<TRes> {
  _CopyWithStubImpl$Input$CompanyInput(this._res);

  TRes _res;

  call({String? name, String? catchPhrase, String? bs}) => _res;
}

class Input$CreateAlbumInput {
  factory Input$CreateAlbumInput({
    required String title,
    required String userId,
  }) => Input$CreateAlbumInput._({r'title': title, r'userId': userId});

  Input$CreateAlbumInput._(this._$data);

  factory Input$CreateAlbumInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Input$CreateAlbumInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Input$CreateAlbumInput<Input$CreateAlbumInput> get copyWith =>
      CopyWith$Input$CreateAlbumInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateAlbumInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$userId = userId;
    return Object.hashAll([l$title, l$userId]);
  }
}

abstract class CopyWith$Input$CreateAlbumInput<TRes> {
  factory CopyWith$Input$CreateAlbumInput(
    Input$CreateAlbumInput instance,
    TRes Function(Input$CreateAlbumInput) then,
  ) = _CopyWithImpl$Input$CreateAlbumInput;

  factory CopyWith$Input$CreateAlbumInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateAlbumInput;

  TRes call({String? title, String? userId});
}

class _CopyWithImpl$Input$CreateAlbumInput<TRes>
    implements CopyWith$Input$CreateAlbumInput<TRes> {
  _CopyWithImpl$Input$CreateAlbumInput(this._instance, this._then);

  final Input$CreateAlbumInput _instance;

  final TRes Function(Input$CreateAlbumInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? userId = _undefined}) => _then(
    Input$CreateAlbumInput._({
      ..._instance._$data,
      if (title != _undefined && title != null) 'title': (title as String),
      if (userId != _undefined && userId != null) 'userId': (userId as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateAlbumInput<TRes>
    implements CopyWith$Input$CreateAlbumInput<TRes> {
  _CopyWithStubImpl$Input$CreateAlbumInput(this._res);

  TRes _res;

  call({String? title, String? userId}) => _res;
}

class Input$CreateCommentInput {
  factory Input$CreateCommentInput({
    required String name,
    required String email,
    required String body,
  }) => Input$CreateCommentInput._({
    r'name': name,
    r'email': email,
    r'body': body,
  });

  Input$CreateCommentInput._(this._$data);

  factory Input$CreateCommentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    return Input$CreateCommentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get email => (_$data['email'] as String);

  String get body => (_$data['body'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$email = email;
    result$data['email'] = l$email;
    final l$body = body;
    result$data['body'] = l$body;
    return result$data;
  }

  CopyWith$Input$CreateCommentInput<Input$CreateCommentInput> get copyWith =>
      CopyWith$Input$CreateCommentInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateCommentInput ||
        runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$email = email;
    final l$body = body;
    return Object.hashAll([l$name, l$email, l$body]);
  }
}

abstract class CopyWith$Input$CreateCommentInput<TRes> {
  factory CopyWith$Input$CreateCommentInput(
    Input$CreateCommentInput instance,
    TRes Function(Input$CreateCommentInput) then,
  ) = _CopyWithImpl$Input$CreateCommentInput;

  factory CopyWith$Input$CreateCommentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateCommentInput;

  TRes call({String? name, String? email, String? body});
}

class _CopyWithImpl$Input$CreateCommentInput<TRes>
    implements CopyWith$Input$CreateCommentInput<TRes> {
  _CopyWithImpl$Input$CreateCommentInput(this._instance, this._then);

  final Input$CreateCommentInput _instance;

  final TRes Function(Input$CreateCommentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? email = _undefined,
    Object? body = _undefined,
  }) => _then(
    Input$CreateCommentInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (email != _undefined && email != null) 'email': (email as String),
      if (body != _undefined && body != null) 'body': (body as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateCommentInput<TRes>
    implements CopyWith$Input$CreateCommentInput<TRes> {
  _CopyWithStubImpl$Input$CreateCommentInput(this._res);

  TRes _res;

  call({String? name, String? email, String? body}) => _res;
}

class Input$CreatePhotoInput {
  factory Input$CreatePhotoInput({
    required String title,
    required String url,
    required String thumbnailUrl,
  }) => Input$CreatePhotoInput._({
    r'title': title,
    r'url': url,
    r'thumbnailUrl': thumbnailUrl,
  });

  Input$CreatePhotoInput._(this._$data);

  factory Input$CreatePhotoInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$url = data['url'];
    result$data['url'] = (l$url as String);
    final l$thumbnailUrl = data['thumbnailUrl'];
    result$data['thumbnailUrl'] = (l$thumbnailUrl as String);
    return Input$CreatePhotoInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String get url => (_$data['url'] as String);

  String get thumbnailUrl => (_$data['thumbnailUrl'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$url = url;
    result$data['url'] = l$url;
    final l$thumbnailUrl = thumbnailUrl;
    result$data['thumbnailUrl'] = l$thumbnailUrl;
    return result$data;
  }

  CopyWith$Input$CreatePhotoInput<Input$CreatePhotoInput> get copyWith =>
      CopyWith$Input$CreatePhotoInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreatePhotoInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$thumbnailUrl = thumbnailUrl;
    final lOther$thumbnailUrl = other.thumbnailUrl;
    if (l$thumbnailUrl != lOther$thumbnailUrl) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$url = url;
    final l$thumbnailUrl = thumbnailUrl;
    return Object.hashAll([l$title, l$url, l$thumbnailUrl]);
  }
}

abstract class CopyWith$Input$CreatePhotoInput<TRes> {
  factory CopyWith$Input$CreatePhotoInput(
    Input$CreatePhotoInput instance,
    TRes Function(Input$CreatePhotoInput) then,
  ) = _CopyWithImpl$Input$CreatePhotoInput;

  factory CopyWith$Input$CreatePhotoInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreatePhotoInput;

  TRes call({String? title, String? url, String? thumbnailUrl});
}

class _CopyWithImpl$Input$CreatePhotoInput<TRes>
    implements CopyWith$Input$CreatePhotoInput<TRes> {
  _CopyWithImpl$Input$CreatePhotoInput(this._instance, this._then);

  final Input$CreatePhotoInput _instance;

  final TRes Function(Input$CreatePhotoInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? url = _undefined,
    Object? thumbnailUrl = _undefined,
  }) => _then(
    Input$CreatePhotoInput._({
      ..._instance._$data,
      if (title != _undefined && title != null) 'title': (title as String),
      if (url != _undefined && url != null) 'url': (url as String),
      if (thumbnailUrl != _undefined && thumbnailUrl != null)
        'thumbnailUrl': (thumbnailUrl as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreatePhotoInput<TRes>
    implements CopyWith$Input$CreatePhotoInput<TRes> {
  _CopyWithStubImpl$Input$CreatePhotoInput(this._res);

  TRes _res;

  call({String? title, String? url, String? thumbnailUrl}) => _res;
}

class Input$CreatePostInput {
  factory Input$CreatePostInput({
    required String title,
    required String body,
  }) => Input$CreatePostInput._({r'title': title, r'body': body});

  Input$CreatePostInput._(this._$data);

  factory Input$CreatePostInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$body = data['body'];
    result$data['body'] = (l$body as String);
    return Input$CreatePostInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String get body => (_$data['body'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$body = body;
    result$data['body'] = l$body;
    return result$data;
  }

  CopyWith$Input$CreatePostInput<Input$CreatePostInput> get copyWith =>
      CopyWith$Input$CreatePostInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreatePostInput || runtimeType != other.runtimeType) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$body = body;
    return Object.hashAll([l$title, l$body]);
  }
}

abstract class CopyWith$Input$CreatePostInput<TRes> {
  factory CopyWith$Input$CreatePostInput(
    Input$CreatePostInput instance,
    TRes Function(Input$CreatePostInput) then,
  ) = _CopyWithImpl$Input$CreatePostInput;

  factory CopyWith$Input$CreatePostInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreatePostInput;

  TRes call({String? title, String? body});
}

class _CopyWithImpl$Input$CreatePostInput<TRes>
    implements CopyWith$Input$CreatePostInput<TRes> {
  _CopyWithImpl$Input$CreatePostInput(this._instance, this._then);

  final Input$CreatePostInput _instance;

  final TRes Function(Input$CreatePostInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? body = _undefined}) => _then(
    Input$CreatePostInput._({
      ..._instance._$data,
      if (title != _undefined && title != null) 'title': (title as String),
      if (body != _undefined && body != null) 'body': (body as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreatePostInput<TRes>
    implements CopyWith$Input$CreatePostInput<TRes> {
  _CopyWithStubImpl$Input$CreatePostInput(this._res);

  TRes _res;

  call({String? title, String? body}) => _res;
}

class Input$CreateTodoInput {
  factory Input$CreateTodoInput({
    required String title,
    required bool completed,
  }) => Input$CreateTodoInput._({r'title': title, r'completed': completed});

  Input$CreateTodoInput._(this._$data);

  factory Input$CreateTodoInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    final l$completed = data['completed'];
    result$data['completed'] = (l$completed as bool);
    return Input$CreateTodoInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  bool get completed => (_$data['completed'] as bool);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    final l$completed = completed;
    result$data['completed'] = l$completed;
    return result$data;
  }

  CopyWith$Input$CreateTodoInput<Input$CreateTodoInput> get copyWith =>
      CopyWith$Input$CreateTodoInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateTodoInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$completed = completed;
    final lOther$completed = other.completed;
    if (l$completed != lOther$completed) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$completed = completed;
    return Object.hashAll([l$title, l$completed]);
  }
}

abstract class CopyWith$Input$CreateTodoInput<TRes> {
  factory CopyWith$Input$CreateTodoInput(
    Input$CreateTodoInput instance,
    TRes Function(Input$CreateTodoInput) then,
  ) = _CopyWithImpl$Input$CreateTodoInput;

  factory CopyWith$Input$CreateTodoInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateTodoInput;

  TRes call({String? title, bool? completed});
}

class _CopyWithImpl$Input$CreateTodoInput<TRes>
    implements CopyWith$Input$CreateTodoInput<TRes> {
  _CopyWithImpl$Input$CreateTodoInput(this._instance, this._then);

  final Input$CreateTodoInput _instance;

  final TRes Function(Input$CreateTodoInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? completed = _undefined}) =>
      _then(
        Input$CreateTodoInput._({
          ..._instance._$data,
          if (title != _undefined && title != null) 'title': (title as String),
          if (completed != _undefined && completed != null)
            'completed': (completed as bool),
        }),
      );
}

class _CopyWithStubImpl$Input$CreateTodoInput<TRes>
    implements CopyWith$Input$CreateTodoInput<TRes> {
  _CopyWithStubImpl$Input$CreateTodoInput(this._res);

  TRes _res;

  call({String? title, bool? completed}) => _res;
}

class Input$CreateUserInput {
  factory Input$CreateUserInput({
    required String name,
    required String username,
    required String email,
    Input$AddressInput? address,
    String? phone,
    String? website,
    Input$CompanyInput? company,
  }) => Input$CreateUserInput._({
    r'name': name,
    r'username': username,
    r'email': email,
    if (address != null) r'address': address,
    if (phone != null) r'phone': phone,
    if (website != null) r'website': website,
    if (company != null) r'company': company,
  });

  Input$CreateUserInput._(this._$data);

  factory Input$CreateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = l$address == null
          ? null
          : Input$AddressInput.fromJson((l$address as Map<String, dynamic>));
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('website')) {
      final l$website = data['website'];
      result$data['website'] = (l$website as String?);
    }
    if (data.containsKey('company')) {
      final l$company = data['company'];
      result$data['company'] = l$company == null
          ? null
          : Input$CompanyInput.fromJson((l$company as Map<String, dynamic>));
    }
    return Input$CreateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get username => (_$data['username'] as String);

  String get email => (_$data['email'] as String);

  Input$AddressInput? get address => (_$data['address'] as Input$AddressInput?);

  String? get phone => (_$data['phone'] as String?);

  String? get website => (_$data['website'] as String?);

  Input$CompanyInput? get company => (_$data['company'] as Input$CompanyInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$username = username;
    result$data['username'] = l$username;
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address?.toJson();
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('website')) {
      final l$website = website;
      result$data['website'] = l$website;
    }
    if (_$data.containsKey('company')) {
      final l$company = company;
      result$data['company'] = l$company?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$CreateUserInput<Input$CreateUserInput> get copyWith =>
      CopyWith$Input$CreateUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$website = website;
    final lOther$website = other.website;
    if (_$data.containsKey('website') != other._$data.containsKey('website')) {
      return false;
    }
    if (l$website != lOther$website) {
      return false;
    }
    final l$company = company;
    final lOther$company = other.company;
    if (_$data.containsKey('company') != other._$data.containsKey('company')) {
      return false;
    }
    if (l$company != lOther$company) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$username = username;
    final l$email = email;
    final l$address = address;
    final l$phone = phone;
    final l$website = website;
    final l$company = company;
    return Object.hashAll([
      l$name,
      l$username,
      l$email,
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('website') ? l$website : const {},
      _$data.containsKey('company') ? l$company : const {},
    ]);
  }
}

abstract class CopyWith$Input$CreateUserInput<TRes> {
  factory CopyWith$Input$CreateUserInput(
    Input$CreateUserInput instance,
    TRes Function(Input$CreateUserInput) then,
  ) = _CopyWithImpl$Input$CreateUserInput;

  factory CopyWith$Input$CreateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateUserInput;

  TRes call({
    String? name,
    String? username,
    String? email,
    Input$AddressInput? address,
    String? phone,
    String? website,
    Input$CompanyInput? company,
  });
  CopyWith$Input$AddressInput<TRes> get address;
  CopyWith$Input$CompanyInput<TRes> get company;
}

class _CopyWithImpl$Input$CreateUserInput<TRes>
    implements CopyWith$Input$CreateUserInput<TRes> {
  _CopyWithImpl$Input$CreateUserInput(this._instance, this._then);

  final Input$CreateUserInput _instance;

  final TRes Function(Input$CreateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? username = _undefined,
    Object? email = _undefined,
    Object? address = _undefined,
    Object? phone = _undefined,
    Object? website = _undefined,
    Object? company = _undefined,
  }) => _then(
    Input$CreateUserInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (username != _undefined && username != null)
        'username': (username as String),
      if (email != _undefined && email != null) 'email': (email as String),
      if (address != _undefined) 'address': (address as Input$AddressInput?),
      if (phone != _undefined) 'phone': (phone as String?),
      if (website != _undefined) 'website': (website as String?),
      if (company != _undefined) 'company': (company as Input$CompanyInput?),
    }),
  );

  CopyWith$Input$AddressInput<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Input$AddressInput.stub(_then(_instance))
        : CopyWith$Input$AddressInput(local$address, (e) => call(address: e));
  }

  CopyWith$Input$CompanyInput<TRes> get company {
    final local$company = _instance.company;
    return local$company == null
        ? CopyWith$Input$CompanyInput.stub(_then(_instance))
        : CopyWith$Input$CompanyInput(local$company, (e) => call(company: e));
  }
}

class _CopyWithStubImpl$Input$CreateUserInput<TRes>
    implements CopyWith$Input$CreateUserInput<TRes> {
  _CopyWithStubImpl$Input$CreateUserInput(this._res);

  TRes _res;

  call({
    String? name,
    String? username,
    String? email,
    Input$AddressInput? address,
    String? phone,
    String? website,
    Input$CompanyInput? company,
  }) => _res;

  CopyWith$Input$AddressInput<TRes> get address =>
      CopyWith$Input$AddressInput.stub(_res);

  CopyWith$Input$CompanyInput<TRes> get company =>
      CopyWith$Input$CompanyInput.stub(_res);
}

class Input$GeoInput {
  factory Input$GeoInput({double? lat, double? lng}) => Input$GeoInput._({
    if (lat != null) r'lat': lat,
    if (lng != null) r'lng': lng,
  });

  Input$GeoInput._(this._$data);

  factory Input$GeoInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('lat')) {
      final l$lat = data['lat'];
      result$data['lat'] = (l$lat as num?)?.toDouble();
    }
    if (data.containsKey('lng')) {
      final l$lng = data['lng'];
      result$data['lng'] = (l$lng as num?)?.toDouble();
    }
    return Input$GeoInput._(result$data);
  }

  Map<String, dynamic> _$data;

  double? get lat => (_$data['lat'] as double?);

  double? get lng => (_$data['lng'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('lat')) {
      final l$lat = lat;
      result$data['lat'] = l$lat;
    }
    if (_$data.containsKey('lng')) {
      final l$lng = lng;
      result$data['lng'] = l$lng;
    }
    return result$data;
  }

  CopyWith$Input$GeoInput<Input$GeoInput> get copyWith =>
      CopyWith$Input$GeoInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$GeoInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$lat = lat;
    final lOther$lat = other.lat;
    if (_$data.containsKey('lat') != other._$data.containsKey('lat')) {
      return false;
    }
    if (l$lat != lOther$lat) {
      return false;
    }
    final l$lng = lng;
    final lOther$lng = other.lng;
    if (_$data.containsKey('lng') != other._$data.containsKey('lng')) {
      return false;
    }
    if (l$lng != lOther$lng) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$lat = lat;
    final l$lng = lng;
    return Object.hashAll([
      _$data.containsKey('lat') ? l$lat : const {},
      _$data.containsKey('lng') ? l$lng : const {},
    ]);
  }
}

abstract class CopyWith$Input$GeoInput<TRes> {
  factory CopyWith$Input$GeoInput(
    Input$GeoInput instance,
    TRes Function(Input$GeoInput) then,
  ) = _CopyWithImpl$Input$GeoInput;

  factory CopyWith$Input$GeoInput.stub(TRes res) =
      _CopyWithStubImpl$Input$GeoInput;

  TRes call({double? lat, double? lng});
}

class _CopyWithImpl$Input$GeoInput<TRes>
    implements CopyWith$Input$GeoInput<TRes> {
  _CopyWithImpl$Input$GeoInput(this._instance, this._then);

  final Input$GeoInput _instance;

  final TRes Function(Input$GeoInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? lat = _undefined, Object? lng = _undefined}) => _then(
    Input$GeoInput._({
      ..._instance._$data,
      if (lat != _undefined) 'lat': (lat as double?),
      if (lng != _undefined) 'lng': (lng as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$GeoInput<TRes>
    implements CopyWith$Input$GeoInput<TRes> {
  _CopyWithStubImpl$Input$GeoInput(this._res);

  TRes _res;

  call({double? lat, double? lng}) => _res;
}

class Input$OperatorOptions {
  factory Input$OperatorOptions({
    Enum$OperatorKindEnum? kind,
    String? field,
    String? value,
  }) => Input$OperatorOptions._({
    if (kind != null) r'kind': kind,
    if (field != null) r'field': field,
    if (value != null) r'value': value,
  });

  Input$OperatorOptions._(this._$data);

  factory Input$OperatorOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('kind')) {
      final l$kind = data['kind'];
      result$data['kind'] = l$kind == null
          ? null
          : fromJson$Enum$OperatorKindEnum((l$kind as String));
    }
    if (data.containsKey('field')) {
      final l$field = data['field'];
      result$data['field'] = (l$field as String?);
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Input$OperatorOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$OperatorKindEnum? get kind => (_$data['kind'] as Enum$OperatorKindEnum?);

  String? get field => (_$data['field'] as String?);

  String? get value => (_$data['value'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('kind')) {
      final l$kind = kind;
      result$data['kind'] = l$kind == null
          ? null
          : toJson$Enum$OperatorKindEnum(l$kind);
    }
    if (_$data.containsKey('field')) {
      final l$field = field;
      result$data['field'] = l$field;
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Input$OperatorOptions<Input$OperatorOptions> get copyWith =>
      CopyWith$Input$OperatorOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$OperatorOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$kind = kind;
    final lOther$kind = other.kind;
    if (_$data.containsKey('kind') != other._$data.containsKey('kind')) {
      return false;
    }
    if (l$kind != lOther$kind) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (_$data.containsKey('field') != other._$data.containsKey('field')) {
      return false;
    }
    if (l$field != lOther$field) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$kind = kind;
    final l$field = field;
    final l$value = value;
    return Object.hashAll([
      _$data.containsKey('kind') ? l$kind : const {},
      _$data.containsKey('field') ? l$field : const {},
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$OperatorOptions<TRes> {
  factory CopyWith$Input$OperatorOptions(
    Input$OperatorOptions instance,
    TRes Function(Input$OperatorOptions) then,
  ) = _CopyWithImpl$Input$OperatorOptions;

  factory CopyWith$Input$OperatorOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$OperatorOptions;

  TRes call({Enum$OperatorKindEnum? kind, String? field, String? value});
}

class _CopyWithImpl$Input$OperatorOptions<TRes>
    implements CopyWith$Input$OperatorOptions<TRes> {
  _CopyWithImpl$Input$OperatorOptions(this._instance, this._then);

  final Input$OperatorOptions _instance;

  final TRes Function(Input$OperatorOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? kind = _undefined,
    Object? field = _undefined,
    Object? value = _undefined,
  }) => _then(
    Input$OperatorOptions._({
      ..._instance._$data,
      if (kind != _undefined) 'kind': (kind as Enum$OperatorKindEnum?),
      if (field != _undefined) 'field': (field as String?),
      if (value != _undefined) 'value': (value as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$OperatorOptions<TRes>
    implements CopyWith$Input$OperatorOptions<TRes> {
  _CopyWithStubImpl$Input$OperatorOptions(this._res);

  TRes _res;

  call({Enum$OperatorKindEnum? kind, String? field, String? value}) => _res;
}

class Input$PageQueryOptions {
  factory Input$PageQueryOptions({
    Input$PaginateOptions? paginate,
    Input$SliceOptions? slice,
    List<Input$SortOptions?>? sort,
    List<Input$OperatorOptions?>? operators,
    Input$SearchOptions? search,
  }) => Input$PageQueryOptions._({
    if (paginate != null) r'paginate': paginate,
    if (slice != null) r'slice': slice,
    if (sort != null) r'sort': sort,
    if (operators != null) r'operators': operators,
    if (search != null) r'search': search,
  });

  Input$PageQueryOptions._(this._$data);

  factory Input$PageQueryOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('paginate')) {
      final l$paginate = data['paginate'];
      result$data['paginate'] = l$paginate == null
          ? null
          : Input$PaginateOptions.fromJson(
              (l$paginate as Map<String, dynamic>),
            );
    }
    if (data.containsKey('slice')) {
      final l$slice = data['slice'];
      result$data['slice'] = l$slice == null
          ? null
          : Input$SliceOptions.fromJson((l$slice as Map<String, dynamic>));
    }
    if (data.containsKey('sort')) {
      final l$sort = data['sort'];
      result$data['sort'] = (l$sort as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$SortOptions.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('operators')) {
      final l$operators = data['operators'];
      result$data['operators'] = (l$operators as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$OperatorOptions.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = l$search == null
          ? null
          : Input$SearchOptions.fromJson((l$search as Map<String, dynamic>));
    }
    return Input$PageQueryOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$PaginateOptions? get paginate =>
      (_$data['paginate'] as Input$PaginateOptions?);

  Input$SliceOptions? get slice => (_$data['slice'] as Input$SliceOptions?);

  List<Input$SortOptions?>? get sort =>
      (_$data['sort'] as List<Input$SortOptions?>?);

  List<Input$OperatorOptions?>? get operators =>
      (_$data['operators'] as List<Input$OperatorOptions?>?);

  Input$SearchOptions? get search => (_$data['search'] as Input$SearchOptions?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('paginate')) {
      final l$paginate = paginate;
      result$data['paginate'] = l$paginate?.toJson();
    }
    if (_$data.containsKey('slice')) {
      final l$slice = slice;
      result$data['slice'] = l$slice?.toJson();
    }
    if (_$data.containsKey('sort')) {
      final l$sort = sort;
      result$data['sort'] = l$sort?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('operators')) {
      final l$operators = operators;
      result$data['operators'] = l$operators?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$PageQueryOptions<Input$PageQueryOptions> get copyWith =>
      CopyWith$Input$PageQueryOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$PageQueryOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$paginate = paginate;
    final lOther$paginate = other.paginate;
    if (_$data.containsKey('paginate') !=
        other._$data.containsKey('paginate')) {
      return false;
    }
    if (l$paginate != lOther$paginate) {
      return false;
    }
    final l$slice = slice;
    final lOther$slice = other.slice;
    if (_$data.containsKey('slice') != other._$data.containsKey('slice')) {
      return false;
    }
    if (l$slice != lOther$slice) {
      return false;
    }
    final l$sort = sort;
    final lOther$sort = other.sort;
    if (_$data.containsKey('sort') != other._$data.containsKey('sort')) {
      return false;
    }
    if (l$sort != null && lOther$sort != null) {
      if (l$sort.length != lOther$sort.length) {
        return false;
      }
      for (int i = 0; i < l$sort.length; i++) {
        final l$sort$entry = l$sort[i];
        final lOther$sort$entry = lOther$sort[i];
        if (l$sort$entry != lOther$sort$entry) {
          return false;
        }
      }
    } else if (l$sort != lOther$sort) {
      return false;
    }
    final l$operators = operators;
    final lOther$operators = other.operators;
    if (_$data.containsKey('operators') !=
        other._$data.containsKey('operators')) {
      return false;
    }
    if (l$operators != null && lOther$operators != null) {
      if (l$operators.length != lOther$operators.length) {
        return false;
      }
      for (int i = 0; i < l$operators.length; i++) {
        final l$operators$entry = l$operators[i];
        final lOther$operators$entry = lOther$operators[i];
        if (l$operators$entry != lOther$operators$entry) {
          return false;
        }
      }
    } else if (l$operators != lOther$operators) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$paginate = paginate;
    final l$slice = slice;
    final l$sort = sort;
    final l$operators = operators;
    final l$search = search;
    return Object.hashAll([
      _$data.containsKey('paginate') ? l$paginate : const {},
      _$data.containsKey('slice') ? l$slice : const {},
      _$data.containsKey('sort')
          ? l$sort == null
                ? null
                : Object.hashAll(l$sort.map((v) => v))
          : const {},
      _$data.containsKey('operators')
          ? l$operators == null
                ? null
                : Object.hashAll(l$operators.map((v) => v))
          : const {},
      _$data.containsKey('search') ? l$search : const {},
    ]);
  }
}

abstract class CopyWith$Input$PageQueryOptions<TRes> {
  factory CopyWith$Input$PageQueryOptions(
    Input$PageQueryOptions instance,
    TRes Function(Input$PageQueryOptions) then,
  ) = _CopyWithImpl$Input$PageQueryOptions;

  factory CopyWith$Input$PageQueryOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$PageQueryOptions;

  TRes call({
    Input$PaginateOptions? paginate,
    Input$SliceOptions? slice,
    List<Input$SortOptions?>? sort,
    List<Input$OperatorOptions?>? operators,
    Input$SearchOptions? search,
  });
  CopyWith$Input$PaginateOptions<TRes> get paginate;
  CopyWith$Input$SliceOptions<TRes> get slice;
  TRes sort(
    Iterable<Input$SortOptions?>? Function(
      Iterable<CopyWith$Input$SortOptions<Input$SortOptions>?>?,
    )
    _fn,
  );
  TRes operators(
    Iterable<Input$OperatorOptions?>? Function(
      Iterable<CopyWith$Input$OperatorOptions<Input$OperatorOptions>?>?,
    )
    _fn,
  );
  CopyWith$Input$SearchOptions<TRes> get search;
}

class _CopyWithImpl$Input$PageQueryOptions<TRes>
    implements CopyWith$Input$PageQueryOptions<TRes> {
  _CopyWithImpl$Input$PageQueryOptions(this._instance, this._then);

  final Input$PageQueryOptions _instance;

  final TRes Function(Input$PageQueryOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? paginate = _undefined,
    Object? slice = _undefined,
    Object? sort = _undefined,
    Object? operators = _undefined,
    Object? search = _undefined,
  }) => _then(
    Input$PageQueryOptions._({
      ..._instance._$data,
      if (paginate != _undefined)
        'paginate': (paginate as Input$PaginateOptions?),
      if (slice != _undefined) 'slice': (slice as Input$SliceOptions?),
      if (sort != _undefined) 'sort': (sort as List<Input$SortOptions?>?),
      if (operators != _undefined)
        'operators': (operators as List<Input$OperatorOptions?>?),
      if (search != _undefined) 'search': (search as Input$SearchOptions?),
    }),
  );

  CopyWith$Input$PaginateOptions<TRes> get paginate {
    final local$paginate = _instance.paginate;
    return local$paginate == null
        ? CopyWith$Input$PaginateOptions.stub(_then(_instance))
        : CopyWith$Input$PaginateOptions(
            local$paginate,
            (e) => call(paginate: e),
          );
  }

  CopyWith$Input$SliceOptions<TRes> get slice {
    final local$slice = _instance.slice;
    return local$slice == null
        ? CopyWith$Input$SliceOptions.stub(_then(_instance))
        : CopyWith$Input$SliceOptions(local$slice, (e) => call(slice: e));
  }

  TRes sort(
    Iterable<Input$SortOptions?>? Function(
      Iterable<CopyWith$Input$SortOptions<Input$SortOptions>?>?,
    )
    _fn,
  ) => call(
    sort: _fn(
      _instance.sort?.map(
        (e) => e == null ? null : CopyWith$Input$SortOptions(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes operators(
    Iterable<Input$OperatorOptions?>? Function(
      Iterable<CopyWith$Input$OperatorOptions<Input$OperatorOptions>?>?,
    )
    _fn,
  ) => call(
    operators: _fn(
      _instance.operators?.map(
        (e) => e == null ? null : CopyWith$Input$OperatorOptions(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Input$SearchOptions<TRes> get search {
    final local$search = _instance.search;
    return local$search == null
        ? CopyWith$Input$SearchOptions.stub(_then(_instance))
        : CopyWith$Input$SearchOptions(local$search, (e) => call(search: e));
  }
}

class _CopyWithStubImpl$Input$PageQueryOptions<TRes>
    implements CopyWith$Input$PageQueryOptions<TRes> {
  _CopyWithStubImpl$Input$PageQueryOptions(this._res);

  TRes _res;

  call({
    Input$PaginateOptions? paginate,
    Input$SliceOptions? slice,
    List<Input$SortOptions?>? sort,
    List<Input$OperatorOptions?>? operators,
    Input$SearchOptions? search,
  }) => _res;

  CopyWith$Input$PaginateOptions<TRes> get paginate =>
      CopyWith$Input$PaginateOptions.stub(_res);

  CopyWith$Input$SliceOptions<TRes> get slice =>
      CopyWith$Input$SliceOptions.stub(_res);

  sort(_fn) => _res;

  operators(_fn) => _res;

  CopyWith$Input$SearchOptions<TRes> get search =>
      CopyWith$Input$SearchOptions.stub(_res);
}

class Input$PaginateOptions {
  factory Input$PaginateOptions({int? page, int? limit}) =>
      Input$PaginateOptions._({
        if (page != null) r'page': page,
        if (limit != null) r'limit': limit,
      });

  Input$PaginateOptions._(this._$data);

  factory Input$PaginateOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('page')) {
      final l$page = data['page'];
      result$data['page'] = (l$page as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Input$PaginateOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get page => (_$data['page'] as int?);

  int? get limit => (_$data['limit'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('page')) {
      final l$page = page;
      result$data['page'] = l$page;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Input$PaginateOptions<Input$PaginateOptions> get copyWith =>
      CopyWith$Input$PaginateOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$PaginateOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$page = page;
    final lOther$page = other.page;
    if (_$data.containsKey('page') != other._$data.containsKey('page')) {
      return false;
    }
    if (l$page != lOther$page) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$page = page;
    final l$limit = limit;
    return Object.hashAll([
      _$data.containsKey('page') ? l$page : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Input$PaginateOptions<TRes> {
  factory CopyWith$Input$PaginateOptions(
    Input$PaginateOptions instance,
    TRes Function(Input$PaginateOptions) then,
  ) = _CopyWithImpl$Input$PaginateOptions;

  factory CopyWith$Input$PaginateOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$PaginateOptions;

  TRes call({int? page, int? limit});
}

class _CopyWithImpl$Input$PaginateOptions<TRes>
    implements CopyWith$Input$PaginateOptions<TRes> {
  _CopyWithImpl$Input$PaginateOptions(this._instance, this._then);

  final Input$PaginateOptions _instance;

  final TRes Function(Input$PaginateOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? page = _undefined, Object? limit = _undefined}) => _then(
    Input$PaginateOptions._({
      ..._instance._$data,
      if (page != _undefined) 'page': (page as int?),
      if (limit != _undefined) 'limit': (limit as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$PaginateOptions<TRes>
    implements CopyWith$Input$PaginateOptions<TRes> {
  _CopyWithStubImpl$Input$PaginateOptions(this._res);

  TRes _res;

  call({int? page, int? limit}) => _res;
}

class Input$SearchOptions {
  factory Input$SearchOptions({String? q}) =>
      Input$SearchOptions._({if (q != null) r'q': q});

  Input$SearchOptions._(this._$data);

  factory Input$SearchOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('q')) {
      final l$q = data['q'];
      result$data['q'] = (l$q as String?);
    }
    return Input$SearchOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get q => (_$data['q'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('q')) {
      final l$q = q;
      result$data['q'] = l$q;
    }
    return result$data;
  }

  CopyWith$Input$SearchOptions<Input$SearchOptions> get copyWith =>
      CopyWith$Input$SearchOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SearchOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$q = q;
    final lOther$q = other.q;
    if (_$data.containsKey('q') != other._$data.containsKey('q')) {
      return false;
    }
    if (l$q != lOther$q) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$q = q;
    return Object.hashAll([_$data.containsKey('q') ? l$q : const {}]);
  }
}

abstract class CopyWith$Input$SearchOptions<TRes> {
  factory CopyWith$Input$SearchOptions(
    Input$SearchOptions instance,
    TRes Function(Input$SearchOptions) then,
  ) = _CopyWithImpl$Input$SearchOptions;

  factory CopyWith$Input$SearchOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$SearchOptions;

  TRes call({String? q});
}

class _CopyWithImpl$Input$SearchOptions<TRes>
    implements CopyWith$Input$SearchOptions<TRes> {
  _CopyWithImpl$Input$SearchOptions(this._instance, this._then);

  final Input$SearchOptions _instance;

  final TRes Function(Input$SearchOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? q = _undefined}) => _then(
    Input$SearchOptions._({
      ..._instance._$data,
      if (q != _undefined) 'q': (q as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$SearchOptions<TRes>
    implements CopyWith$Input$SearchOptions<TRes> {
  _CopyWithStubImpl$Input$SearchOptions(this._res);

  TRes _res;

  call({String? q}) => _res;
}

class Input$SliceOptions {
  factory Input$SliceOptions({int? start, int? end, int? limit}) =>
      Input$SliceOptions._({
        if (start != null) r'start': start,
        if (end != null) r'end': end,
        if (limit != null) r'limit': limit,
      });

  Input$SliceOptions._(this._$data);

  factory Input$SliceOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('start')) {
      final l$start = data['start'];
      result$data['start'] = (l$start as int?);
    }
    if (data.containsKey('end')) {
      final l$end = data['end'];
      result$data['end'] = (l$end as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Input$SliceOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get start => (_$data['start'] as int?);

  int? get end => (_$data['end'] as int?);

  int? get limit => (_$data['limit'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('start')) {
      final l$start = start;
      result$data['start'] = l$start;
    }
    if (_$data.containsKey('end')) {
      final l$end = end;
      result$data['end'] = l$end;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Input$SliceOptions<Input$SliceOptions> get copyWith =>
      CopyWith$Input$SliceOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SliceOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$start = start;
    final lOther$start = other.start;
    if (_$data.containsKey('start') != other._$data.containsKey('start')) {
      return false;
    }
    if (l$start != lOther$start) {
      return false;
    }
    final l$end = end;
    final lOther$end = other.end;
    if (_$data.containsKey('end') != other._$data.containsKey('end')) {
      return false;
    }
    if (l$end != lOther$end) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$start = start;
    final l$end = end;
    final l$limit = limit;
    return Object.hashAll([
      _$data.containsKey('start') ? l$start : const {},
      _$data.containsKey('end') ? l$end : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Input$SliceOptions<TRes> {
  factory CopyWith$Input$SliceOptions(
    Input$SliceOptions instance,
    TRes Function(Input$SliceOptions) then,
  ) = _CopyWithImpl$Input$SliceOptions;

  factory CopyWith$Input$SliceOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$SliceOptions;

  TRes call({int? start, int? end, int? limit});
}

class _CopyWithImpl$Input$SliceOptions<TRes>
    implements CopyWith$Input$SliceOptions<TRes> {
  _CopyWithImpl$Input$SliceOptions(this._instance, this._then);

  final Input$SliceOptions _instance;

  final TRes Function(Input$SliceOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? start = _undefined,
    Object? end = _undefined,
    Object? limit = _undefined,
  }) => _then(
    Input$SliceOptions._({
      ..._instance._$data,
      if (start != _undefined) 'start': (start as int?),
      if (end != _undefined) 'end': (end as int?),
      if (limit != _undefined) 'limit': (limit as int?),
    }),
  );
}

class _CopyWithStubImpl$Input$SliceOptions<TRes>
    implements CopyWith$Input$SliceOptions<TRes> {
  _CopyWithStubImpl$Input$SliceOptions(this._res);

  TRes _res;

  call({int? start, int? end, int? limit}) => _res;
}

class Input$SortOptions {
  factory Input$SortOptions({String? field, Enum$SortOrderEnum? order}) =>
      Input$SortOptions._({
        if (field != null) r'field': field,
        if (order != null) r'order': order,
      });

  Input$SortOptions._(this._$data);

  factory Input$SortOptions.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('field')) {
      final l$field = data['field'];
      result$data['field'] = (l$field as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = l$order == null
          ? null
          : fromJson$Enum$SortOrderEnum((l$order as String));
    }
    return Input$SortOptions._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get field => (_$data['field'] as String?);

  Enum$SortOrderEnum? get order => (_$data['order'] as Enum$SortOrderEnum?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('field')) {
      final l$field = field;
      result$data['field'] = l$field;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order == null
          ? null
          : toJson$Enum$SortOrderEnum(l$order);
    }
    return result$data;
  }

  CopyWith$Input$SortOptions<Input$SortOptions> get copyWith =>
      CopyWith$Input$SortOptions(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SortOptions || runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (_$data.containsKey('field') != other._$data.containsKey('field')) {
      return false;
    }
    if (l$field != lOther$field) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$order = order;
    return Object.hashAll([
      _$data.containsKey('field') ? l$field : const {},
      _$data.containsKey('order') ? l$order : const {},
    ]);
  }
}

abstract class CopyWith$Input$SortOptions<TRes> {
  factory CopyWith$Input$SortOptions(
    Input$SortOptions instance,
    TRes Function(Input$SortOptions) then,
  ) = _CopyWithImpl$Input$SortOptions;

  factory CopyWith$Input$SortOptions.stub(TRes res) =
      _CopyWithStubImpl$Input$SortOptions;

  TRes call({String? field, Enum$SortOrderEnum? order});
}

class _CopyWithImpl$Input$SortOptions<TRes>
    implements CopyWith$Input$SortOptions<TRes> {
  _CopyWithImpl$Input$SortOptions(this._instance, this._then);

  final Input$SortOptions _instance;

  final TRes Function(Input$SortOptions) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? field = _undefined, Object? order = _undefined}) => _then(
    Input$SortOptions._({
      ..._instance._$data,
      if (field != _undefined) 'field': (field as String?),
      if (order != _undefined) 'order': (order as Enum$SortOrderEnum?),
    }),
  );
}

class _CopyWithStubImpl$Input$SortOptions<TRes>
    implements CopyWith$Input$SortOptions<TRes> {
  _CopyWithStubImpl$Input$SortOptions(this._res);

  TRes _res;

  call({String? field, Enum$SortOrderEnum? order}) => _res;
}

class Input$UpdateAlbumInput {
  factory Input$UpdateAlbumInput({String? title, String? userId}) =>
      Input$UpdateAlbumInput._({
        if (title != null) r'title': title,
        if (userId != null) r'userId': userId,
      });

  Input$UpdateAlbumInput._(this._$data);

  factory Input$UpdateAlbumInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('userId')) {
      final l$userId = data['userId'];
      result$data['userId'] = (l$userId as String?);
    }
    return Input$UpdateAlbumInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get title => (_$data['title'] as String?);

  String? get userId => (_$data['userId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('userId')) {
      final l$userId = userId;
      result$data['userId'] = l$userId;
    }
    return result$data;
  }

  CopyWith$Input$UpdateAlbumInput<Input$UpdateAlbumInput> get copyWith =>
      CopyWith$Input$UpdateAlbumInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateAlbumInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (_$data.containsKey('userId') != other._$data.containsKey('userId')) {
      return false;
    }
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$userId = userId;
    return Object.hashAll([
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('userId') ? l$userId : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateAlbumInput<TRes> {
  factory CopyWith$Input$UpdateAlbumInput(
    Input$UpdateAlbumInput instance,
    TRes Function(Input$UpdateAlbumInput) then,
  ) = _CopyWithImpl$Input$UpdateAlbumInput;

  factory CopyWith$Input$UpdateAlbumInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateAlbumInput;

  TRes call({String? title, String? userId});
}

class _CopyWithImpl$Input$UpdateAlbumInput<TRes>
    implements CopyWith$Input$UpdateAlbumInput<TRes> {
  _CopyWithImpl$Input$UpdateAlbumInput(this._instance, this._then);

  final Input$UpdateAlbumInput _instance;

  final TRes Function(Input$UpdateAlbumInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? userId = _undefined}) => _then(
    Input$UpdateAlbumInput._({
      ..._instance._$data,
      if (title != _undefined) 'title': (title as String?),
      if (userId != _undefined) 'userId': (userId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateAlbumInput<TRes>
    implements CopyWith$Input$UpdateAlbumInput<TRes> {
  _CopyWithStubImpl$Input$UpdateAlbumInput(this._res);

  TRes _res;

  call({String? title, String? userId}) => _res;
}

class Input$UpdateCommentInput {
  factory Input$UpdateCommentInput({
    String? name,
    String? email,
    String? body,
  }) => Input$UpdateCommentInput._({
    if (name != null) r'name': name,
    if (email != null) r'email': email,
    if (body != null) r'body': body,
  });

  Input$UpdateCommentInput._(this._$data);

  factory Input$UpdateCommentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    return Input$UpdateCommentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get body => (_$data['body'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    return result$data;
  }

  CopyWith$Input$UpdateCommentInput<Input$UpdateCommentInput> get copyWith =>
      CopyWith$Input$UpdateCommentInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateCommentInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$email = email;
    final l$body = body;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('body') ? l$body : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateCommentInput<TRes> {
  factory CopyWith$Input$UpdateCommentInput(
    Input$UpdateCommentInput instance,
    TRes Function(Input$UpdateCommentInput) then,
  ) = _CopyWithImpl$Input$UpdateCommentInput;

  factory CopyWith$Input$UpdateCommentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateCommentInput;

  TRes call({String? name, String? email, String? body});
}

class _CopyWithImpl$Input$UpdateCommentInput<TRes>
    implements CopyWith$Input$UpdateCommentInput<TRes> {
  _CopyWithImpl$Input$UpdateCommentInput(this._instance, this._then);

  final Input$UpdateCommentInput _instance;

  final TRes Function(Input$UpdateCommentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? email = _undefined,
    Object? body = _undefined,
  }) => _then(
    Input$UpdateCommentInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (email != _undefined) 'email': (email as String?),
      if (body != _undefined) 'body': (body as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateCommentInput<TRes>
    implements CopyWith$Input$UpdateCommentInput<TRes> {
  _CopyWithStubImpl$Input$UpdateCommentInput(this._res);

  TRes _res;

  call({String? name, String? email, String? body}) => _res;
}

class Input$UpdatePhotoInput {
  factory Input$UpdatePhotoInput({
    String? title,
    String? url,
    String? thumbnailUrl,
  }) => Input$UpdatePhotoInput._({
    if (title != null) r'title': title,
    if (url != null) r'url': url,
    if (thumbnailUrl != null) r'thumbnailUrl': thumbnailUrl,
  });

  Input$UpdatePhotoInput._(this._$data);

  factory Input$UpdatePhotoInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('url')) {
      final l$url = data['url'];
      result$data['url'] = (l$url as String?);
    }
    if (data.containsKey('thumbnailUrl')) {
      final l$thumbnailUrl = data['thumbnailUrl'];
      result$data['thumbnailUrl'] = (l$thumbnailUrl as String?);
    }
    return Input$UpdatePhotoInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get title => (_$data['title'] as String?);

  String? get url => (_$data['url'] as String?);

  String? get thumbnailUrl => (_$data['thumbnailUrl'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('url')) {
      final l$url = url;
      result$data['url'] = l$url;
    }
    if (_$data.containsKey('thumbnailUrl')) {
      final l$thumbnailUrl = thumbnailUrl;
      result$data['thumbnailUrl'] = l$thumbnailUrl;
    }
    return result$data;
  }

  CopyWith$Input$UpdatePhotoInput<Input$UpdatePhotoInput> get copyWith =>
      CopyWith$Input$UpdatePhotoInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdatePhotoInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (_$data.containsKey('url') != other._$data.containsKey('url')) {
      return false;
    }
    if (l$url != lOther$url) {
      return false;
    }
    final l$thumbnailUrl = thumbnailUrl;
    final lOther$thumbnailUrl = other.thumbnailUrl;
    if (_$data.containsKey('thumbnailUrl') !=
        other._$data.containsKey('thumbnailUrl')) {
      return false;
    }
    if (l$thumbnailUrl != lOther$thumbnailUrl) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$url = url;
    final l$thumbnailUrl = thumbnailUrl;
    return Object.hashAll([
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('url') ? l$url : const {},
      _$data.containsKey('thumbnailUrl') ? l$thumbnailUrl : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdatePhotoInput<TRes> {
  factory CopyWith$Input$UpdatePhotoInput(
    Input$UpdatePhotoInput instance,
    TRes Function(Input$UpdatePhotoInput) then,
  ) = _CopyWithImpl$Input$UpdatePhotoInput;

  factory CopyWith$Input$UpdatePhotoInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdatePhotoInput;

  TRes call({String? title, String? url, String? thumbnailUrl});
}

class _CopyWithImpl$Input$UpdatePhotoInput<TRes>
    implements CopyWith$Input$UpdatePhotoInput<TRes> {
  _CopyWithImpl$Input$UpdatePhotoInput(this._instance, this._then);

  final Input$UpdatePhotoInput _instance;

  final TRes Function(Input$UpdatePhotoInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? url = _undefined,
    Object? thumbnailUrl = _undefined,
  }) => _then(
    Input$UpdatePhotoInput._({
      ..._instance._$data,
      if (title != _undefined) 'title': (title as String?),
      if (url != _undefined) 'url': (url as String?),
      if (thumbnailUrl != _undefined) 'thumbnailUrl': (thumbnailUrl as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdatePhotoInput<TRes>
    implements CopyWith$Input$UpdatePhotoInput<TRes> {
  _CopyWithStubImpl$Input$UpdatePhotoInput(this._res);

  TRes _res;

  call({String? title, String? url, String? thumbnailUrl}) => _res;
}

class Input$UpdatePostInput {
  factory Input$UpdatePostInput({String? title, String? body}) =>
      Input$UpdatePostInput._({
        if (title != null) r'title': title,
        if (body != null) r'body': body,
      });

  Input$UpdatePostInput._(this._$data);

  factory Input$UpdatePostInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    return Input$UpdatePostInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get title => (_$data['title'] as String?);

  String? get body => (_$data['body'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    return result$data;
  }

  CopyWith$Input$UpdatePostInput<Input$UpdatePostInput> get copyWith =>
      CopyWith$Input$UpdatePostInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdatePostInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$body = body;
    return Object.hashAll([
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('body') ? l$body : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdatePostInput<TRes> {
  factory CopyWith$Input$UpdatePostInput(
    Input$UpdatePostInput instance,
    TRes Function(Input$UpdatePostInput) then,
  ) = _CopyWithImpl$Input$UpdatePostInput;

  factory CopyWith$Input$UpdatePostInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdatePostInput;

  TRes call({String? title, String? body});
}

class _CopyWithImpl$Input$UpdatePostInput<TRes>
    implements CopyWith$Input$UpdatePostInput<TRes> {
  _CopyWithImpl$Input$UpdatePostInput(this._instance, this._then);

  final Input$UpdatePostInput _instance;

  final TRes Function(Input$UpdatePostInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? body = _undefined}) => _then(
    Input$UpdatePostInput._({
      ..._instance._$data,
      if (title != _undefined) 'title': (title as String?),
      if (body != _undefined) 'body': (body as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdatePostInput<TRes>
    implements CopyWith$Input$UpdatePostInput<TRes> {
  _CopyWithStubImpl$Input$UpdatePostInput(this._res);

  TRes _res;

  call({String? title, String? body}) => _res;
}

class Input$UpdateTodoInput {
  factory Input$UpdateTodoInput({String? title, bool? completed}) =>
      Input$UpdateTodoInput._({
        if (title != null) r'title': title,
        if (completed != null) r'completed': completed,
      });

  Input$UpdateTodoInput._(this._$data);

  factory Input$UpdateTodoInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('completed')) {
      final l$completed = data['completed'];
      result$data['completed'] = (l$completed as bool?);
    }
    return Input$UpdateTodoInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get title => (_$data['title'] as String?);

  bool? get completed => (_$data['completed'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('completed')) {
      final l$completed = completed;
      result$data['completed'] = l$completed;
    }
    return result$data;
  }

  CopyWith$Input$UpdateTodoInput<Input$UpdateTodoInput> get copyWith =>
      CopyWith$Input$UpdateTodoInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateTodoInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$completed = completed;
    final lOther$completed = other.completed;
    if (_$data.containsKey('completed') !=
        other._$data.containsKey('completed')) {
      return false;
    }
    if (l$completed != lOther$completed) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$completed = completed;
    return Object.hashAll([
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('completed') ? l$completed : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateTodoInput<TRes> {
  factory CopyWith$Input$UpdateTodoInput(
    Input$UpdateTodoInput instance,
    TRes Function(Input$UpdateTodoInput) then,
  ) = _CopyWithImpl$Input$UpdateTodoInput;

  factory CopyWith$Input$UpdateTodoInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateTodoInput;

  TRes call({String? title, bool? completed});
}

class _CopyWithImpl$Input$UpdateTodoInput<TRes>
    implements CopyWith$Input$UpdateTodoInput<TRes> {
  _CopyWithImpl$Input$UpdateTodoInput(this._instance, this._then);

  final Input$UpdateTodoInput _instance;

  final TRes Function(Input$UpdateTodoInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? title = _undefined, Object? completed = _undefined}) =>
      _then(
        Input$UpdateTodoInput._({
          ..._instance._$data,
          if (title != _undefined) 'title': (title as String?),
          if (completed != _undefined) 'completed': (completed as bool?),
        }),
      );
}

class _CopyWithStubImpl$Input$UpdateTodoInput<TRes>
    implements CopyWith$Input$UpdateTodoInput<TRes> {
  _CopyWithStubImpl$Input$UpdateTodoInput(this._res);

  TRes _res;

  call({String? title, bool? completed}) => _res;
}

class Input$UpdateUserInput {
  factory Input$UpdateUserInput({
    String? name,
    String? username,
    String? email,
    Input$AddressInput? address,
    String? phone,
    String? website,
    Input$CompanyInput? company,
  }) => Input$UpdateUserInput._({
    if (name != null) r'name': name,
    if (username != null) r'username': username,
    if (email != null) r'email': email,
    if (address != null) r'address': address,
    if (phone != null) r'phone': phone,
    if (website != null) r'website': website,
    if (company != null) r'company': company,
  });

  Input$UpdateUserInput._(this._$data);

  factory Input$UpdateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('username')) {
      final l$username = data['username'];
      result$data['username'] = (l$username as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('address')) {
      final l$address = data['address'];
      result$data['address'] = l$address == null
          ? null
          : Input$AddressInput.fromJson((l$address as Map<String, dynamic>));
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    if (data.containsKey('website')) {
      final l$website = data['website'];
      result$data['website'] = (l$website as String?);
    }
    if (data.containsKey('company')) {
      final l$company = data['company'];
      result$data['company'] = l$company == null
          ? null
          : Input$CompanyInput.fromJson((l$company as Map<String, dynamic>));
    }
    return Input$UpdateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get username => (_$data['username'] as String?);

  String? get email => (_$data['email'] as String?);

  Input$AddressInput? get address => (_$data['address'] as Input$AddressInput?);

  String? get phone => (_$data['phone'] as String?);

  String? get website => (_$data['website'] as String?);

  Input$CompanyInput? get company => (_$data['company'] as Input$CompanyInput?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('username')) {
      final l$username = username;
      result$data['username'] = l$username;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('address')) {
      final l$address = address;
      result$data['address'] = l$address?.toJson();
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    if (_$data.containsKey('website')) {
      final l$website = website;
      result$data['website'] = l$website;
    }
    if (_$data.containsKey('company')) {
      final l$company = company;
      result$data['company'] = l$company?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$UpdateUserInput<Input$UpdateUserInput> get copyWith =>
      CopyWith$Input$UpdateUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (_$data.containsKey('username') !=
        other._$data.containsKey('username')) {
      return false;
    }
    if (l$username != lOther$username) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (_$data.containsKey('address') != other._$data.containsKey('address')) {
      return false;
    }
    if (l$address != lOther$address) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$website = website;
    final lOther$website = other.website;
    if (_$data.containsKey('website') != other._$data.containsKey('website')) {
      return false;
    }
    if (l$website != lOther$website) {
      return false;
    }
    final l$company = company;
    final lOther$company = other.company;
    if (_$data.containsKey('company') != other._$data.containsKey('company')) {
      return false;
    }
    if (l$company != lOther$company) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$username = username;
    final l$email = email;
    final l$address = address;
    final l$phone = phone;
    final l$website = website;
    final l$company = company;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('username') ? l$username : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('address') ? l$address : const {},
      _$data.containsKey('phone') ? l$phone : const {},
      _$data.containsKey('website') ? l$website : const {},
      _$data.containsKey('company') ? l$company : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateUserInput<TRes> {
  factory CopyWith$Input$UpdateUserInput(
    Input$UpdateUserInput instance,
    TRes Function(Input$UpdateUserInput) then,
  ) = _CopyWithImpl$Input$UpdateUserInput;

  factory CopyWith$Input$UpdateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateUserInput;

  TRes call({
    String? name,
    String? username,
    String? email,
    Input$AddressInput? address,
    String? phone,
    String? website,
    Input$CompanyInput? company,
  });
  CopyWith$Input$AddressInput<TRes> get address;
  CopyWith$Input$CompanyInput<TRes> get company;
}

class _CopyWithImpl$Input$UpdateUserInput<TRes>
    implements CopyWith$Input$UpdateUserInput<TRes> {
  _CopyWithImpl$Input$UpdateUserInput(this._instance, this._then);

  final Input$UpdateUserInput _instance;

  final TRes Function(Input$UpdateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? username = _undefined,
    Object? email = _undefined,
    Object? address = _undefined,
    Object? phone = _undefined,
    Object? website = _undefined,
    Object? company = _undefined,
  }) => _then(
    Input$UpdateUserInput._({
      ..._instance._$data,
      if (name != _undefined) 'name': (name as String?),
      if (username != _undefined) 'username': (username as String?),
      if (email != _undefined) 'email': (email as String?),
      if (address != _undefined) 'address': (address as Input$AddressInput?),
      if (phone != _undefined) 'phone': (phone as String?),
      if (website != _undefined) 'website': (website as String?),
      if (company != _undefined) 'company': (company as Input$CompanyInput?),
    }),
  );

  CopyWith$Input$AddressInput<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Input$AddressInput.stub(_then(_instance))
        : CopyWith$Input$AddressInput(local$address, (e) => call(address: e));
  }

  CopyWith$Input$CompanyInput<TRes> get company {
    final local$company = _instance.company;
    return local$company == null
        ? CopyWith$Input$CompanyInput.stub(_then(_instance))
        : CopyWith$Input$CompanyInput(local$company, (e) => call(company: e));
  }
}

class _CopyWithStubImpl$Input$UpdateUserInput<TRes>
    implements CopyWith$Input$UpdateUserInput<TRes> {
  _CopyWithStubImpl$Input$UpdateUserInput(this._res);

  TRes _res;

  call({
    String? name,
    String? username,
    String? email,
    Input$AddressInput? address,
    String? phone,
    String? website,
    Input$CompanyInput? company,
  }) => _res;

  CopyWith$Input$AddressInput<TRes> get address =>
      CopyWith$Input$AddressInput.stub(_res);

  CopyWith$Input$CompanyInput<TRes> get company =>
      CopyWith$Input$CompanyInput.stub(_res);
}

enum Enum$OperatorKindEnum {
  GTE,
  LTE,
  NE,
  LIKE,
  $unknown;

  factory Enum$OperatorKindEnum.fromJson(String value) =>
      fromJson$Enum$OperatorKindEnum(value);

  String toJson() => toJson$Enum$OperatorKindEnum(this);
}

String toJson$Enum$OperatorKindEnum(Enum$OperatorKindEnum e) {
  switch (e) {
    case Enum$OperatorKindEnum.GTE:
      return r'GTE';
    case Enum$OperatorKindEnum.LTE:
      return r'LTE';
    case Enum$OperatorKindEnum.NE:
      return r'NE';
    case Enum$OperatorKindEnum.LIKE:
      return r'LIKE';
    case Enum$OperatorKindEnum.$unknown:
      return r'$unknown';
  }
}

Enum$OperatorKindEnum fromJson$Enum$OperatorKindEnum(String value) {
  switch (value) {
    case r'GTE':
      return Enum$OperatorKindEnum.GTE;
    case r'LTE':
      return Enum$OperatorKindEnum.LTE;
    case r'NE':
      return Enum$OperatorKindEnum.NE;
    case r'LIKE':
      return Enum$OperatorKindEnum.LIKE;
    default:
      return Enum$OperatorKindEnum.$unknown;
  }
}

enum Enum$SortOrderEnum {
  ASC,
  DESC,
  $unknown;

  factory Enum$SortOrderEnum.fromJson(String value) =>
      fromJson$Enum$SortOrderEnum(value);

  String toJson() => toJson$Enum$SortOrderEnum(this);
}

String toJson$Enum$SortOrderEnum(Enum$SortOrderEnum e) {
  switch (e) {
    case Enum$SortOrderEnum.ASC:
      return r'ASC';
    case Enum$SortOrderEnum.DESC:
      return r'DESC';
    case Enum$SortOrderEnum.$unknown:
      return r'$unknown';
  }
}

Enum$SortOrderEnum fromJson$Enum$SortOrderEnum(String value) {
  switch (value) {
    case r'ASC':
      return Enum$SortOrderEnum.ASC;
    case r'DESC':
      return Enum$SortOrderEnum.DESC;
    default:
      return Enum$SortOrderEnum.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
