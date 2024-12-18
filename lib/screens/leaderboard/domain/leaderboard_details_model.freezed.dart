// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardDetailsModel _$LeaderboardDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _LeaderboardDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardDetailsModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  List<LeaderboardDetail>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "pages")
  int? get pages => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardDetailsModelCopyWith<LeaderboardDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardDetailsModelCopyWith<$Res> {
  factory $LeaderboardDetailsModelCopyWith(LeaderboardDetailsModel value,
          $Res Function(LeaderboardDetailsModel) then) =
      _$LeaderboardDetailsModelCopyWithImpl<$Res, LeaderboardDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<LeaderboardDetail>? data,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$LeaderboardDetailsModelCopyWithImpl<$Res,
        $Val extends LeaderboardDetailsModel>
    implements $LeaderboardDetailsModelCopyWith<$Res> {
  _$LeaderboardDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDetail>?,
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
abstract class _$$LeaderboardDetailsModelImplCopyWith<$Res>
    implements $LeaderboardDetailsModelCopyWith<$Res> {
  factory _$$LeaderboardDetailsModelImplCopyWith(
          _$LeaderboardDetailsModelImpl value,
          $Res Function(_$LeaderboardDetailsModelImpl) then) =
      __$$LeaderboardDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") List<LeaderboardDetail>? data,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "pages") int? pages,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$LeaderboardDetailsModelImplCopyWithImpl<$Res>
    extends _$LeaderboardDetailsModelCopyWithImpl<$Res,
        _$LeaderboardDetailsModelImpl>
    implements _$$LeaderboardDetailsModelImplCopyWith<$Res> {
  __$$LeaderboardDetailsModelImplCopyWithImpl(
      _$LeaderboardDetailsModelImpl _value,
      $Res Function(_$LeaderboardDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? data = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? pages = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$LeaderboardDetailsModelImpl(
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
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LeaderboardDetail>?,
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
class _$LeaderboardDetailsModelImpl implements _LeaderboardDetailsModel {
  const _$LeaderboardDetailsModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") final List<LeaderboardDetail>? data,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "pages") this.pages,
      @JsonKey(name: "limit") this.limit})
      : _data = data;

  factory _$LeaderboardDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  final List<LeaderboardDetail>? _data;
  @override
  @JsonKey(name: "data")
  List<LeaderboardDetail>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
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
    return 'LeaderboardDetailsModel(status: $status, type: $type, message: $message, data: $data, total: $total, page: $page, pages: $pages, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardDetailsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, type, message,
      const DeepCollectionEquality().hash(_data), total, page, pages, limit);

  /// Create a copy of LeaderboardDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardDetailsModelImplCopyWith<_$LeaderboardDetailsModelImpl>
      get copyWith => __$$LeaderboardDetailsModelImplCopyWithImpl<
          _$LeaderboardDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardDetailsModel implements LeaderboardDetailsModel {
  const factory _LeaderboardDetailsModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "message") final String? message,
          @JsonKey(name: "data") final List<LeaderboardDetail>? data,
          @JsonKey(name: "total") final int? total,
          @JsonKey(name: "page") final int? page,
          @JsonKey(name: "pages") final int? pages,
          @JsonKey(name: "limit") final int? limit}) =
      _$LeaderboardDetailsModelImpl;

  factory _LeaderboardDetailsModel.fromJson(Map<String, dynamic> json) =
      _$LeaderboardDetailsModelImpl.fromJson;

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
  List<LeaderboardDetail>? get data;
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

  /// Create a copy of LeaderboardDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardDetailsModelImplCopyWith<_$LeaderboardDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeaderboardDetail _$LeaderboardDetailFromJson(Map<String, dynamic> json) {
  return _LeaderboardDetail.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardDetail {
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
  @JsonKey(name: "location")
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "point")
  int? get point => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardDetailCopyWith<LeaderboardDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardDetailCopyWith<$Res> {
  factory $LeaderboardDetailCopyWith(
          LeaderboardDetail value, $Res Function(LeaderboardDetail) then) =
      _$LeaderboardDetailCopyWithImpl<$Res, LeaderboardDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "role_info") RoleInfo? roleInfo,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "point") int? point});

  $RoleInfoCopyWith<$Res>? get roleInfo;
}

/// @nodoc
class _$LeaderboardDetailCopyWithImpl<$Res, $Val extends LeaderboardDetail>
    implements $LeaderboardDetailCopyWith<$Res> {
  _$LeaderboardDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardDetail
  /// with the given fields replaced by the non-null parameter values.
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
    Object? location = freezed,
    Object? city = freezed,
    Object? point = freezed,
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
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of LeaderboardDetail
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$LeaderboardDetailImplCopyWith<$Res>
    implements $LeaderboardDetailCopyWith<$Res> {
  factory _$$LeaderboardDetailImplCopyWith(_$LeaderboardDetailImpl value,
          $Res Function(_$LeaderboardDetailImpl) then) =
      __$$LeaderboardDetailImplCopyWithImpl<$Res>;
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
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "point") int? point});

  @override
  $RoleInfoCopyWith<$Res>? get roleInfo;
}

/// @nodoc
class __$$LeaderboardDetailImplCopyWithImpl<$Res>
    extends _$LeaderboardDetailCopyWithImpl<$Res, _$LeaderboardDetailImpl>
    implements _$$LeaderboardDetailImplCopyWith<$Res> {
  __$$LeaderboardDetailImplCopyWithImpl(_$LeaderboardDetailImpl _value,
      $Res Function(_$LeaderboardDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaderboardDetail
  /// with the given fields replaced by the non-null parameter values.
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
    Object? location = freezed,
    Object? city = freezed,
    Object? point = freezed,
  }) {
    return _then(_$LeaderboardDetailImpl(
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
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardDetailImpl implements _LeaderboardDetail {
  const _$LeaderboardDetailImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "profile_image") this.profileImage,
      @JsonKey(name: "role_info") this.roleInfo,
      @JsonKey(name: "location") this.location,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "point") this.point});

  factory _$LeaderboardDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardDetailImplFromJson(json);

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
  @JsonKey(name: "location")
  final String? location;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "point")
  final int? point;

  @override
  String toString() {
    return 'LeaderboardDetail(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, profileImage: $profileImage, roleInfo: $roleInfo, location: $location, city: $city, point: $point)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardDetailImpl &&
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
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.point, point) || other.point == point));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      fullName, email, profileImage, roleInfo, location, city, point);

  /// Create a copy of LeaderboardDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardDetailImplCopyWith<_$LeaderboardDetailImpl> get copyWith =>
      __$$LeaderboardDetailImplCopyWithImpl<_$LeaderboardDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardDetailImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardDetail implements LeaderboardDetail {
  const factory _LeaderboardDetail(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "fullName") final String? fullName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "profile_image") final String? profileImage,
      @JsonKey(name: "role_info") final RoleInfo? roleInfo,
      @JsonKey(name: "location") final String? location,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "point") final int? point}) = _$LeaderboardDetailImpl;

  factory _LeaderboardDetail.fromJson(Map<String, dynamic> json) =
      _$LeaderboardDetailImpl.fromJson;

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
  @JsonKey(name: "location")
  String? get location;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "point")
  int? get point;

  /// Create a copy of LeaderboardDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardDetailImplCopyWith<_$LeaderboardDetailImpl> get copyWith =>
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

  /// Serializes this RoleInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of RoleInfo
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of RoleInfo
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, roleDisplayName, role);

  /// Create a copy of RoleInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of RoleInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleInfoImplCopyWith<_$RoleInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
