// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedPostModel _$SavedPostModelFromJson(Map<String, dynamic> json) {
  return _SavedPostModel.fromJson(json);
}

/// @nodoc
mixin _$SavedPostModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<DataOfSavedPostModel> get savedList =>
      throw _privateConstructorUsedError;
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
  $SavedPostModelCopyWith<SavedPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPostModelCopyWith<$Res> {
  factory $SavedPostModelCopyWith(
          SavedPostModel value, $Res Function(SavedPostModel) then) =
      _$SavedPostModelCopyWithImpl<$Res, SavedPostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<DataOfSavedPostModel> savedList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$SavedPostModelCopyWithImpl<$Res, $Val extends SavedPostModel>
    implements $SavedPostModelCopyWith<$Res> {
  _$SavedPostModelCopyWithImpl(this._value, this._then);

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
    Object? savedList = null,
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
      savedList: null == savedList
          ? _value.savedList
          : savedList // ignore: cast_nullable_to_non_nullable
              as List<DataOfSavedPostModel>,
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
abstract class _$$SavedPostModelImplCopyWith<$Res>
    implements $SavedPostModelCopyWith<$Res> {
  factory _$$SavedPostModelImplCopyWith(_$SavedPostModelImpl value,
          $Res Function(_$SavedPostModelImpl) then) =
      __$$SavedPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<DataOfSavedPostModel> savedList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$SavedPostModelImplCopyWithImpl<$Res>
    extends _$SavedPostModelCopyWithImpl<$Res, _$SavedPostModelImpl>
    implements _$$SavedPostModelImplCopyWith<$Res> {
  __$$SavedPostModelImplCopyWithImpl(
      _$SavedPostModelImpl _value, $Res Function(_$SavedPostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? savedList = null,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$SavedPostModelImpl(
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
      savedList: null == savedList
          ? _value._savedList
          : savedList // ignore: cast_nullable_to_non_nullable
              as List<DataOfSavedPostModel>,
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
class _$SavedPostModelImpl implements _SavedPostModel {
  const _$SavedPostModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data")
      required final List<DataOfSavedPostModel> savedList,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit})
      : _savedList = savedList;

  factory _$SavedPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPostModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<DataOfSavedPostModel> _savedList;
  @override
  @JsonKey(name: "data")
  List<DataOfSavedPostModel> get savedList {
    if (_savedList is EqualUnmodifiableListView) return _savedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedList);
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
    return 'SavedPostModel(status: $status, type: $type, message: $message, savedList: $savedList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPostModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._savedList, _savedList) &&
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
      const DeepCollectionEquality().hash(_savedList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPostModelImplCopyWith<_$SavedPostModelImpl> get copyWith =>
      __$$SavedPostModelImplCopyWithImpl<_$SavedPostModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPostModelImplToJson(
      this,
    );
  }
}

abstract class _SavedPostModel implements SavedPostModel {
  const factory _SavedPostModel(
      {@JsonKey(name: "status") final int? status,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data")
      required final List<DataOfSavedPostModel> savedList,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "pages") final int? pages,
      @JsonKey(name: "limit") final int? limit}) = _$SavedPostModelImpl;

  factory _SavedPostModel.fromJson(Map<String, dynamic> json) =
      _$SavedPostModelImpl.fromJson;

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
  List<DataOfSavedPostModel> get savedList;
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
  _$$SavedPostModelImplCopyWith<_$SavedPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfSavedPostModel _$DataOfSavedPostModelFromJson(Map<String, dynamic> json) {
  return _DataOfSavedPostModel.fromJson(json);
}

/// @nodoc
mixin _$DataOfSavedPostModel {
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
  @JsonKey(name: "location")
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: "geo_distance")
  double get geoDistance => throw _privateConstructorUsedError;
  @JsonKey(name: "geo_loc")
  GeoLoc get geoLoc => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "isOwn")
  bool get isOwn => throw _privateConstructorUsedError;
  @JsonKey(name: "isNear")
  bool get isNear => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollowing")
  bool get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollower")
  bool get isFollower => throw _privateConstructorUsedError;
  @JsonKey(name: "isSave")
  bool get isSave => throw _privateConstructorUsedError;
  @JsonKey(name: "like_count")
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: "isMyLike")
  bool get isMyLike => throw _privateConstructorUsedError;
  @JsonKey(name: "isMyDisLike")
  bool get isMyDisLike => throw _privateConstructorUsedError;
  @JsonKey(name: "comment_count")
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: "userInfo")
  UserInfo get userInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "commentInfo")
  List<CommentInfo>? get commentInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "preferenceInfo")
  PreferenceInfo? get preferenceInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "restaurantInfo")
  RestaurantInfo? get restaurantInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataOfSavedPostModelCopyWith<DataOfSavedPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfSavedPostModelCopyWith<$Res> {
  factory $DataOfSavedPostModelCopyWith(DataOfSavedPostModel value,
          $Res Function(DataOfSavedPostModel) then) =
      _$DataOfSavedPostModelCopyWithImpl<$Res, DataOfSavedPostModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "file") String file,
      @JsonKey(name: "mimetype") String mimetype,
      @JsonKey(name: "how_was_it") String howWasIt,
      @JsonKey(name: "location") String location,
      @JsonKey(name: "geo_distance") double geoDistance,
      @JsonKey(name: "geo_loc") GeoLoc geoLoc,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "isOwn") bool isOwn,
      @JsonKey(name: "isNear") bool isNear,
      @JsonKey(name: "isFollowing") bool isFollowing,
      @JsonKey(name: "isFollower") bool isFollower,
      @JsonKey(name: "isSave") bool isSave,
      @JsonKey(name: "like_count") int likeCount,
      @JsonKey(name: "isMyLike") bool isMyLike,
      @JsonKey(name: "isMyDisLike") bool isMyDisLike,
      @JsonKey(name: "comment_count") int commentCount,
      @JsonKey(name: "userInfo") UserInfo userInfo,
      @JsonKey(name: "commentInfo") List<CommentInfo>? commentInfo,
      @JsonKey(name: "preferenceInfo") PreferenceInfo? preferenceInfo,
      @JsonKey(name: "restaurantInfo") RestaurantInfo? restaurantInfo});

  $GeoLocCopyWith<$Res> get geoLoc;
  $UserInfoCopyWith<$Res> get userInfo;
  $PreferenceInfoCopyWith<$Res>? get preferenceInfo;
  $RestaurantInfoCopyWith<$Res>? get restaurantInfo;
}

/// @nodoc
class _$DataOfSavedPostModelCopyWithImpl<$Res,
        $Val extends DataOfSavedPostModel>
    implements $DataOfSavedPostModelCopyWith<$Res> {
  _$DataOfSavedPostModelCopyWithImpl(this._value, this._then);

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
    Object? location = null,
    Object? geoDistance = null,
    Object? geoLoc = null,
    Object? status = null,
    Object? createdAt = null,
    Object? isOwn = null,
    Object? isNear = null,
    Object? isFollowing = null,
    Object? isFollower = null,
    Object? isSave = null,
    Object? likeCount = null,
    Object? isMyLike = null,
    Object? isMyDisLike = null,
    Object? commentCount = null,
    Object? userInfo = null,
    Object? commentInfo = freezed,
    Object? preferenceInfo = freezed,
    Object? restaurantInfo = freezed,
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      geoDistance: null == geoDistance
          ? _value.geoDistance
          : geoDistance // ignore: cast_nullable_to_non_nullable
              as double,
      geoLoc: null == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc,
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
      isNear: null == isNear
          ? _value.isNear
          : isNear // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollower: null == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
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
      isMyDisLike: null == isMyDisLike
          ? _value.isMyDisLike
          : isMyDisLike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      commentInfo: freezed == commentInfo
          ? _value.commentInfo
          : commentInfo // ignore: cast_nullable_to_non_nullable
              as List<CommentInfo>?,
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
  $GeoLocCopyWith<$Res> get geoLoc {
    return $GeoLocCopyWith<$Res>(_value.geoLoc, (value) {
      return _then(_value.copyWith(geoLoc: value) as $Val);
    });
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
abstract class _$$DataOfSavedPostModelImplCopyWith<$Res>
    implements $DataOfSavedPostModelCopyWith<$Res> {
  factory _$$DataOfSavedPostModelImplCopyWith(_$DataOfSavedPostModelImpl value,
          $Res Function(_$DataOfSavedPostModelImpl) then) =
      __$$DataOfSavedPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "file") String file,
      @JsonKey(name: "mimetype") String mimetype,
      @JsonKey(name: "how_was_it") String howWasIt,
      @JsonKey(name: "location") String location,
      @JsonKey(name: "geo_distance") double geoDistance,
      @JsonKey(name: "geo_loc") GeoLoc geoLoc,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "isOwn") bool isOwn,
      @JsonKey(name: "isNear") bool isNear,
      @JsonKey(name: "isFollowing") bool isFollowing,
      @JsonKey(name: "isFollower") bool isFollower,
      @JsonKey(name: "isSave") bool isSave,
      @JsonKey(name: "like_count") int likeCount,
      @JsonKey(name: "isMyLike") bool isMyLike,
      @JsonKey(name: "isMyDisLike") bool isMyDisLike,
      @JsonKey(name: "comment_count") int commentCount,
      @JsonKey(name: "userInfo") UserInfo userInfo,
      @JsonKey(name: "commentInfo") List<CommentInfo>? commentInfo,
      @JsonKey(name: "preferenceInfo") PreferenceInfo? preferenceInfo,
      @JsonKey(name: "restaurantInfo") RestaurantInfo? restaurantInfo});

  @override
  $GeoLocCopyWith<$Res> get geoLoc;
  @override
  $UserInfoCopyWith<$Res> get userInfo;
  @override
  $PreferenceInfoCopyWith<$Res>? get preferenceInfo;
  @override
  $RestaurantInfoCopyWith<$Res>? get restaurantInfo;
}

/// @nodoc
class __$$DataOfSavedPostModelImplCopyWithImpl<$Res>
    extends _$DataOfSavedPostModelCopyWithImpl<$Res, _$DataOfSavedPostModelImpl>
    implements _$$DataOfSavedPostModelImplCopyWith<$Res> {
  __$$DataOfSavedPostModelImplCopyWithImpl(_$DataOfSavedPostModelImpl _value,
      $Res Function(_$DataOfSavedPostModelImpl) _then)
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
    Object? location = null,
    Object? geoDistance = null,
    Object? geoLoc = null,
    Object? status = null,
    Object? createdAt = null,
    Object? isOwn = null,
    Object? isNear = null,
    Object? isFollowing = null,
    Object? isFollower = null,
    Object? isSave = null,
    Object? likeCount = null,
    Object? isMyLike = null,
    Object? isMyDisLike = null,
    Object? commentCount = null,
    Object? userInfo = null,
    Object? commentInfo = freezed,
    Object? preferenceInfo = freezed,
    Object? restaurantInfo = freezed,
  }) {
    return _then(_$DataOfSavedPostModelImpl(
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
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      geoDistance: null == geoDistance
          ? _value.geoDistance
          : geoDistance // ignore: cast_nullable_to_non_nullable
              as double,
      geoLoc: null == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc,
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
      isNear: null == isNear
          ? _value.isNear
          : isNear // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollower: null == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
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
      isMyDisLike: null == isMyDisLike
          ? _value.isMyDisLike
          : isMyDisLike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      commentInfo: freezed == commentInfo
          ? _value._commentInfo
          : commentInfo // ignore: cast_nullable_to_non_nullable
              as List<CommentInfo>?,
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
class _$DataOfSavedPostModelImpl implements _DataOfSavedPostModel {
  const _$DataOfSavedPostModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "file") required this.file,
      @JsonKey(name: "mimetype") required this.mimetype,
      @JsonKey(name: "how_was_it") required this.howWasIt,
      @JsonKey(name: "location") required this.location,
      @JsonKey(name: "geo_distance") required this.geoDistance,
      @JsonKey(name: "geo_loc") required this.geoLoc,
      @JsonKey(name: "status") required this.status,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "isOwn") required this.isOwn,
      @JsonKey(name: "isNear") required this.isNear,
      @JsonKey(name: "isFollowing") required this.isFollowing,
      @JsonKey(name: "isFollower") required this.isFollower,
      @JsonKey(name: "isSave") required this.isSave,
      @JsonKey(name: "like_count") required this.likeCount,
      @JsonKey(name: "isMyLike") required this.isMyLike,
      @JsonKey(name: "isMyDisLike") required this.isMyDisLike,
      @JsonKey(name: "comment_count") required this.commentCount,
      @JsonKey(name: "userInfo") required this.userInfo,
      @JsonKey(name: "commentInfo") final List<CommentInfo>? commentInfo,
      @JsonKey(name: "preferenceInfo") this.preferenceInfo,
      @JsonKey(name: "restaurantInfo") this.restaurantInfo})
      : _commentInfo = commentInfo;

  factory _$DataOfSavedPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfSavedPostModelImplFromJson(json);

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
  @JsonKey(name: "location")
  final String location;
  @override
  @JsonKey(name: "geo_distance")
  final double geoDistance;
  @override
  @JsonKey(name: "geo_loc")
  final GeoLoc geoLoc;
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
  @JsonKey(name: "isNear")
  final bool isNear;
  @override
  @JsonKey(name: "isFollowing")
  final bool isFollowing;
  @override
  @JsonKey(name: "isFollower")
  final bool isFollower;
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
  @JsonKey(name: "isMyDisLike")
  final bool isMyDisLike;
  @override
  @JsonKey(name: "comment_count")
  final int commentCount;
  @override
  @JsonKey(name: "userInfo")
  final UserInfo userInfo;
  final List<CommentInfo>? _commentInfo;
  @override
  @JsonKey(name: "commentInfo")
  List<CommentInfo>? get commentInfo {
    final value = _commentInfo;
    if (value == null) return null;
    if (_commentInfo is EqualUnmodifiableListView) return _commentInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "preferenceInfo")
  final PreferenceInfo? preferenceInfo;
  @override
  @JsonKey(name: "restaurantInfo")
  final RestaurantInfo? restaurantInfo;

  @override
  String toString() {
    return 'DataOfSavedPostModel(id: $id, title: $title, description: $description, file: $file, mimetype: $mimetype, howWasIt: $howWasIt, location: $location, geoDistance: $geoDistance, geoLoc: $geoLoc, status: $status, createdAt: $createdAt, isOwn: $isOwn, isNear: $isNear, isFollowing: $isFollowing, isFollower: $isFollower, isSave: $isSave, likeCount: $likeCount, isMyLike: $isMyLike, isMyDisLike: $isMyDisLike, commentCount: $commentCount, userInfo: $userInfo, commentInfo: $commentInfo, preferenceInfo: $preferenceInfo, restaurantInfo: $restaurantInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfSavedPostModelImpl &&
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
            const DeepCollectionEquality()
                .equals(other._commentInfo, _commentInfo) &&
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
        isFollower,
        isSave,
        likeCount,
        isMyLike,
        isMyDisLike,
        commentCount,
        userInfo,
        const DeepCollectionEquality().hash(_commentInfo),
        preferenceInfo,
        restaurantInfo
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfSavedPostModelImplCopyWith<_$DataOfSavedPostModelImpl>
      get copyWith =>
          __$$DataOfSavedPostModelImplCopyWithImpl<_$DataOfSavedPostModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfSavedPostModelImplToJson(
      this,
    );
  }
}

abstract class _DataOfSavedPostModel implements DataOfSavedPostModel {
  const factory _DataOfSavedPostModel(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "title") required final String title,
      @JsonKey(name: "description") required final String description,
      @JsonKey(name: "file") required final String file,
      @JsonKey(name: "mimetype") required final String mimetype,
      @JsonKey(name: "how_was_it") required final String howWasIt,
      @JsonKey(name: "location") required final String location,
      @JsonKey(name: "geo_distance") required final double geoDistance,
      @JsonKey(name: "geo_loc") required final GeoLoc geoLoc,
      @JsonKey(name: "status") required final String status,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "isOwn") required final bool isOwn,
      @JsonKey(name: "isNear") required final bool isNear,
      @JsonKey(name: "isFollowing") required final bool isFollowing,
      @JsonKey(name: "isFollower") required final bool isFollower,
      @JsonKey(name: "isSave") required final bool isSave,
      @JsonKey(name: "like_count") required final int likeCount,
      @JsonKey(name: "isMyLike") required final bool isMyLike,
      @JsonKey(name: "isMyDisLike") required final bool isMyDisLike,
      @JsonKey(name: "comment_count") required final int commentCount,
      @JsonKey(name: "userInfo") required final UserInfo userInfo,
      @JsonKey(name: "commentInfo") final List<CommentInfo>? commentInfo,
      @JsonKey(name: "preferenceInfo") final PreferenceInfo? preferenceInfo,
      @JsonKey(name: "restaurantInfo")
      final RestaurantInfo? restaurantInfo}) = _$DataOfSavedPostModelImpl;

  factory _DataOfSavedPostModel.fromJson(Map<String, dynamic> json) =
      _$DataOfSavedPostModelImpl.fromJson;

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
  @JsonKey(name: "location")
  String get location;
  @override
  @JsonKey(name: "geo_distance")
  double get geoDistance;
  @override
  @JsonKey(name: "geo_loc")
  GeoLoc get geoLoc;
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
  @JsonKey(name: "isNear")
  bool get isNear;
  @override
  @JsonKey(name: "isFollowing")
  bool get isFollowing;
  @override
  @JsonKey(name: "isFollower")
  bool get isFollower;
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
  @JsonKey(name: "isMyDisLike")
  bool get isMyDisLike;
  @override
  @JsonKey(name: "comment_count")
  int get commentCount;
  @override
  @JsonKey(name: "userInfo")
  UserInfo get userInfo;
  @override
  @JsonKey(name: "commentInfo")
  List<CommentInfo>? get commentInfo;
  @override
  @JsonKey(name: "preferenceInfo")
  PreferenceInfo? get preferenceInfo;
  @override
  @JsonKey(name: "restaurantInfo")
  RestaurantInfo? get restaurantInfo;
  @override
  @JsonKey(ignore: true)
  _$$DataOfSavedPostModelImplCopyWith<_$DataOfSavedPostModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GeoLoc _$GeoLocFromJson(Map<String, dynamic> json) {
  return _GeoLoc.fromJson(json);
}

/// @nodoc
mixin _$GeoLoc {
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "coordinates")
  List<double> get coordinates => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "type") String type,
      @JsonKey(name: "coordinates") List<double> coordinates});
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
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
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
      {@JsonKey(name: "type") String type,
      @JsonKey(name: "coordinates") List<double> coordinates});
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
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_$GeoLocImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoLocImpl implements _GeoLoc {
  const _$GeoLocImpl(
      {@JsonKey(name: "type") required this.type,
      @JsonKey(name: "coordinates") required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$GeoLocImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoLocImplFromJson(json);

  @override
  @JsonKey(name: "type")
  final String type;
  final List<double> _coordinates;
  @override
  @JsonKey(name: "coordinates")
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
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
      {@JsonKey(name: "type") required final String type,
      @JsonKey(name: "coordinates")
      required final List<double> coordinates}) = _$GeoLocImpl;

  factory _GeoLoc.fromJson(Map<String, dynamic> json) = _$GeoLocImpl.fromJson;

  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "coordinates")
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$GeoLocImplCopyWith<_$GeoLocImpl> get copyWith =>
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
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
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
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? profileImage = freezed,
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
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
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
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? profileImage = freezed,
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
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "fullName") required this.fullName,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "profile_image") this.profileImage});

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
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "fullName") required final String fullName,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "profile_image") final String? profileImage}) =
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
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreferenceInfo _$PreferenceInfoFromJson(Map<String, dynamic> json) {
  return _PreferenceInfo.fromJson(json);
}

/// @nodoc
mixin _$PreferenceInfo {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String id, @JsonKey(name: "title") String title});
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
    Object? id = null,
    Object? title = null,
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
      {@JsonKey(name: "_id") String id, @JsonKey(name: "title") String title});
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
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$PreferenceInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceInfoImpl implements _PreferenceInfo {
  const _$PreferenceInfoImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "title") required this.title});

  factory _$PreferenceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;

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
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "title") required final String title}) =
      _$PreferenceInfoImpl;

  factory _PreferenceInfo.fromJson(Map<String, dynamic> json) =
      _$PreferenceInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "title")
  String get title;
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

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) {
  return _CommentInfo.fromJson(json);
}

/// @nodoc
mixin _$CommentInfo {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "post_id")
  String get postId => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "commentedUserData")
  CommentedUserData get commentedUserData => throw _privateConstructorUsedError;
  @JsonKey(name: "isCommentLiked")
  bool get isCommentLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentInfoCopyWith<CommentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentInfoCopyWith<$Res> {
  factory $CommentInfoCopyWith(
          CommentInfo value, $Res Function(CommentInfo) then) =
      _$CommentInfoCopyWithImpl<$Res, CommentInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "post_id") String postId,
      @JsonKey(name: "comment") String comment,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "commentedUserData") CommentedUserData commentedUserData,
      @JsonKey(name: "isCommentLiked") bool isCommentLiked});

  $CommentedUserDataCopyWith<$Res> get commentedUserData;
}

/// @nodoc
class _$CommentInfoCopyWithImpl<$Res, $Val extends CommentInfo>
    implements $CommentInfoCopyWith<$Res> {
  _$CommentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? postId = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? commentedUserData = null,
    Object? isCommentLiked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      commentedUserData: null == commentedUserData
          ? _value.commentedUserData
          : commentedUserData // ignore: cast_nullable_to_non_nullable
              as CommentedUserData,
      isCommentLiked: null == isCommentLiked
          ? _value.isCommentLiked
          : isCommentLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentedUserDataCopyWith<$Res> get commentedUserData {
    return $CommentedUserDataCopyWith<$Res>(_value.commentedUserData, (value) {
      return _then(_value.copyWith(commentedUserData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentInfoImplCopyWith<$Res>
    implements $CommentInfoCopyWith<$Res> {
  factory _$$CommentInfoImplCopyWith(
          _$CommentInfoImpl value, $Res Function(_$CommentInfoImpl) then) =
      __$$CommentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "post_id") String postId,
      @JsonKey(name: "comment") String comment,
      @JsonKey(name: "createdAt") DateTime createdAt,
      @JsonKey(name: "commentedUserData") CommentedUserData commentedUserData,
      @JsonKey(name: "isCommentLiked") bool isCommentLiked});

  @override
  $CommentedUserDataCopyWith<$Res> get commentedUserData;
}

/// @nodoc
class __$$CommentInfoImplCopyWithImpl<$Res>
    extends _$CommentInfoCopyWithImpl<$Res, _$CommentInfoImpl>
    implements _$$CommentInfoImplCopyWith<$Res> {
  __$$CommentInfoImplCopyWithImpl(
      _$CommentInfoImpl _value, $Res Function(_$CommentInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? postId = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? commentedUserData = null,
    Object? isCommentLiked = null,
  }) {
    return _then(_$CommentInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      commentedUserData: null == commentedUserData
          ? _value.commentedUserData
          : commentedUserData // ignore: cast_nullable_to_non_nullable
              as CommentedUserData,
      isCommentLiked: null == isCommentLiked
          ? _value.isCommentLiked
          : isCommentLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentInfoImpl implements _CommentInfo {
  const _$CommentInfoImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "post_id") required this.postId,
      @JsonKey(name: "comment") required this.comment,
      @JsonKey(name: "createdAt") required this.createdAt,
      @JsonKey(name: "commentedUserData") required this.commentedUserData,
      @JsonKey(name: "isCommentLiked") required this.isCommentLiked});

  factory _$CommentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "post_id")
  final String postId;
  @override
  @JsonKey(name: "comment")
  final String comment;
  @override
  @JsonKey(name: "createdAt")
  final DateTime createdAt;
  @override
  @JsonKey(name: "commentedUserData")
  final CommentedUserData commentedUserData;
  @override
  @JsonKey(name: "isCommentLiked")
  final bool isCommentLiked;

  @override
  String toString() {
    return 'CommentInfo(id: $id, userId: $userId, postId: $postId, comment: $comment, createdAt: $createdAt, commentedUserData: $commentedUserData, isCommentLiked: $isCommentLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.commentedUserData, commentedUserData) ||
                other.commentedUserData == commentedUserData) &&
            (identical(other.isCommentLiked, isCommentLiked) ||
                other.isCommentLiked == isCommentLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, postId, comment,
      createdAt, commentedUserData, isCommentLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentInfoImplCopyWith<_$CommentInfoImpl> get copyWith =>
      __$$CommentInfoImplCopyWithImpl<_$CommentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentInfoImplToJson(
      this,
    );
  }
}

abstract class _CommentInfo implements CommentInfo {
  const factory _CommentInfo(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "user_id") required final String userId,
      @JsonKey(name: "post_id") required final String postId,
      @JsonKey(name: "comment") required final String comment,
      @JsonKey(name: "createdAt") required final DateTime createdAt,
      @JsonKey(name: "commentedUserData")
      required final CommentedUserData commentedUserData,
      @JsonKey(name: "isCommentLiked")
      required final bool isCommentLiked}) = _$CommentInfoImpl;

  factory _CommentInfo.fromJson(Map<String, dynamic> json) =
      _$CommentInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "post_id")
  String get postId;
  @override
  @JsonKey(name: "comment")
  String get comment;
  @override
  @JsonKey(name: "createdAt")
  DateTime get createdAt;
  @override
  @JsonKey(name: "commentedUserData")
  CommentedUserData get commentedUserData;
  @override
  @JsonKey(name: "isCommentLiked")
  bool get isCommentLiked;
  @override
  @JsonKey(ignore: true)
  _$$CommentInfoImplCopyWith<_$CommentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentedUserData _$CommentedUserDataFromJson(Map<String, dynamic> json) {
  return _CommentedUserData.fromJson(json);
}

/// @nodoc
mixin _$CommentedUserData {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentedUserDataCopyWith<CommentedUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentedUserDataCopyWith<$Res> {
  factory $CommentedUserDataCopyWith(
          CommentedUserData value, $Res Function(CommentedUserData) then) =
      _$CommentedUserDataCopyWithImpl<$Res, CommentedUserData>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class _$CommentedUserDataCopyWithImpl<$Res, $Val extends CommentedUserData>
    implements $CommentedUserDataCopyWith<$Res> {
  _$CommentedUserDataCopyWithImpl(this._value, this._then);

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
    Object? profileImage = freezed,
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentedUserDataImplCopyWith<$Res>
    implements $CommentedUserDataCopyWith<$Res> {
  factory _$$CommentedUserDataImplCopyWith(_$CommentedUserDataImpl value,
          $Res Function(_$CommentedUserDataImpl) then) =
      __$$CommentedUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "fullName") String fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class __$$CommentedUserDataImplCopyWithImpl<$Res>
    extends _$CommentedUserDataCopyWithImpl<$Res, _$CommentedUserDataImpl>
    implements _$$CommentedUserDataImplCopyWith<$Res> {
  __$$CommentedUserDataImplCopyWithImpl(_$CommentedUserDataImpl _value,
      $Res Function(_$CommentedUserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? email = null,
    Object? profileImage = freezed,
  }) {
    return _then(_$CommentedUserDataImpl(
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
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentedUserDataImpl implements _CommentedUserData {
  const _$CommentedUserDataImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "fullName") required this.fullName,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "profile_image") this.profileImage});

  factory _$CommentedUserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentedUserDataImplFromJson(json);

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
  final String? profileImage;

  @override
  String toString() {
    return 'CommentedUserData(id: $id, fullName: $fullName, email: $email, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentedUserDataImpl &&
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
  _$$CommentedUserDataImplCopyWith<_$CommentedUserDataImpl> get copyWith =>
      __$$CommentedUserDataImplCopyWithImpl<_$CommentedUserDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentedUserDataImplToJson(
      this,
    );
  }
}

abstract class _CommentedUserData implements CommentedUserData {
  const factory _CommentedUserData(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "fullName") required final String fullName,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "profile_image") final String? profileImage}) =
      _$CommentedUserDataImpl;

  factory _CommentedUserData.fromJson(Map<String, dynamic> json) =
      _$CommentedUserDataImpl.fromJson;

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
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$CommentedUserDataImplCopyWith<_$CommentedUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
