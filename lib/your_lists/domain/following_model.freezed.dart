// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowingModel _$FollowingModelFromJson(Map<String, dynamic> json) {
  return _FollowingModel.fromJson(json);
}

/// @nodoc
mixin _$FollowingModel {
  @JsonKey(name: "status")
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<DataOfFollowingModel> get followingList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: "pages")
  int get pages => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingModelCopyWith<FollowingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingModelCopyWith<$Res> {
  factory $FollowingModelCopyWith(
          FollowingModel value, $Res Function(FollowingModel) then) =
      _$FollowingModelCopyWithImpl<$Res, FollowingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int status,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "data") List<DataOfFollowingModel> followingList,
      @JsonKey(name: "total") int total,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "pages") int pages,
      @JsonKey(name: "limit") int limit});
}

/// @nodoc
class _$FollowingModelCopyWithImpl<$Res, $Val extends FollowingModel>
    implements $FollowingModelCopyWith<$Res> {
  _$FollowingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? type = null,
    Object? message = null,
    Object? followingList = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      followingList: null == followingList
          ? _value.followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<DataOfFollowingModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingModelImplCopyWith<$Res>
    implements $FollowingModelCopyWith<$Res> {
  factory _$$FollowingModelImplCopyWith(_$FollowingModelImpl value,
          $Res Function(_$FollowingModelImpl) then) =
      __$$FollowingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int status,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "data") List<DataOfFollowingModel> followingList,
      @JsonKey(name: "total") int total,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "pages") int pages,
      @JsonKey(name: "limit") int limit});
}

/// @nodoc
class __$$FollowingModelImplCopyWithImpl<$Res>
    extends _$FollowingModelCopyWithImpl<$Res, _$FollowingModelImpl>
    implements _$$FollowingModelImplCopyWith<$Res> {
  __$$FollowingModelImplCopyWithImpl(
      _$FollowingModelImpl _value, $Res Function(_$FollowingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? type = null,
    Object? message = null,
    Object? followingList = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? limit = null,
  }) {
    return _then(_$FollowingModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      followingList: null == followingList
          ? _value._followingList
          : followingList // ignore: cast_nullable_to_non_nullable
              as List<DataOfFollowingModel>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingModelImpl implements _FollowingModel {
  const _$FollowingModelImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "type") required this.type,
      @JsonKey(name: "message") required this.message,
      @JsonKey(name: "data")
      required final List<DataOfFollowingModel> followingList,
      @JsonKey(name: "total") required this.total,
      @JsonKey(name: "page") required this.page,
      @JsonKey(name: "pages") required this.pages,
      @JsonKey(name: "limit") required this.limit})
      : _followingList = followingList;

  factory _$FollowingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int status;
  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "message")
  final String message;
  final List<DataOfFollowingModel> _followingList;
  @override
  @JsonKey(name: "data")
  List<DataOfFollowingModel> get followingList {
    if (_followingList is EqualUnmodifiableListView) return _followingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followingList);
  }

  @override
  @JsonKey(name: "total")
  final int total;
  @override
  @JsonKey(name: "page")
  final int page;
  @override
  @JsonKey(name: "pages")
  final int pages;
  @override
  @JsonKey(name: "limit")
  final int limit;

  @override
  String toString() {
    return 'FollowingModel(status: $status, type: $type, message: $message, followingList: $followingList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._followingList, _followingList) &&
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
      const DeepCollectionEquality().hash(_followingList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingModelImplCopyWith<_$FollowingModelImpl> get copyWith =>
      __$$FollowingModelImplCopyWithImpl<_$FollowingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingModelImplToJson(
      this,
    );
  }
}

abstract class _FollowingModel implements FollowingModel {
  const factory _FollowingModel(
      {@JsonKey(name: "status") required final int status,
      @JsonKey(name: "type") required final String type,
      @JsonKey(name: "message") required final String message,
      @JsonKey(name: "data")
      required final List<DataOfFollowingModel> followingList,
      @JsonKey(name: "total") required final int total,
      @JsonKey(name: "page") required final int page,
      @JsonKey(name: "pages") required final int pages,
      @JsonKey(name: "limit") required final int limit}) = _$FollowingModelImpl;

  factory _FollowingModel.fromJson(Map<String, dynamic> json) =
      _$FollowingModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int get status;
  @override
  @JsonKey(name: "type")
  String get type;
  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "data")
  List<DataOfFollowingModel> get followingList;
  @override
  @JsonKey(name: "total")
  int get total;
  @override
  @JsonKey(name: "page")
  int get page;
  @override
  @JsonKey(name: "pages")
  int get pages;
  @override
  @JsonKey(name: "limit")
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$FollowingModelImplCopyWith<_$FollowingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfFollowingModel _$DataOfFollowingModelFromJson(Map<String, dynamic> json) {
  return _DataOfFollowingModel.fromJson(json);
}

/// @nodoc
mixin _$DataOfFollowingModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "role_info")
  RoleInfoOfFollowing get roleInfoOfFollowing =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "request_id")
  dynamic get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: "isRequest")
  bool get isRequest => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollow")
  bool get isFollow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataOfFollowingModelCopyWith<DataOfFollowingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfFollowingModelCopyWith<$Res> {
  factory $DataOfFollowingModelCopyWith(DataOfFollowingModel value,
          $Res Function(DataOfFollowingModel) then) =
      _$DataOfFollowingModelCopyWithImpl<$Res, DataOfFollowingModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String profileImage,
      @JsonKey(name: "role_info") RoleInfoOfFollowing roleInfoOfFollowing,
      @JsonKey(name: "request_id") dynamic requestId,
      @JsonKey(name: "isRequest") bool isRequest,
      @JsonKey(name: "isFollow") bool isFollow});

  $RoleInfoOfFollowingCopyWith<$Res> get roleInfoOfFollowing;
}

/// @nodoc
class _$DataOfFollowingModelCopyWithImpl<$Res,
        $Val extends DataOfFollowingModel>
    implements $DataOfFollowingModelCopyWith<$Res> {
  _$DataOfFollowingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? fullName = freezed,
    Object? email = null,
    Object? profileImage = null,
    Object? roleInfoOfFollowing = null,
    Object? requestId = freezed,
    Object? isRequest = null,
    Object? isFollow = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      roleInfoOfFollowing: null == roleInfoOfFollowing
          ? _value.roleInfoOfFollowing
          : roleInfoOfFollowing // ignore: cast_nullable_to_non_nullable
              as RoleInfoOfFollowing,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isRequest: null == isRequest
          ? _value.isRequest
          : isRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleInfoOfFollowingCopyWith<$Res> get roleInfoOfFollowing {
    return $RoleInfoOfFollowingCopyWith<$Res>(_value.roleInfoOfFollowing,
        (value) {
      return _then(_value.copyWith(roleInfoOfFollowing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataOfFollowingModelImplCopyWith<$Res>
    implements $DataOfFollowingModelCopyWith<$Res> {
  factory _$$DataOfFollowingModelImplCopyWith(_$DataOfFollowingModelImpl value,
          $Res Function(_$DataOfFollowingModelImpl) then) =
      __$$DataOfFollowingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String profileImage,
      @JsonKey(name: "role_info") RoleInfoOfFollowing roleInfoOfFollowing,
      @JsonKey(name: "request_id") dynamic requestId,
      @JsonKey(name: "isRequest") bool isRequest,
      @JsonKey(name: "isFollow") bool isFollow});

  @override
  $RoleInfoOfFollowingCopyWith<$Res> get roleInfoOfFollowing;
}

/// @nodoc
class __$$DataOfFollowingModelImplCopyWithImpl<$Res>
    extends _$DataOfFollowingModelCopyWithImpl<$Res, _$DataOfFollowingModelImpl>
    implements _$$DataOfFollowingModelImplCopyWith<$Res> {
  __$$DataOfFollowingModelImplCopyWithImpl(_$DataOfFollowingModelImpl _value,
      $Res Function(_$DataOfFollowingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? fullName = freezed,
    Object? email = null,
    Object? profileImage = null,
    Object? roleInfoOfFollowing = null,
    Object? requestId = freezed,
    Object? isRequest = null,
    Object? isFollow = null,
  }) {
    return _then(_$DataOfFollowingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      roleInfoOfFollowing: null == roleInfoOfFollowing
          ? _value.roleInfoOfFollowing
          : roleInfoOfFollowing // ignore: cast_nullable_to_non_nullable
              as RoleInfoOfFollowing,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isRequest: null == isRequest
          ? _value.isRequest
          : isRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataOfFollowingModelImpl implements _DataOfFollowingModel {
  const _$DataOfFollowingModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "first_name") required this.firstName,
      @JsonKey(name: "last_name") required this.lastName,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "profile_image") required this.profileImage,
      @JsonKey(name: "role_info") required this.roleInfoOfFollowing,
      @JsonKey(name: "request_id") this.requestId,
      @JsonKey(name: "isRequest") required this.isRequest,
      @JsonKey(name: "isFollow") required this.isFollow});

  factory _$DataOfFollowingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfFollowingModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "first_name")
  final String firstName;
  @override
  @JsonKey(name: "last_name")
  final String lastName;
  @override
  @JsonKey(name: "fullName")
  final String? fullName;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "profile_image")
  final String profileImage;
  @override
  @JsonKey(name: "role_info")
  final RoleInfoOfFollowing roleInfoOfFollowing;
  @override
  @JsonKey(name: "request_id")
  final dynamic requestId;
  @override
  @JsonKey(name: "isRequest")
  final bool isRequest;
  @override
  @JsonKey(name: "isFollow")
  final bool isFollow;

  @override
  String toString() {
    return 'DataOfFollowingModel(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, profileImage: $profileImage, roleInfoOfFollowing: $roleInfoOfFollowing, requestId: $requestId, isRequest: $isRequest, isFollow: $isFollow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfFollowingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.roleInfoOfFollowing, roleInfoOfFollowing) ||
                other.roleInfoOfFollowing == roleInfoOfFollowing) &&
            const DeepCollectionEquality().equals(other.requestId, requestId) &&
            (identical(other.isRequest, isRequest) ||
                other.isRequest == isRequest) &&
            (identical(other.isFollow, isFollow) ||
                other.isFollow == isFollow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      fullName,
      email,
      profileImage,
      roleInfoOfFollowing,
      const DeepCollectionEquality().hash(requestId),
      isRequest,
      isFollow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfFollowingModelImplCopyWith<_$DataOfFollowingModelImpl>
      get copyWith =>
          __$$DataOfFollowingModelImplCopyWithImpl<_$DataOfFollowingModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfFollowingModelImplToJson(
      this,
    );
  }
}

abstract class _DataOfFollowingModel implements DataOfFollowingModel {
  const factory _DataOfFollowingModel(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "first_name") required final String firstName,
          @JsonKey(name: "last_name") required final String lastName,
          @JsonKey(name: "fullName") final String? fullName,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "profile_image") required final String profileImage,
          @JsonKey(name: "role_info")
          required final RoleInfoOfFollowing roleInfoOfFollowing,
          @JsonKey(name: "request_id") final dynamic requestId,
          @JsonKey(name: "isRequest") required final bool isRequest,
          @JsonKey(name: "isFollow") required final bool isFollow}) =
      _$DataOfFollowingModelImpl;

  factory _DataOfFollowingModel.fromJson(Map<String, dynamic> json) =
      _$DataOfFollowingModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "first_name")
  String get firstName;
  @override
  @JsonKey(name: "last_name")
  String get lastName;
  @override
  @JsonKey(name: "fullName")
  String? get fullName;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "profile_image")
  String get profileImage;
  @override
  @JsonKey(name: "role_info")
  RoleInfoOfFollowing get roleInfoOfFollowing;
  @override
  @JsonKey(name: "request_id")
  dynamic get requestId;
  @override
  @JsonKey(name: "isRequest")
  bool get isRequest;
  @override
  @JsonKey(name: "isFollow")
  bool get isFollow;
  @override
  @JsonKey(ignore: true)
  _$$DataOfFollowingModelImplCopyWith<_$DataOfFollowingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RoleInfoOfFollowing _$RoleInfoOfFollowingFromJson(Map<String, dynamic> json) {
  return _RoleInfoOfFollowing.fromJson(json);
}

/// @nodoc
mixin _$RoleInfoOfFollowing {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "roleDisplayName")
  String get roleDisplayName => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleInfoOfFollowingCopyWith<RoleInfoOfFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleInfoOfFollowingCopyWith<$Res> {
  factory $RoleInfoOfFollowingCopyWith(
          RoleInfoOfFollowing value, $Res Function(RoleInfoOfFollowing) then) =
      _$RoleInfoOfFollowingCopyWithImpl<$Res, RoleInfoOfFollowing>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "roleDisplayName") String roleDisplayName,
      @JsonKey(name: "role") String role});
}

/// @nodoc
class _$RoleInfoOfFollowingCopyWithImpl<$Res, $Val extends RoleInfoOfFollowing>
    implements $RoleInfoOfFollowingCopyWith<$Res> {
  _$RoleInfoOfFollowingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleDisplayName = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roleDisplayName: null == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleInfoOfFollowingImplCopyWith<$Res>
    implements $RoleInfoOfFollowingCopyWith<$Res> {
  factory _$$RoleInfoOfFollowingImplCopyWith(_$RoleInfoOfFollowingImpl value,
          $Res Function(_$RoleInfoOfFollowingImpl) then) =
      __$$RoleInfoOfFollowingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "roleDisplayName") String roleDisplayName,
      @JsonKey(name: "role") String role});
}

/// @nodoc
class __$$RoleInfoOfFollowingImplCopyWithImpl<$Res>
    extends _$RoleInfoOfFollowingCopyWithImpl<$Res, _$RoleInfoOfFollowingImpl>
    implements _$$RoleInfoOfFollowingImplCopyWith<$Res> {
  __$$RoleInfoOfFollowingImplCopyWithImpl(_$RoleInfoOfFollowingImpl _value,
      $Res Function(_$RoleInfoOfFollowingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleDisplayName = null,
    Object? role = null,
  }) {
    return _then(_$RoleInfoOfFollowingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      roleDisplayName: null == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleInfoOfFollowingImpl implements _RoleInfoOfFollowing {
  const _$RoleInfoOfFollowingImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "roleDisplayName") required this.roleDisplayName,
      @JsonKey(name: "role") required this.role});

  factory _$RoleInfoOfFollowingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleInfoOfFollowingImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "roleDisplayName")
  final String roleDisplayName;
  @override
  @JsonKey(name: "role")
  final String role;

  @override
  String toString() {
    return 'RoleInfoOfFollowing(id: $id, roleDisplayName: $roleDisplayName, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleInfoOfFollowingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roleDisplayName, roleDisplayName) ||
                other.roleDisplayName == roleDisplayName) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, roleDisplayName, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleInfoOfFollowingImplCopyWith<_$RoleInfoOfFollowingImpl> get copyWith =>
      __$$RoleInfoOfFollowingImplCopyWithImpl<_$RoleInfoOfFollowingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleInfoOfFollowingImplToJson(
      this,
    );
  }
}

abstract class _RoleInfoOfFollowing implements RoleInfoOfFollowing {
  const factory _RoleInfoOfFollowing(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "roleDisplayName") required final String roleDisplayName,
      @JsonKey(name: "role")
      required final String role}) = _$RoleInfoOfFollowingImpl;

  factory _RoleInfoOfFollowing.fromJson(Map<String, dynamic> json) =
      _$RoleInfoOfFollowingImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "roleDisplayName")
  String get roleDisplayName;
  @override
  @JsonKey(name: "role")
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$RoleInfoOfFollowingImplCopyWith<_$RoleInfoOfFollowingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
