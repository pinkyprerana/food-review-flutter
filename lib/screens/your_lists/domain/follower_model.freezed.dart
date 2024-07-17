// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowerModel _$FollowerModelFromJson(Map<String, dynamic> json) {
  return _FollowerModel.fromJson(json);
}

/// @nodoc
mixin _$FollowerModel {
  @JsonKey(name: "status")
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<DataOfFollowerModel> get followerList =>
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
  $FollowerModelCopyWith<FollowerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerModelCopyWith<$Res> {
  factory $FollowerModelCopyWith(
          FollowerModel value, $Res Function(FollowerModel) then) =
      _$FollowerModelCopyWithImpl<$Res, FollowerModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int status,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "data") List<DataOfFollowerModel> followerList,
      @JsonKey(name: "total") int total,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "pages") int pages,
      @JsonKey(name: "limit") int limit});
}

/// @nodoc
class _$FollowerModelCopyWithImpl<$Res, $Val extends FollowerModel>
    implements $FollowerModelCopyWith<$Res> {
  _$FollowerModelCopyWithImpl(this._value, this._then);

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
    Object? followerList = null,
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
      followerList: null == followerList
          ? _value.followerList
          : followerList // ignore: cast_nullable_to_non_nullable
              as List<DataOfFollowerModel>,
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
abstract class _$$FollowerModelImplCopyWith<$Res>
    implements $FollowerModelCopyWith<$Res> {
  factory _$$FollowerModelImplCopyWith(
          _$FollowerModelImpl value, $Res Function(_$FollowerModelImpl) then) =
      __$$FollowerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int status,
      @JsonKey(name: "type") String type,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "data") List<DataOfFollowerModel> followerList,
      @JsonKey(name: "total") int total,
      @JsonKey(name: "page") int page,
      @JsonKey(name: "pages") int pages,
      @JsonKey(name: "limit") int limit});
}

/// @nodoc
class __$$FollowerModelImplCopyWithImpl<$Res>
    extends _$FollowerModelCopyWithImpl<$Res, _$FollowerModelImpl>
    implements _$$FollowerModelImplCopyWith<$Res> {
  __$$FollowerModelImplCopyWithImpl(
      _$FollowerModelImpl _value, $Res Function(_$FollowerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? type = null,
    Object? message = null,
    Object? followerList = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? limit = null,
  }) {
    return _then(_$FollowerModelImpl(
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
      followerList: null == followerList
          ? _value._followerList
          : followerList // ignore: cast_nullable_to_non_nullable
              as List<DataOfFollowerModel>,
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
class _$FollowerModelImpl implements _FollowerModel {
  const _$FollowerModelImpl(
      {@JsonKey(name: "status") required this.status,
      @JsonKey(name: "type") required this.type,
      @JsonKey(name: "message") required this.message,
      @JsonKey(name: "data")
      required final List<DataOfFollowerModel> followerList,
      @JsonKey(name: "total") required this.total,
      @JsonKey(name: "page") required this.page,
      @JsonKey(name: "pages") required this.pages,
      @JsonKey(name: "limit") required this.limit})
      : _followerList = followerList;

  factory _$FollowerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int status;
  @override
  @JsonKey(name: "type")
  final String type;
  @override
  @JsonKey(name: "message")
  final String message;
  final List<DataOfFollowerModel> _followerList;
  @override
  @JsonKey(name: "data")
  List<DataOfFollowerModel> get followerList {
    if (_followerList is EqualUnmodifiableListView) return _followerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followerList);
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
    return 'FollowerModel(status: $status, type: $type, message: $message, followerList: $followerList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._followerList, _followerList) &&
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
      const DeepCollectionEquality().hash(_followerList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowerModelImplCopyWith<_$FollowerModelImpl> get copyWith =>
      __$$FollowerModelImplCopyWithImpl<_$FollowerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowerModelImplToJson(
      this,
    );
  }
}

abstract class _FollowerModel implements FollowerModel {
  const factory _FollowerModel(
      {@JsonKey(name: "status") required final int status,
      @JsonKey(name: "type") required final String type,
      @JsonKey(name: "message") required final String message,
      @JsonKey(name: "data")
      required final List<DataOfFollowerModel> followerList,
      @JsonKey(name: "total") required final int total,
      @JsonKey(name: "page") required final int page,
      @JsonKey(name: "pages") required final int pages,
      @JsonKey(name: "limit") required final int limit}) = _$FollowerModelImpl;

  factory _FollowerModel.fromJson(Map<String, dynamic> json) =
      _$FollowerModelImpl.fromJson;

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
  List<DataOfFollowerModel> get followerList;
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
  _$$FollowerModelImplCopyWith<_$FollowerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataOfFollowerModel _$DataOfFollowerModelFromJson(Map<String, dynamic> json) {
  return _DataOfFollowerModel.fromJson(json);
}

/// @nodoc
mixin _$DataOfFollowerModel {
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
  RoleInfoOfFollower get roleInfoOfFollower =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "request_id")
  dynamic get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: "isRequest")
  bool get isRequest => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollow")
  bool get isFollow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataOfFollowerModelCopyWith<DataOfFollowerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataOfFollowerModelCopyWith<$Res> {
  factory $DataOfFollowerModelCopyWith(
          DataOfFollowerModel value, $Res Function(DataOfFollowerModel) then) =
      _$DataOfFollowerModelCopyWithImpl<$Res, DataOfFollowerModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String profileImage,
      @JsonKey(name: "role_info") RoleInfoOfFollower roleInfoOfFollower,
      @JsonKey(name: "request_id") dynamic requestId,
      @JsonKey(name: "isRequest") bool isRequest,
      @JsonKey(name: "isFollow") bool isFollow});

  $RoleInfoOfFollowerCopyWith<$Res> get roleInfoOfFollower;
}

/// @nodoc
class _$DataOfFollowerModelCopyWithImpl<$Res, $Val extends DataOfFollowerModel>
    implements $DataOfFollowerModelCopyWith<$Res> {
  _$DataOfFollowerModelCopyWithImpl(this._value, this._then);

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
    Object? roleInfoOfFollower = null,
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
      roleInfoOfFollower: null == roleInfoOfFollower
          ? _value.roleInfoOfFollower
          : roleInfoOfFollower // ignore: cast_nullable_to_non_nullable
              as RoleInfoOfFollower,
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
  $RoleInfoOfFollowerCopyWith<$Res> get roleInfoOfFollower {
    return $RoleInfoOfFollowerCopyWith<$Res>(_value.roleInfoOfFollower,
        (value) {
      return _then(_value.copyWith(roleInfoOfFollower: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataOfFollowerModelImplCopyWith<$Res>
    implements $DataOfFollowerModelCopyWith<$Res> {
  factory _$$DataOfFollowerModelImplCopyWith(_$DataOfFollowerModelImpl value,
          $Res Function(_$DataOfFollowerModelImpl) then) =
      __$$DataOfFollowerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "first_name") String firstName,
      @JsonKey(name: "last_name") String lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "profile_image") String profileImage,
      @JsonKey(name: "role_info") RoleInfoOfFollower roleInfoOfFollower,
      @JsonKey(name: "request_id") dynamic requestId,
      @JsonKey(name: "isRequest") bool isRequest,
      @JsonKey(name: "isFollow") bool isFollow});

  @override
  $RoleInfoOfFollowerCopyWith<$Res> get roleInfoOfFollower;
}

/// @nodoc
class __$$DataOfFollowerModelImplCopyWithImpl<$Res>
    extends _$DataOfFollowerModelCopyWithImpl<$Res, _$DataOfFollowerModelImpl>
    implements _$$DataOfFollowerModelImplCopyWith<$Res> {
  __$$DataOfFollowerModelImplCopyWithImpl(_$DataOfFollowerModelImpl _value,
      $Res Function(_$DataOfFollowerModelImpl) _then)
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
    Object? roleInfoOfFollower = null,
    Object? requestId = freezed,
    Object? isRequest = null,
    Object? isFollow = null,
  }) {
    return _then(_$DataOfFollowerModelImpl(
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
      roleInfoOfFollower: null == roleInfoOfFollower
          ? _value.roleInfoOfFollower
          : roleInfoOfFollower // ignore: cast_nullable_to_non_nullable
              as RoleInfoOfFollower,
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
class _$DataOfFollowerModelImpl implements _DataOfFollowerModel {
  const _$DataOfFollowerModelImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "first_name") required this.firstName,
      @JsonKey(name: "last_name") required this.lastName,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "profile_image") required this.profileImage,
      @JsonKey(name: "role_info") required this.roleInfoOfFollower,
      @JsonKey(name: "request_id") this.requestId,
      @JsonKey(name: "isRequest") required this.isRequest,
      @JsonKey(name: "isFollow") required this.isFollow});

  factory _$DataOfFollowerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataOfFollowerModelImplFromJson(json);

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
  final RoleInfoOfFollower roleInfoOfFollower;
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
    return 'DataOfFollowerModel(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, profileImage: $profileImage, roleInfoOfFollower: $roleInfoOfFollower, requestId: $requestId, isRequest: $isRequest, isFollow: $isFollow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataOfFollowerModelImpl &&
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
            (identical(other.roleInfoOfFollower, roleInfoOfFollower) ||
                other.roleInfoOfFollower == roleInfoOfFollower) &&
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
      roleInfoOfFollower,
      const DeepCollectionEquality().hash(requestId),
      isRequest,
      isFollow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataOfFollowerModelImplCopyWith<_$DataOfFollowerModelImpl> get copyWith =>
      __$$DataOfFollowerModelImplCopyWithImpl<_$DataOfFollowerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataOfFollowerModelImplToJson(
      this,
    );
  }
}

abstract class _DataOfFollowerModel implements DataOfFollowerModel {
  const factory _DataOfFollowerModel(
          {@JsonKey(name: "_id") required final String id,
          @JsonKey(name: "first_name") required final String firstName,
          @JsonKey(name: "last_name") required final String lastName,
          @JsonKey(name: "fullName") final String? fullName,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "profile_image") required final String profileImage,
          @JsonKey(name: "role_info")
          required final RoleInfoOfFollower roleInfoOfFollower,
          @JsonKey(name: "request_id") final dynamic requestId,
          @JsonKey(name: "isRequest") required final bool isRequest,
          @JsonKey(name: "isFollow") required final bool isFollow}) =
      _$DataOfFollowerModelImpl;

  factory _DataOfFollowerModel.fromJson(Map<String, dynamic> json) =
      _$DataOfFollowerModelImpl.fromJson;

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
  RoleInfoOfFollower get roleInfoOfFollower;
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
  _$$DataOfFollowerModelImplCopyWith<_$DataOfFollowerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoleInfoOfFollower _$RoleInfoOfFollowerFromJson(Map<String, dynamic> json) {
  return _RoleInfoOfFollower.fromJson(json);
}

/// @nodoc
mixin _$RoleInfoOfFollower {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "roleDisplayName")
  String get roleDisplayName => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleInfoOfFollowerCopyWith<RoleInfoOfFollower> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleInfoOfFollowerCopyWith<$Res> {
  factory $RoleInfoOfFollowerCopyWith(
          RoleInfoOfFollower value, $Res Function(RoleInfoOfFollower) then) =
      _$RoleInfoOfFollowerCopyWithImpl<$Res, RoleInfoOfFollower>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "roleDisplayName") String roleDisplayName,
      @JsonKey(name: "role") String role});
}

/// @nodoc
class _$RoleInfoOfFollowerCopyWithImpl<$Res, $Val extends RoleInfoOfFollower>
    implements $RoleInfoOfFollowerCopyWith<$Res> {
  _$RoleInfoOfFollowerCopyWithImpl(this._value, this._then);

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
abstract class _$$RoleInfoOfFollowerImplCopyWith<$Res>
    implements $RoleInfoOfFollowerCopyWith<$Res> {
  factory _$$RoleInfoOfFollowerImplCopyWith(_$RoleInfoOfFollowerImpl value,
          $Res Function(_$RoleInfoOfFollowerImpl) then) =
      __$$RoleInfoOfFollowerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "roleDisplayName") String roleDisplayName,
      @JsonKey(name: "role") String role});
}

/// @nodoc
class __$$RoleInfoOfFollowerImplCopyWithImpl<$Res>
    extends _$RoleInfoOfFollowerCopyWithImpl<$Res, _$RoleInfoOfFollowerImpl>
    implements _$$RoleInfoOfFollowerImplCopyWith<$Res> {
  __$$RoleInfoOfFollowerImplCopyWithImpl(_$RoleInfoOfFollowerImpl _value,
      $Res Function(_$RoleInfoOfFollowerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleDisplayName = null,
    Object? role = null,
  }) {
    return _then(_$RoleInfoOfFollowerImpl(
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
class _$RoleInfoOfFollowerImpl implements _RoleInfoOfFollower {
  const _$RoleInfoOfFollowerImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "roleDisplayName") required this.roleDisplayName,
      @JsonKey(name: "role") required this.role});

  factory _$RoleInfoOfFollowerImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleInfoOfFollowerImplFromJson(json);

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
    return 'RoleInfoOfFollower(id: $id, roleDisplayName: $roleDisplayName, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleInfoOfFollowerImpl &&
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
  _$$RoleInfoOfFollowerImplCopyWith<_$RoleInfoOfFollowerImpl> get copyWith =>
      __$$RoleInfoOfFollowerImplCopyWithImpl<_$RoleInfoOfFollowerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleInfoOfFollowerImplToJson(
      this,
    );
  }
}

abstract class _RoleInfoOfFollower implements RoleInfoOfFollower {
  const factory _RoleInfoOfFollower(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "roleDisplayName") required final String roleDisplayName,
      @JsonKey(name: "role")
      required final String role}) = _$RoleInfoOfFollowerImpl;

  factory _RoleInfoOfFollower.fromJson(Map<String, dynamic> json) =
      _$RoleInfoOfFollowerImpl.fromJson;

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
  _$$RoleInfoOfFollowerImplCopyWith<_$RoleInfoOfFollowerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
