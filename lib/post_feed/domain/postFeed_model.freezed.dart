// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postFeed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PreferenceModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<DataOfPostModel> get postList => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "pages")
  int? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<DataOfPostModel> postList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? postList = null,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      postList: null == postList
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<DataOfPostModel>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PreferenceModelImplCopyWith(_$PreferenceModelImpl value,
          $Res Function(_$PreferenceModelImpl) then) =
      __$$PreferenceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<DataOfPostModel> postList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$PreferenceModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PreferenceModelImpl>
    implements _$$PreferenceModelImplCopyWith<$Res> {
  __$$PreferenceModelImplCopyWithImpl(
      _$PreferenceModelImpl _value, $Res Function(_$PreferenceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? postList = null,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$PreferenceModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      postList: null == postList
          ? _value._postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<DataOfPostModel>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceModelImpl implements _PreferenceModel {
  const _$PreferenceModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") required final List<DataOfPostModel> postList,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit})
      : _postList = postList;

  factory _$PreferenceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<DataOfPostModel> _postList;
  @override
  @JsonKey(name: "data")
  List<DataOfPostModel> get postList {
    if (_postList is EqualUnmodifiableListView) return _postList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postList);
  }

  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "page")
  final int? page;
  @override
  @JsonKey(name: "pages")
  final int? pages;
  @override
  @JsonKey(name: "limit")
  final int? limit;

  @override
  String toString() {
    return 'PostModel(status: $status, type: $type, message: $message, postList: $postList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._postList, _postList) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      type,
      message,
      const DeepCollectionEquality().hash(_postList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceModelImplCopyWith<_$PreferenceModelImpl> get copyWith =>
      __$$PreferenceModelImplCopyWithImpl<_$PreferenceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceModelImplToJson(
      this,
    );
  }
}

abstract class _PreferenceModel implements PostModel {
  const factory _PreferenceModel(
      {@JsonKey(name: "status") final int? status,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") required final List<DataOfPostModel> postList,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "pages") final int? pages,
      @JsonKey(name: "limit") final int? limit}) = _$PreferenceModelImpl;

  factory _PreferenceModel.fromJson(Map<String, dynamic> json) =
      _$PreferenceModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "data")
  List<DataOfPostModel> get postList;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(name: "pages")
  int? get pages;
  @override
  @JsonKey(name: "limit")
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceModelImplCopyWith<_$PreferenceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfPostModel _$DataOfPostModelFromJson(Map<String, dynamic> json) {
  return _DataOfPostModel.fromJson(json);
}

/// @nodoc
mixin _$DataOfPostModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "file")
  String get file => throw _privateConstructorUsedError;
  @JsonKey(name: "mimetype")
  String get mimetype => throw _privateConstructorUsedError;
  @JsonKey(name: "how_was_it")
  String get howWasIt => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "isOwn")
  bool get isOwn => throw _privateConstructorUsedError;
  @JsonKey(name: "isSave")
  bool get isSave => throw _privateConstructorUsedError;
  @JsonKey(name: "like_count")
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: "isMyLike")
  bool get isMyLike => throw _privateConstructorUsedError;
  @JsonKey(name: "comment_count")
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: "userInfo")
  UserInfo get userInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurantInfo")
  RestaurantInfo get restaurantInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataOfPostModelCopyWith<DataOfPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfPostModelCopyWith<$Res> {
  factory $DataOfPostModelCopyWith(
          DataOfPostModel value, $Res Function(DataOfPostModel) then) =
      _$DataOfPostModelCopyWithImpl<$Res, DataOfPostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "file") String file,
      @JsonKey(name: "mimetype") String mimetype,
      @JsonKey(name: "how_was_it") String howWasIt,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "isOwn") bool isOwn,
      @JsonKey(name: "isSave") bool isSave,
      @JsonKey(name: "like_count") int likeCount,
      @JsonKey(name: "isMyLike") bool isMyLike,
      @JsonKey(name: "comment_count") int commentCount,
      @JsonKey(name: "userInfo") UserInfo userInfo,
      @JsonKey(name: "restaurantInfo") RestaurantInfo restaurantInfo});

  $UserInfoCopyWith<$Res> get userInfo;
  $RestaurantInfoCopyWith<$Res> get restaurantInfo;
}

/// @nodoc
class _$DataOfPostModelCopyWithImpl<$Res, $Val extends DataOfPostModel>
    implements $DataOfPostModelCopyWith<$Res> {
  _$DataOfPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? file = null,
    Object? mimetype = null,
    Object? howWasIt = null,
    Object? status = null,
    Object? createdAt = null,
    Object? isOwn = null,
    Object? isSave = null,
    Object? likeCount = null,
    Object? isMyLike = null,
    Object? commentCount = null,
    Object? userInfo = null,
    Object? restaurantInfo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      mimetype: null == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String,
      howWasIt: null == howWasIt
          ? _value.howWasIt
          : howWasIt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOwn: null == isOwn
          ? _value.isOwn
          : isOwn // ignore: cast_nullable_to_non_nullable
              as bool,
      isSave: null == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMyLike: null == isMyLike
          ? _value.isMyLike
          : isMyLike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      restaurantInfo: null == restaurantInfo
          ? _value.restaurantInfo
          : restaurantInfo // ignore: cast_nullable_to_non_nullable
              as RestaurantInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RestaurantInfoCopyWith<$Res> get restaurantInfo {
    return $RestaurantInfoCopyWith<$Res>(_value.restaurantInfo, (value) {
      return _then(_value.copyWith(restaurantInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataOfPostModelImplCopyWith<$Res>
    implements $DataOfPostModelCopyWith<$Res> {
  factory _$$DataOfPostModelImplCopyWith(_$DataOfPostModelImpl value,
          $Res Function(_$DataOfPostModelImpl) then) =
      __$$DataOfPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "file") String file,
      @JsonKey(name: "mimetype") String mimetype,
      @JsonKey(name: "how_was_it") String howWasIt,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "isOwn") bool isOwn,
      @JsonKey(name: "isSave") bool isSave,
      @JsonKey(name: "like_count") int likeCount,
      @JsonKey(name: "isMyLike") bool isMyLike,
      @JsonKey(name: "comment_count") int commentCount,
      @JsonKey(name: "userInfo") UserInfo userInfo,
      @JsonKey(name: "restaurantInfo") RestaurantInfo restaurantInfo});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
  @override
  $RestaurantInfoCopyWith<$Res> get restaurantInfo;
}

/// @nodoc
class __$$DataOfPostModelImplCopyWithImpl<$Res>
    extends _$DataOfPostModelCopyWithImpl<$Res, _$DataOfPostModelImpl>
    implements _$$DataOfPostModelImplCopyWith<$Res> {
  __$$DataOfPostModelImplCopyWithImpl(
      _$DataOfPostModelImpl _value, $Res Function(_$DataOfPostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? file = null,
    Object? mimetype = null,
    Object? howWasIt = null,
    Object? status = null,
    Object? createdAt = null,
    Object? isOwn = null,
    Object? isSave = null,
    Object? likeCount = null,
    Object? isMyLike = null,
    Object? commentCount = null,
    Object? userInfo = null,
    Object? restaurantInfo = null,
  }) {
    return _then(_$DataOfPostModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      mimetype: null == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String,
      howWasIt: null == howWasIt
          ? _value.howWasIt
          : howWasIt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isOwn: null == isOwn
          ? _value.isOwn
          : isOwn // ignore: cast_nullable_to_non_nullable
              as bool,
      isSave: null == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isMyLike: null == isMyLike
          ? _value.isMyLike
          : isMyLike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      restaurantInfo: null == restaurantInfo
          ? _value.restaurantInfo
          : restaurantInfo // ignore: cast_nullable_to_non_nullable
              as RestaurantInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataOfPostModelImpl implements _DataOfPostModel {
  const _$DataOfPostModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "file") required this.file,
      @JsonKey(name: "mimetype") required this.mimetype,
      @JsonKey(name: "how_was_it") required this.howWasIt,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "isOwn") required this.isOwn,
      @JsonKey(name: "isSave") required this.isSave,
      @JsonKey(name: "like_count") required this.likeCount,
      @JsonKey(name: "isMyLike") required this.isMyLike,
      @JsonKey(name: "comment_count") required this.commentCount,
      @JsonKey(name: "userInfo") required this.userInfo,
      @JsonKey(name: "restaurantInfo") required this.restaurantInfo});

  factory _$DataOfPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfPostModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "file")
  final String file;
  @override
  @JsonKey(name: "mimetype")
  final String mimetype;
  @override
  @JsonKey(name: "how_was_it")
  final String howWasIt;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "isOwn")
  final bool isOwn;
  @override
  @JsonKey(name: "isSave")
  final bool isSave;
  @override
  @JsonKey(name: "like_count")
  final int likeCount;
  @override
  @JsonKey(name: "isMyLike")
  final bool isMyLike;
  @override
  @JsonKey(name: "comment_count")
  final int commentCount;
  @override
  @JsonKey(name: "userInfo")
  final UserInfo userInfo;
  @override
  @JsonKey(name: "restaurantInfo")
  final RestaurantInfo restaurantInfo;

  @override
  String toString() {
    return 'DataOfPostModel(id: $id, title: $title, description: $description, file: $file, mimetype: $mimetype, howWasIt: $howWasIt, status: $status, createdAt: $createdAt, isOwn: $isOwn, isSave: $isSave, likeCount: $likeCount, isMyLike: $isMyLike, commentCount: $commentCount, userInfo: $userInfo, restaurantInfo: $restaurantInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfPostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.mimetype, mimetype) ||
                other.mimetype == mimetype) &&
            (identical(other.howWasIt, howWasIt) ||
                other.howWasIt == howWasIt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isOwn, isOwn) || other.isOwn == isOwn) &&
            (identical(other.isSave, isSave) || other.isSave == isSave) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isMyLike, isMyLike) ||
                other.isMyLike == isMyLike) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.restaurantInfo, restaurantInfo) ||
                other.restaurantInfo == restaurantInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      file,
      mimetype,
      howWasIt,
      status,
      createdAt,
      isOwn,
      isSave,
      likeCount,
      isMyLike,
      commentCount,
      userInfo,
      restaurantInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfPostModelImplCopyWith<_$DataOfPostModelImpl> get copyWith =>
      __$$DataOfPostModelImplCopyWithImpl<_$DataOfPostModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfPostModelImplToJson(
      this,
    );
  }
}

abstract class _DataOfPostModel implements DataOfPostModel {
  const factory _DataOfPostModel(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "title") required final String title,
      @JsonKey(name: "description") required final String description,
      @JsonKey(name: "file") required final String file,
      @JsonKey(name: "mimetype") required final String mimetype,
      @JsonKey(name: "how_was_it") required final String howWasIt,
      @JsonKey(name: "status") required final String status,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "isOwn") required final bool isOwn,
      @JsonKey(name: "isSave") required final bool isSave,
      @JsonKey(name: "like_count") required final int likeCount,
      @JsonKey(name: "isMyLike") required final bool isMyLike,
      @JsonKey(name: "comment_count") required final int commentCount,
      @JsonKey(name: "userInfo") required final UserInfo userInfo,
      @JsonKey(name: "restaurantInfo")
      required final RestaurantInfo restaurantInfo}) = _$DataOfPostModelImpl;

  factory _DataOfPostModel.fromJson(Map<String, dynamic> json) =
      _$DataOfPostModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "file")
  String get file;
  @override
  @JsonKey(name: "mimetype")
  String get mimetype;
  @override
  @JsonKey(name: "how_was_it")
  String get howWasIt;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "isOwn")
  bool get isOwn;
  @override
  @JsonKey(name: "isSave")
  bool get isSave;
  @override
  @JsonKey(name: "like_count")
  int get likeCount;
  @override
  @JsonKey(name: "isMyLike")
  bool get isMyLike;
  @override
  @JsonKey(name: "comment_count")
  int get commentCount;
  @override
  @JsonKey(name: "userInfo")
  UserInfo get userInfo;
  @override
  @JsonKey(name: "restaurantInfo")
  RestaurantInfo get restaurantInfo;
  @override
  @JsonKey(ignore: true)
  _$$DataOfPostModelImplCopyWith<_$DataOfPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String profileImage});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String profileImage});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? profileImage = null,
  }) {
    return _then(_$UserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "fullName") required this.fullName,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "profile_image") required this.profileImage});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "fullName")
  final String fullName;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "profile_image")
  final String profileImage;

  @override
  String toString() {
    return 'UserInfo(id: $id, fullName: $fullName, email: $email, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, email, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "fullName") required final String fullName,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "profile_image") required final String profileImage}) =
      _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "fullName")
  String get fullName;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "profile_image")
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantInfo _$RestaurantInfoFromJson(Map<String, dynamic> json) {
  return _RestaurantInfo.fromJson(json);
}

/// @nodoc
mixin _$RestaurantInfo {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: "zipcode")
  String get zipcode => throw _privateConstructorUsedError;
  @JsonKey(name: "user_ratings_total")
  String get userRatingsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  String get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantInfoCopyWith<RestaurantInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantInfoCopyWith<$Res> {
  factory $RestaurantInfoCopyWith(
          RestaurantInfo value, $Res Function(RestaurantInfo) then) =
      _$RestaurantInfoCopyWithImpl<$Res, RestaurantInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "state") String state,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "country") String country,
      @JsonKey(name: "zipcode") String zipcode,
      @JsonKey(name: "user_ratings_total") String userRatingsTotal,
      @JsonKey(name: "rating") String rating});
}

/// @nodoc
class _$RestaurantInfoCopyWithImpl<$Res, $Val extends RestaurantInfo>
    implements $RestaurantInfoCopyWith<$Res> {
  _$RestaurantInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? state = null,
    Object? city = null,
    Object? country = null,
    Object? zipcode = null,
    Object? userRatingsTotal = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      userRatingsTotal: null == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantInfoImplCopyWith<$Res>
    implements $RestaurantInfoCopyWith<$Res> {
  factory _$$RestaurantInfoImplCopyWith(_$RestaurantInfoImpl value,
          $Res Function(_$RestaurantInfoImpl) then) =
      __$$RestaurantInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "state") String state,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "country") String country,
      @JsonKey(name: "zipcode") String zipcode,
      @JsonKey(name: "user_ratings_total") String userRatingsTotal,
      @JsonKey(name: "rating") String rating});
}

/// @nodoc
class __$$RestaurantInfoImplCopyWithImpl<$Res>
    extends _$RestaurantInfoCopyWithImpl<$Res, _$RestaurantInfoImpl>
    implements _$$RestaurantInfoImplCopyWith<$Res> {
  __$$RestaurantInfoImplCopyWithImpl(
      _$RestaurantInfoImpl _value, $Res Function(_$RestaurantInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? state = null,
    Object? city = null,
    Object? country = null,
    Object? zipcode = null,
    Object? userRatingsTotal = null,
    Object? rating = null,
  }) {
    return _then(_$RestaurantInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      userRatingsTotal: null == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantInfoImpl implements _RestaurantInfo {
  const _$RestaurantInfoImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "address") required this.address,
      @JsonKey(name: "state") required this.state,
      @JsonKey(name: "city") required this.city,
      @JsonKey(name: "country") required this.country,
      @JsonKey(name: "zipcode") required this.zipcode,
      @JsonKey(name: "user_ratings_total") required this.userRatingsTotal,
      @JsonKey(name: "rating") required this.rating});

  factory _$RestaurantInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "address")
  final String address;
  @override
  @JsonKey(name: "state")
  final String state;
  @override
  @JsonKey(name: "city")
  final String city;
  @override
  @JsonKey(name: "country")
  final String country;
  @override
  @JsonKey(name: "zipcode")
  final String zipcode;
  @override
  @JsonKey(name: "user_ratings_total")
  final String userRatingsTotal;
  @override
  @JsonKey(name: "rating")
  final String rating;

  @override
  String toString() {
    return 'RestaurantInfo(id: $id, name: $name, address: $address, state: $state, city: $city, country: $country, zipcode: $zipcode, userRatingsTotal: $userRatingsTotal, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, state, city,
      country, zipcode, userRatingsTotal, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantInfoImplCopyWith<_$RestaurantInfoImpl> get copyWith =>
      __$$RestaurantInfoImplCopyWithImpl<_$RestaurantInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantInfoImplToJson(
      this,
    );
  }
}

abstract class _RestaurantInfo implements RestaurantInfo {
  const factory _RestaurantInfo(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "address") required final String address,
          @JsonKey(name: "state") required final String state,
          @JsonKey(name: "city") required final String city,
          @JsonKey(name: "country") required final String country,
          @JsonKey(name: "zipcode") required final String zipcode,
          @JsonKey(name: "user_ratings_total")
          required final String userRatingsTotal,
          @JsonKey(name: "rating") required final String rating}) =
      _$RestaurantInfoImpl;

  factory _RestaurantInfo.fromJson(Map<String, dynamic> json) =
      _$RestaurantInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "address")
  String get address;
  @override
  @JsonKey(name: "state")
  String get state;
  @override
  @JsonKey(name: "city")
  String get city;
  @override
  @JsonKey(name: "country")
  String get country;
  @override
  @JsonKey(name: "zipcode")
  String get zipcode;
  @override
  @JsonKey(name: "user_ratings_total")
  String get userRatingsTotal;
  @override
  @JsonKey(name: "rating")
  String get rating;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantInfoImplCopyWith<_$RestaurantInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
