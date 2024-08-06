// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostsModel _$PostsModelFromJson(Map<String, dynamic> json) {
  return _PostsModel.fromJson(json);
}

/// @nodoc
mixin _$PostsModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<Posts>? get postsList => throw _privateConstructorUsedError;
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
  $PostsModelCopyWith<PostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsModelCopyWith<$Res> {
  factory $PostsModelCopyWith(
          PostsModel value, $Res Function(PostsModel) then) =
      _$PostsModelCopyWithImpl<$Res, PostsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<Posts>? postsList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$PostsModelCopyWithImpl<$Res, $Val extends PostsModel>
    implements $PostsModelCopyWith<$Res> {
  _$PostsModelCopyWithImpl(this._value, this._then);

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
    Object? postsList = freezed,
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
      postsList: freezed == postsList
          ? _value.postsList
          : postsList // ignore: cast_nullable_to_non_nullable
              as List<Posts>?,
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
abstract class _$$PostsModelImplCopyWith<$Res>
    implements $PostsModelCopyWith<$Res> {
  factory _$$PostsModelImplCopyWith(
          _$PostsModelImpl value, $Res Function(_$PostsModelImpl) then) =
      __$$PostsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<Posts>? postsList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$PostsModelImplCopyWithImpl<$Res>
    extends _$PostsModelCopyWithImpl<$Res, _$PostsModelImpl>
    implements _$$PostsModelImplCopyWith<$Res> {
  __$$PostsModelImplCopyWithImpl(
      _$PostsModelImpl _value, $Res Function(_$PostsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? postsList = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$PostsModelImpl(
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
      postsList: freezed == postsList
          ? _value._postsList
          : postsList // ignore: cast_nullable_to_non_nullable
              as List<Posts>?,
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
class _$PostsModelImpl implements _PostsModel {
  const _$PostsModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<Posts>? postsList,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit})
      : _postsList = postsList;

  factory _$PostsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<Posts>? _postsList;
  @override
  @JsonKey(name: "data")
  List<Posts>? get postsList {
    final value = _postsList;
    if (value == null) return null;
    if (_postsList is EqualUnmodifiableListView) return _postsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
    return 'PostsModel(status: $status, type: $type, message: $message, postsList: $postsList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._postsList, _postsList) &&
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
      const DeepCollectionEquality().hash(_postsList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsModelImplCopyWith<_$PostsModelImpl> get copyWith =>
      __$$PostsModelImplCopyWithImpl<_$PostsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsModelImplToJson(
      this,
    );
  }
}

abstract class _PostsModel implements PostsModel {
  const factory _PostsModel(
      {@JsonKey(name: "status") final int? status,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final List<Posts>? postsList,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "pages") final int? pages,
      @JsonKey(name: "limit") final int? limit}) = _$PostsModelImpl;

  factory _PostsModel.fromJson(Map<String, dynamic> json) =
      _$PostsModelImpl.fromJson;

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
  List<Posts>? get postsList;
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
  _$$PostsModelImplCopyWith<_$PostsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Posts _$PostsFromJson(Map<String, dynamic> json) {
  return _Posts.fromJson(json);
}

/// @nodoc
mixin _$Posts {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "file")
  String? get file => throw _privateConstructorUsedError;
  @JsonKey(name: "mimetype")
  String? get mimetype => throw _privateConstructorUsedError;
  @JsonKey(name: "how_was_it")
  String? get howWasIt => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "geo_distance")
  double? get geoDistance => throw _privateConstructorUsedError;
  @JsonKey(name: "geo_loc")
  GeoLoc? get geoLoc => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "isOwn")
  bool? get isOwn => throw _privateConstructorUsedError;
  @JsonKey(name: "isNear")
  bool? get isNear => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollowing")
  bool? get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollowingRequest")
  bool? get isFollowingRequest => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollower")
  bool? get isFollower => throw _privateConstructorUsedError;
  @JsonKey(name: "isSave")
  bool? get isSave => throw _privateConstructorUsedError;
  @JsonKey(name: "like_count")
  int? get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: "isMyLike")
  bool? get isMyLike => throw _privateConstructorUsedError;
  @JsonKey(name: "isMyDisLike")
  bool? get isMyDisLike => throw _privateConstructorUsedError;
  @JsonKey(name: "comment_count")
  int? get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: "userInfo")
  UserInfo? get userInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "preferenceInfo")
  PreferenceInfo? get preferenceInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurantInfo")
  RestaurantInfo? get restaurantInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsCopyWith<Posts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsCopyWith<$Res> {
  factory $PostsCopyWith(Posts value, $Res Function(Posts) then) =
      _$PostsCopyWithImpl<$Res, Posts>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "file") String? file,
      @JsonKey(name: "mimetype") String? mimetype,
      @JsonKey(name: "how_was_it") String? howWasIt,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "geo_distance") double? geoDistance,
      @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "isOwn") bool? isOwn,
      @JsonKey(name: "isNear") bool? isNear,
      @JsonKey(name: "isFollowing") bool? isFollowing,
      @JsonKey(name: "isFollowingRequest") bool? isFollowingRequest,
      @JsonKey(name: "isFollower") bool? isFollower,
      @JsonKey(name: "isSave") bool? isSave,
      @JsonKey(name: "like_count") int? likeCount,
      @JsonKey(name: "isMyLike") bool? isMyLike,
      @JsonKey(name: "isMyDisLike") bool? isMyDisLike,
      @JsonKey(name: "comment_count") int? commentCount,
      @JsonKey(name: "userInfo") UserInfo? userInfo,
      @JsonKey(name: "preferenceInfo") PreferenceInfo? preferenceInfo,
      @JsonKey(name: "restaurantInfo") RestaurantInfo? restaurantInfo});

  $GeoLocCopyWith<$Res>? get geoLoc;
  $UserInfoCopyWith<$Res>? get userInfo;
  $PreferenceInfoCopyWith<$Res>? get preferenceInfo;
  $RestaurantInfoCopyWith<$Res>? get restaurantInfo;
}

/// @nodoc
class _$PostsCopyWithImpl<$Res, $Val extends Posts>
    implements $PostsCopyWith<$Res> {
  _$PostsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? file = freezed,
    Object? mimetype = freezed,
    Object? howWasIt = freezed,
    Object? location = freezed,
    Object? geoDistance = freezed,
    Object? geoLoc = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? isOwn = freezed,
    Object? isNear = freezed,
    Object? isFollowing = freezed,
    Object? isFollowingRequest = freezed,
    Object? isFollower = freezed,
    Object? isSave = freezed,
    Object? likeCount = freezed,
    Object? isMyLike = freezed,
    Object? isMyDisLike = freezed,
    Object? commentCount = freezed,
    Object? userInfo = freezed,
    Object? preferenceInfo = freezed,
    Object? restaurantInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      mimetype: freezed == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String?,
      howWasIt: freezed == howWasIt
          ? _value.howWasIt
          : howWasIt // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      geoDistance: freezed == geoDistance
          ? _value.geoDistance
          : geoDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      geoLoc: freezed == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isOwn: freezed == isOwn
          ? _value.isOwn
          : isOwn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNear: freezed == isNear
          ? _value.isNear
          : isNear // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowingRequest: freezed == isFollowingRequest
          ? _value.isFollowingRequest
          : isFollowingRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollower: freezed == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSave: freezed == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isMyLike: freezed == isMyLike
          ? _value.isMyLike
          : isMyLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMyDisLike: freezed == isMyDisLike
          ? _value.isMyDisLike
          : isMyDisLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      preferenceInfo: freezed == preferenceInfo
          ? _value.preferenceInfo
          : preferenceInfo // ignore: cast_nullable_to_non_nullable
              as PreferenceInfo?,
      restaurantInfo: freezed == restaurantInfo
          ? _value.restaurantInfo
          : restaurantInfo // ignore: cast_nullable_to_non_nullable
              as RestaurantInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoLocCopyWith<$Res>? get geoLoc {
    if (_value.geoLoc == null) {
      return null;
    }

    return $GeoLocCopyWith<$Res>(_value.geoLoc!, (value) {
      return _then(_value.copyWith(geoLoc: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PreferenceInfoCopyWith<$Res>? get preferenceInfo {
    if (_value.preferenceInfo == null) {
      return null;
    }

    return $PreferenceInfoCopyWith<$Res>(_value.preferenceInfo!, (value) {
      return _then(_value.copyWith(preferenceInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RestaurantInfoCopyWith<$Res>? get restaurantInfo {
    if (_value.restaurantInfo == null) {
      return null;
    }

    return $RestaurantInfoCopyWith<$Res>(_value.restaurantInfo!, (value) {
      return _then(_value.copyWith(restaurantInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostsImplCopyWith<$Res> implements $PostsCopyWith<$Res> {
  factory _$$PostsImplCopyWith(
          _$PostsImpl value, $Res Function(_$PostsImpl) then) =
      __$$PostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "file") String? file,
      @JsonKey(name: "mimetype") String? mimetype,
      @JsonKey(name: "how_was_it") String? howWasIt,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "geo_distance") double? geoDistance,
      @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "createdAt") String? createdAt,
      @JsonKey(name: "isOwn") bool? isOwn,
      @JsonKey(name: "isNear") bool? isNear,
      @JsonKey(name: "isFollowing") bool? isFollowing,
      @JsonKey(name: "isFollowingRequest") bool? isFollowingRequest,
      @JsonKey(name: "isFollower") bool? isFollower,
      @JsonKey(name: "isSave") bool? isSave,
      @JsonKey(name: "like_count") int? likeCount,
      @JsonKey(name: "isMyLike") bool? isMyLike,
      @JsonKey(name: "isMyDisLike") bool? isMyDisLike,
      @JsonKey(name: "comment_count") int? commentCount,
      @JsonKey(name: "userInfo") UserInfo? userInfo,
      @JsonKey(name: "preferenceInfo") PreferenceInfo? preferenceInfo,
      @JsonKey(name: "restaurantInfo") RestaurantInfo? restaurantInfo});

  @override
  $GeoLocCopyWith<$Res>? get geoLoc;
  @override
  $UserInfoCopyWith<$Res>? get userInfo;
  @override
  $PreferenceInfoCopyWith<$Res>? get preferenceInfo;
  @override
  $RestaurantInfoCopyWith<$Res>? get restaurantInfo;
}

/// @nodoc
class __$$PostsImplCopyWithImpl<$Res>
    extends _$PostsCopyWithImpl<$Res, _$PostsImpl>
    implements _$$PostsImplCopyWith<$Res> {
  __$$PostsImplCopyWithImpl(
      _$PostsImpl _value, $Res Function(_$PostsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? file = freezed,
    Object? mimetype = freezed,
    Object? howWasIt = freezed,
    Object? location = freezed,
    Object? geoDistance = freezed,
    Object? geoLoc = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? isOwn = freezed,
    Object? isNear = freezed,
    Object? isFollowing = freezed,
    Object? isFollowingRequest = freezed,
    Object? isFollower = freezed,
    Object? isSave = freezed,
    Object? likeCount = freezed,
    Object? isMyLike = freezed,
    Object? isMyDisLike = freezed,
    Object? commentCount = freezed,
    Object? userInfo = freezed,
    Object? preferenceInfo = freezed,
    Object? restaurantInfo = freezed,
  }) {
    return _then(_$PostsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      mimetype: freezed == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String?,
      howWasIt: freezed == howWasIt
          ? _value.howWasIt
          : howWasIt // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      geoDistance: freezed == geoDistance
          ? _value.geoDistance
          : geoDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      geoLoc: freezed == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isOwn: freezed == isOwn
          ? _value.isOwn
          : isOwn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNear: freezed == isNear
          ? _value.isNear
          : isNear // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowingRequest: freezed == isFollowingRequest
          ? _value.isFollowingRequest
          : isFollowingRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollower: freezed == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSave: freezed == isSave
          ? _value.isSave
          : isSave // ignore: cast_nullable_to_non_nullable
              as bool?,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isMyLike: freezed == isMyLike
          ? _value.isMyLike
          : isMyLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMyDisLike: freezed == isMyDisLike
          ? _value.isMyDisLike
          : isMyDisLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      preferenceInfo: freezed == preferenceInfo
          ? _value.preferenceInfo
          : preferenceInfo // ignore: cast_nullable_to_non_nullable
              as PreferenceInfo?,
      restaurantInfo: freezed == restaurantInfo
          ? _value.restaurantInfo
          : restaurantInfo // ignore: cast_nullable_to_non_nullable
              as RestaurantInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsImpl implements _Posts {
  const _$PostsImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "file") this.file,
      @JsonKey(name: "mimetype") this.mimetype,
      @JsonKey(name: "how_was_it") this.howWasIt,
      @JsonKey(name: "location") this.location,
      @JsonKey(name: "geo_distance") this.geoDistance,
      @JsonKey(name: "geo_loc") this.geoLoc,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "isOwn") this.isOwn,
      @JsonKey(name: "isNear") this.isNear,
      @JsonKey(name: "isFollowing") this.isFollowing,
      @JsonKey(name: "isFollowingRequest") this.isFollowingRequest,
      @JsonKey(name: "isFollower") this.isFollower,
      @JsonKey(name: "isSave") this.isSave,
      @JsonKey(name: "like_count") this.likeCount,
      @JsonKey(name: "isMyLike") this.isMyLike,
      @JsonKey(name: "isMyDisLike") this.isMyDisLike,
      @JsonKey(name: "comment_count") this.commentCount,
      @JsonKey(name: "userInfo") this.userInfo,
      @JsonKey(name: "preferenceInfo") this.preferenceInfo,
      @JsonKey(name: "restaurantInfo") this.restaurantInfo});

  factory _$PostsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "file")
  final String? file;
  @override
  @JsonKey(name: "mimetype")
  final String? mimetype;
  @override
  @JsonKey(name: "how_was_it")
  final String? howWasIt;
  @override
  @JsonKey(name: "location")
  final String? location;
  @override
  @JsonKey(name: "geo_distance")
  final double? geoDistance;
  @override
  @JsonKey(name: "geo_loc")
  final GeoLoc? geoLoc;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @override
  @JsonKey(name: "isOwn")
  final bool? isOwn;
  @override
  @JsonKey(name: "isNear")
  final bool? isNear;
  @override
  @JsonKey(name: "isFollowing")
  final bool? isFollowing;
  @override
  @JsonKey(name: "isFollowingRequest")
  final bool? isFollowingRequest;
  @override
  @JsonKey(name: "isFollower")
  final bool? isFollower;
  @override
  @JsonKey(name: "isSave")
  final bool? isSave;
  @override
  @JsonKey(name: "like_count")
  final int? likeCount;
  @override
  @JsonKey(name: "isMyLike")
  final bool? isMyLike;
  @override
  @JsonKey(name: "isMyDisLike")
  final bool? isMyDisLike;
  @override
  @JsonKey(name: "comment_count")
  final int? commentCount;
  @override
  @JsonKey(name: "userInfo")
  final UserInfo? userInfo;
  @override
  @JsonKey(name: "preferenceInfo")
  final PreferenceInfo? preferenceInfo;
  @override
  @JsonKey(name: "restaurantInfo")
  final RestaurantInfo? restaurantInfo;

  @override
  String toString() {
    return 'Posts(id: $id, title: $title, description: $description, file: $file, mimetype: $mimetype, howWasIt: $howWasIt, location: $location, geoDistance: $geoDistance, geoLoc: $geoLoc, status: $status, createdAt: $createdAt, isOwn: $isOwn, isNear: $isNear, isFollowing: $isFollowing, isFollowingRequest: $isFollowingRequest, isFollower: $isFollower, isSave: $isSave, likeCount: $likeCount, isMyLike: $isMyLike, isMyDisLike: $isMyDisLike, commentCount: $commentCount, userInfo: $userInfo, preferenceInfo: $preferenceInfo, restaurantInfo: $restaurantInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.mimetype, mimetype) ||
                other.mimetype == mimetype) &&
            (identical(other.howWasIt, howWasIt) ||
                other.howWasIt == howWasIt) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.geoDistance, geoDistance) ||
                other.geoDistance == geoDistance) &&
            (identical(other.geoLoc, geoLoc) || other.geoLoc == geoLoc) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isOwn, isOwn) || other.isOwn == isOwn) &&
            (identical(other.isNear, isNear) || other.isNear == isNear) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isFollowingRequest, isFollowingRequest) ||
                other.isFollowingRequest == isFollowingRequest) &&
            (identical(other.isFollower, isFollower) ||
                other.isFollower == isFollower) &&
            (identical(other.isSave, isSave) || other.isSave == isSave) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isMyLike, isMyLike) ||
                other.isMyLike == isMyLike) &&
            (identical(other.isMyDisLike, isMyDisLike) ||
                other.isMyDisLike == isMyDisLike) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.preferenceInfo, preferenceInfo) ||
                other.preferenceInfo == preferenceInfo) &&
            (identical(other.restaurantInfo, restaurantInfo) ||
                other.restaurantInfo == restaurantInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        file,
        mimetype,
        howWasIt,
        location,
        geoDistance,
        geoLoc,
        status,
        createdAt,
        isOwn,
        isNear,
        isFollowing,
        isFollowingRequest,
        isFollower,
        isSave,
        likeCount,
        isMyLike,
        isMyDisLike,
        commentCount,
        userInfo,
        preferenceInfo,
        restaurantInfo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsImplCopyWith<_$PostsImpl> get copyWith =>
      __$$PostsImplCopyWithImpl<_$PostsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsImplToJson(
      this,
    );
  }
}

abstract class _Posts implements Posts {
  const factory _Posts(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "file") final String? file,
      @JsonKey(name: "mimetype") final String? mimetype,
      @JsonKey(name: "how_was_it") final String? howWasIt,
      @JsonKey(name: "location") final String? location,
      @JsonKey(name: "geo_distance") final double? geoDistance,
      @JsonKey(name: "geo_loc") final GeoLoc? geoLoc,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "createdAt") final String? createdAt,
      @JsonKey(name: "isOwn") final bool? isOwn,
      @JsonKey(name: "isNear") final bool? isNear,
      @JsonKey(name: "isFollowing") final bool? isFollowing,
      @JsonKey(name: "isFollowingRequest") final bool? isFollowingRequest,
      @JsonKey(name: "isFollower") final bool? isFollower,
      @JsonKey(name: "isSave") final bool? isSave,
      @JsonKey(name: "like_count") final int? likeCount,
      @JsonKey(name: "isMyLike") final bool? isMyLike,
      @JsonKey(name: "isMyDisLike") final bool? isMyDisLike,
      @JsonKey(name: "comment_count") final int? commentCount,
      @JsonKey(name: "userInfo") final UserInfo? userInfo,
      @JsonKey(name: "preferenceInfo") final PreferenceInfo? preferenceInfo,
      @JsonKey(name: "restaurantInfo")
      final RestaurantInfo? restaurantInfo}) = _$PostsImpl;

  factory _Posts.fromJson(Map<String, dynamic> json) = _$PostsImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "file")
  String? get file;
  @override
  @JsonKey(name: "mimetype")
  String? get mimetype;
  @override
  @JsonKey(name: "how_was_it")
  String? get howWasIt;
  @override
  @JsonKey(name: "location")
  String? get location;
  @override
  @JsonKey(name: "geo_distance")
  double? get geoDistance;
  @override
  @JsonKey(name: "geo_loc")
  GeoLoc? get geoLoc;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "createdAt")
  String? get createdAt;
  @override
  @JsonKey(name: "isOwn")
  bool? get isOwn;
  @override
  @JsonKey(name: "isNear")
  bool? get isNear;
  @override
  @JsonKey(name: "isFollowing")
  bool? get isFollowing;
  @override
  @JsonKey(name: "isFollowingRequest")
  bool? get isFollowingRequest;
  @override
  @JsonKey(name: "isFollower")
  bool? get isFollower;
  @override
  @JsonKey(name: "isSave")
  bool? get isSave;
  @override
  @JsonKey(name: "like_count")
  int? get likeCount;
  @override
  @JsonKey(name: "isMyLike")
  bool? get isMyLike;
  @override
  @JsonKey(name: "isMyDisLike")
  bool? get isMyDisLike;
  @override
  @JsonKey(name: "comment_count")
  int? get commentCount;
  @override
  @JsonKey(name: "userInfo")
  UserInfo? get userInfo;
  @override
  @JsonKey(name: "preferenceInfo")
  PreferenceInfo? get preferenceInfo;
  @override
  @JsonKey(name: "restaurantInfo")
  RestaurantInfo? get restaurantInfo;
  @override
  @JsonKey(ignore: true)
  _$$PostsImplCopyWith<_$PostsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoLoc _$GeoLocFromJson(Map<String, dynamic> json) {
  return _GeoLoc.fromJson(json);
}

/// @nodoc
mixin _$GeoLoc {
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "coordinates")
  List<double>? get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoLocCopyWith<GeoLoc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoLocCopyWith<$Res> {
  factory $GeoLocCopyWith(GeoLoc value, $Res Function(GeoLoc) then) =
      _$GeoLocCopyWithImpl<$Res, GeoLoc>;
  @useResult
  $Res call(
      {@JsonKey(name: "type") String? type,
      @JsonKey(name: "coordinates") List<double>? coordinates});
}

/// @nodoc
class _$GeoLocCopyWithImpl<$Res, $Val extends GeoLoc>
    implements $GeoLocCopyWith<$Res> {
  _$GeoLocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoLocImplCopyWith<$Res> implements $GeoLocCopyWith<$Res> {
  factory _$$GeoLocImplCopyWith(
          _$GeoLocImpl value, $Res Function(_$GeoLocImpl) then) =
      __$$GeoLocImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "type") String? type,
      @JsonKey(name: "coordinates") List<double>? coordinates});
}

/// @nodoc
class __$$GeoLocImplCopyWithImpl<$Res>
    extends _$GeoLocCopyWithImpl<$Res, _$GeoLocImpl>
    implements _$$GeoLocImplCopyWith<$Res> {
  __$$GeoLocImplCopyWithImpl(
      _$GeoLocImpl _value, $Res Function(_$GeoLocImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_$GeoLocImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoLocImpl implements _GeoLoc {
  const _$GeoLocImpl(
      {@JsonKey(name: "type") this.type,
      @JsonKey(name: "coordinates") final List<double>? coordinates})
      : _coordinates = coordinates;

  factory _$GeoLocImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoLocImplFromJson(json);

  @override
  @JsonKey(name: "type")
  final String? type;
  final List<double>? _coordinates;
  @override
  @JsonKey(name: "coordinates")
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GeoLoc(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoLocImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoLocImplCopyWith<_$GeoLocImpl> get copyWith =>
      __$$GeoLocImplCopyWithImpl<_$GeoLocImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoLocImplToJson(
      this,
    );
  }
}

abstract class _GeoLoc implements GeoLoc {
  const factory _GeoLoc(
          {@JsonKey(name: "type") final String? type,
          @JsonKey(name: "coordinates") final List<double>? coordinates}) =
      _$GeoLocImpl;

  factory _GeoLoc.fromJson(Map<String, dynamic> json) = _$GeoLocImpl.fromJson;

  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "coordinates")
  List<double>? get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$GeoLocImplCopyWith<_$GeoLocImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreferenceInfo _$PreferenceInfoFromJson(Map<String, dynamic> json) {
  return _PreferenceInfo.fromJson(json);
}

/// @nodoc
mixin _$PreferenceInfo {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceInfoCopyWith<PreferenceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceInfoCopyWith<$Res> {
  factory $PreferenceInfoCopyWith(
          PreferenceInfo value, $Res Function(PreferenceInfo) then) =
      _$PreferenceInfoCopyWithImpl<$Res, PreferenceInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class _$PreferenceInfoCopyWithImpl<$Res, $Val extends PreferenceInfo>
    implements $PreferenceInfoCopyWith<$Res> {
  _$PreferenceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceInfoImplCopyWith<$Res>
    implements $PreferenceInfoCopyWith<$Res> {
  factory _$$PreferenceInfoImplCopyWith(_$PreferenceInfoImpl value,
          $Res Function(_$PreferenceInfoImpl) then) =
      __$$PreferenceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "title") String? title});
}

/// @nodoc
class __$$PreferenceInfoImplCopyWithImpl<$Res>
    extends _$PreferenceInfoCopyWithImpl<$Res, _$PreferenceInfoImpl>
    implements _$$PreferenceInfoImplCopyWith<$Res> {
  __$$PreferenceInfoImplCopyWithImpl(
      _$PreferenceInfoImpl _value, $Res Function(_$PreferenceInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$PreferenceInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceInfoImpl implements _PreferenceInfo {
  const _$PreferenceInfoImpl(
      {@JsonKey(name: "_id") this.id, @JsonKey(name: "title") this.title});

  factory _$PreferenceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;

  @override
  String toString() {
    return 'PreferenceInfo(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceInfoImplCopyWith<_$PreferenceInfoImpl> get copyWith =>
      __$$PreferenceInfoImplCopyWithImpl<_$PreferenceInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceInfoImplToJson(
      this,
    );
  }
}

abstract class _PreferenceInfo implements PreferenceInfo {
  const factory _PreferenceInfo(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "title") final String? title}) = _$PreferenceInfoImpl;

  factory _PreferenceInfo.fromJson(Map<String, dynamic> json) =
      _$PreferenceInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceInfoImplCopyWith<_$PreferenceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantInfo _$RestaurantInfoFromJson(Map<String, dynamic> json) {
  return _RestaurantInfo.fromJson(json);
}

/// @nodoc
mixin _$RestaurantInfo {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "zipcode")
  String? get zipcode => throw _privateConstructorUsedError;
  @JsonKey(name: "user_ratings_total")
  String? get userRatingsTotal => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  String? get rating => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "zipcode") String? zipcode,
      @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
      @JsonKey(name: "rating") String? rating});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? zipcode = freezed,
    Object? userRatingsTotal = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipcode: freezed == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "country") String? country,
      @JsonKey(name: "zipcode") String? zipcode,
      @JsonKey(name: "user_ratings_total") String? userRatingsTotal,
      @JsonKey(name: "rating") String? rating});
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
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? zipcode = freezed,
    Object? userRatingsTotal = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$RestaurantInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipcode: freezed == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantInfoImpl implements _RestaurantInfo {
  const _$RestaurantInfoImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "state") this.state,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "country") this.country,
      @JsonKey(name: "zipcode") this.zipcode,
      @JsonKey(name: "user_ratings_total") this.userRatingsTotal,
      @JsonKey(name: "rating") this.rating});

  factory _$RestaurantInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "country")
  final String? country;
  @override
  @JsonKey(name: "zipcode")
  final String? zipcode;
  @override
  @JsonKey(name: "user_ratings_total")
  final String? userRatingsTotal;
  @override
  @JsonKey(name: "rating")
  final String? rating;

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
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "state") final String? state,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "country") final String? country,
      @JsonKey(name: "zipcode") final String? zipcode,
      @JsonKey(name: "user_ratings_total") final String? userRatingsTotal,
      @JsonKey(name: "rating") final String? rating}) = _$RestaurantInfoImpl;

  factory _RestaurantInfo.fromJson(Map<String, dynamic> json) =
      _$RestaurantInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "country")
  String? get country;
  @override
  @JsonKey(name: "zipcode")
  String? get zipcode;
  @override
  @JsonKey(name: "user_ratings_total")
  String? get userRatingsTotal;
  @override
  @JsonKey(name: "rating")
  String? get rating;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantInfoImplCopyWith<_$RestaurantInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "profile_image") String? profileImage});
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
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "profile_image") String? profileImage});
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
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "profile_image") this.profileImage});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "fullName")
  final String? fullName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;

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
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "fullName") final String? fullName,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "profile_image") final String? profileImage}) =
      _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "fullName")
  String? get fullName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
