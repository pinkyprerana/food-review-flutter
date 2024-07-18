// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowRequestModel _$FollowRequestModelFromJson(Map<String, dynamic> json) {
  return _FollowRequestModel.fromJson(json);
}

/// @nodoc
mixin _$FollowRequestModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<FollowRequest>? get requestsList => throw _privateConstructorUsedError;
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
  $FollowRequestModelCopyWith<FollowRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowRequestModelCopyWith<$Res> {
  factory $FollowRequestModelCopyWith(
          FollowRequestModel value, $Res Function(FollowRequestModel) then) =
      _$FollowRequestModelCopyWithImpl<$Res, FollowRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<FollowRequest>? requestsList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$FollowRequestModelCopyWithImpl<$Res, $Val extends FollowRequestModel>
    implements $FollowRequestModelCopyWith<$Res> {
  _$FollowRequestModelCopyWithImpl(this._value, this._then);

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
    Object? requestsList = freezed,
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
      requestsList: freezed == requestsList
          ? _value.requestsList
          : requestsList // ignore: cast_nullable_to_non_nullable
              as List<FollowRequest>?,
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
abstract class _$$FollowRequestModelImplCopyWith<$Res>
    implements $FollowRequestModelCopyWith<$Res> {
  factory _$$FollowRequestModelImplCopyWith(_$FollowRequestModelImpl value,
          $Res Function(_$FollowRequestModelImpl) then) =
      __$$FollowRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<FollowRequest>? requestsList,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$FollowRequestModelImplCopyWithImpl<$Res>
    extends _$FollowRequestModelCopyWithImpl<$Res, _$FollowRequestModelImpl>
    implements _$$FollowRequestModelImplCopyWith<$Res> {
  __$$FollowRequestModelImplCopyWithImpl(_$FollowRequestModelImpl _value,
      $Res Function(_$FollowRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? requestsList = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$FollowRequestModelImpl(
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
      requestsList: freezed == requestsList
          ? _value._requestsList
          : requestsList // ignore: cast_nullable_to_non_nullable
              as List<FollowRequest>?,
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
class _$FollowRequestModelImpl implements _FollowRequestModel {
  const _$FollowRequestModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<FollowRequest>? requestsList,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit})
      : _requestsList = requestsList;

  factory _$FollowRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<FollowRequest>? _requestsList;
  @override
  @JsonKey(name: "data")
  List<FollowRequest>? get requestsList {
    final value = _requestsList;
    if (value == null) return null;
    if (_requestsList is EqualUnmodifiableListView) return _requestsList;
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
    return 'FollowRequestModel(status: $status, type: $type, message: $message, requestsList: $requestsList, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowRequestModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._requestsList, _requestsList) &&
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
      const DeepCollectionEquality().hash(_requestsList),
      total,
      page,
      pages,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowRequestModelImplCopyWith<_$FollowRequestModelImpl> get copyWith =>
      __$$FollowRequestModelImplCopyWithImpl<_$FollowRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowRequestModelImplToJson(
      this,
    );
  }
}

abstract class _FollowRequestModel implements FollowRequestModel {
  const factory _FollowRequestModel(
      {@JsonKey(name: "status") final int? status,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final List<FollowRequest>? requestsList,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "pages") final int? pages,
      @JsonKey(name: "limit") final int? limit}) = _$FollowRequestModelImpl;

  factory _FollowRequestModel.fromJson(Map<String, dynamic> json) =
      _$FollowRequestModelImpl.fromJson;

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
  List<FollowRequest>? get requestsList;
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
  _$$FollowRequestModelImplCopyWith<_$FollowRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) {
  return _FollowRequest.fromJson(json);
}

/// @nodoc
mixin _$FollowRequest {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "role_info")
  RoleInfo? get roleInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "request_id")
  String? get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: "isRequest")
  bool? get isRequest => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollow")
  bool? get isFollow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowRequestCopyWith<FollowRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowRequestCopyWith<$Res> {
  factory $FollowRequestCopyWith(
          FollowRequest value, $Res Function(FollowRequest) then) =
      _$FollowRequestCopyWithImpl<$Res, FollowRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "role_info") RoleInfo? roleInfo,
      @JsonKey(name: "request_id") String? requestId,
      @JsonKey(name: "isRequest") bool? isRequest,
      @JsonKey(name: "isFollow") bool? isFollow});

  $RoleInfoCopyWith<$Res>? get roleInfo;
}

/// @nodoc
class _$FollowRequestCopyWithImpl<$Res, $Val extends FollowRequest>
    implements $FollowRequestCopyWith<$Res> {
  _$FollowRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? profileImage = freezed,
    Object? roleInfo = freezed,
    Object? requestId = freezed,
    Object? isRequest = freezed,
    Object? isFollow = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
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
      roleInfo: freezed == roleInfo
          ? _value.roleInfo
          : roleInfo // ignore: cast_nullable_to_non_nullable
              as RoleInfo?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequest: freezed == isRequest
          ? _value.isRequest
          : isRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollow: freezed == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleInfoCopyWith<$Res>? get roleInfo {
    if (_value.roleInfo == null) {
      return null;
    }

    return $RoleInfoCopyWith<$Res>(_value.roleInfo!, (value) {
      return _then(_value.copyWith(roleInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowRequestImplCopyWith<$Res>
    implements $FollowRequestCopyWith<$Res> {
  factory _$$FollowRequestImplCopyWith(
          _$FollowRequestImpl value, $Res Function(_$FollowRequestImpl) then) =
      __$$FollowRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "role_info") RoleInfo? roleInfo,
      @JsonKey(name: "request_id") String? requestId,
      @JsonKey(name: "isRequest") bool? isRequest,
      @JsonKey(name: "isFollow") bool? isFollow});

  @override
  $RoleInfoCopyWith<$Res>? get roleInfo;
}

/// @nodoc
class __$$FollowRequestImplCopyWithImpl<$Res>
    extends _$FollowRequestCopyWithImpl<$Res, _$FollowRequestImpl>
    implements _$$FollowRequestImplCopyWith<$Res> {
  __$$FollowRequestImplCopyWithImpl(
      _$FollowRequestImpl _value, $Res Function(_$FollowRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? profileImage = freezed,
    Object? roleInfo = freezed,
    Object? requestId = freezed,
    Object? isRequest = freezed,
    Object? isFollow = freezed,
  }) {
    return _then(_$FollowRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
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
      roleInfo: freezed == roleInfo
          ? _value.roleInfo
          : roleInfo // ignore: cast_nullable_to_non_nullable
              as RoleInfo?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequest: freezed == isRequest
          ? _value.isRequest
          : isRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollow: freezed == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowRequestImpl implements _FollowRequest {
  const _$FollowRequestImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "profile_image") this.profileImage,
      @JsonKey(name: "role_info") this.roleInfo,
      @JsonKey(name: "request_id") this.requestId,
      @JsonKey(name: "isRequest") this.isRequest,
      @JsonKey(name: "isFollow") this.isFollow});

  factory _$FollowRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowRequestImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
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
  @JsonKey(name: "role_info")
  final RoleInfo? roleInfo;
  @override
  @JsonKey(name: "request_id")
  final String? requestId;
  @override
  @JsonKey(name: "isRequest")
  final bool? isRequest;
  @override
  @JsonKey(name: "isFollow")
  final bool? isFollow;

  @override
  String toString() {
    return 'FollowRequest(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, profileImage: $profileImage, roleInfo: $roleInfo, requestId: $requestId, isRequest: $isRequest, isFollow: $isFollow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowRequestImpl &&
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
            (identical(other.roleInfo, roleInfo) ||
                other.roleInfo == roleInfo) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.isRequest, isRequest) ||
                other.isRequest == isRequest) &&
            (identical(other.isFollow, isFollow) ||
                other.isFollow == isFollow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      fullName, email, profileImage, roleInfo, requestId, isRequest, isFollow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowRequestImplCopyWith<_$FollowRequestImpl> get copyWith =>
      __$$FollowRequestImplCopyWithImpl<_$FollowRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowRequestImplToJson(
      this,
    );
  }
}

abstract class _FollowRequest implements FollowRequest {
  const factory _FollowRequest(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "fullName") final String? fullName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "profile_image") final String? profileImage,
      @JsonKey(name: "role_info") final RoleInfo? roleInfo,
      @JsonKey(name: "request_id") final String? requestId,
      @JsonKey(name: "isRequest") final bool? isRequest,
      @JsonKey(name: "isFollow") final bool? isFollow}) = _$FollowRequestImpl;

  factory _FollowRequest.fromJson(Map<String, dynamic> json) =
      _$FollowRequestImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
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
  @JsonKey(name: "role_info")
  RoleInfo? get roleInfo;
  @override
  @JsonKey(name: "request_id")
  String? get requestId;
  @override
  @JsonKey(name: "isRequest")
  bool? get isRequest;
  @override
  @JsonKey(name: "isFollow")
  bool? get isFollow;
  @override
  @JsonKey(ignore: true)
  _$$FollowRequestImplCopyWith<_$FollowRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoleInfo _$RoleInfoFromJson(Map<String, dynamic> json) {
  return _RoleInfo.fromJson(json);
}

/// @nodoc
mixin _$RoleInfo {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "roleDisplayName")
  String? get roleDisplayName => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleInfoCopyWith<RoleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleInfoCopyWith<$Res> {
  factory $RoleInfoCopyWith(RoleInfo value, $Res Function(RoleInfo) then) =
      _$RoleInfoCopyWithImpl<$Res, RoleInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "roleDisplayName") String? roleDisplayName,
      @JsonKey(name: "role") String? role});
}

/// @nodoc
class _$RoleInfoCopyWithImpl<$Res, $Val extends RoleInfo>
    implements $RoleInfoCopyWith<$Res> {
  _$RoleInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roleDisplayName = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      roleDisplayName: freezed == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleInfoImplCopyWith<$Res>
    implements $RoleInfoCopyWith<$Res> {
  factory _$$RoleInfoImplCopyWith(
          _$RoleInfoImpl value, $Res Function(_$RoleInfoImpl) then) =
      __$$RoleInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "roleDisplayName") String? roleDisplayName,
      @JsonKey(name: "role") String? role});
}

/// @nodoc
class __$$RoleInfoImplCopyWithImpl<$Res>
    extends _$RoleInfoCopyWithImpl<$Res, _$RoleInfoImpl>
    implements _$$RoleInfoImplCopyWith<$Res> {
  __$$RoleInfoImplCopyWithImpl(
      _$RoleInfoImpl _value, $Res Function(_$RoleInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roleDisplayName = freezed,
    Object? role = freezed,
  }) {
    return _then(_$RoleInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      roleDisplayName: freezed == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleInfoImpl implements _RoleInfo {
  const _$RoleInfoImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "roleDisplayName") this.roleDisplayName,
      @JsonKey(name: "role") this.role});

  factory _$RoleInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleInfoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "roleDisplayName")
  final String? roleDisplayName;
  @override
  @JsonKey(name: "role")
  final String? role;

  @override
  String toString() {
    return 'RoleInfo(id: $id, roleDisplayName: $roleDisplayName, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleInfoImpl &&
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
  _$$RoleInfoImplCopyWith<_$RoleInfoImpl> get copyWith =>
      __$$RoleInfoImplCopyWithImpl<_$RoleInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleInfoImplToJson(
      this,
    );
  }
}

abstract class _RoleInfo implements RoleInfo {
  const factory _RoleInfo(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "roleDisplayName") final String? roleDisplayName,
      @JsonKey(name: "role") final String? role}) = _$RoleInfoImpl;

  factory _RoleInfo.fromJson(Map<String, dynamic> json) =
      _$RoleInfoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "roleDisplayName")
  String? get roleDisplayName;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$RoleInfoImplCopyWith<_$RoleInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
