// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  ProfileDetails? get profileDetails => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") ProfileDetails? profileDetails,
      @JsonKey(name: "token") String? token});

  $ProfileDetailsCopyWith<$Res>? get profileDetails;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

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
    Object? profileDetails = freezed,
    Object? token = freezed,
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
      profileDetails: freezed == profileDetails
          ? _value.profileDetails
          : profileDetails // ignore: cast_nullable_to_non_nullable
              as ProfileDetails?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileDetailsCopyWith<$Res>? get profileDetails {
    if (_value.profileDetails == null) {
      return null;
    }

    return $ProfileDetailsCopyWith<$Res>(_value.profileDetails!, (value) {
      return _then(_value.copyWith(profileDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "data") ProfileDetails? profileDetails,
      @JsonKey(name: "token") String? token});

  @override
  $ProfileDetailsCopyWith<$Res>? get profileDetails;
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? type = freezed,
    Object? message = freezed,
    Object? profileDetails = freezed,
    Object? token = freezed,
  }) {
    return _then(_$UserProfileModelImpl(
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
      profileDetails: freezed == profileDetails
          ? _value.profileDetails
          : profileDetails // ignore: cast_nullable_to_non_nullable
              as ProfileDetails?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  const _$UserProfileModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "data") this.profileDetails,
      @JsonKey(name: "token") this.token});

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "data")
  final ProfileDetails? profileDetails;
  @override
  @JsonKey(name: "token")
  final String? token;

  @override
  String toString() {
    return 'UserProfileModel(status: $status, type: $type, message: $message, profileDetails: $profileDetails, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.profileDetails, profileDetails) ||
                other.profileDetails == profileDetails) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, type, message, profileDetails, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  const factory _UserProfileModel(
      {@JsonKey(name: "status") final int? status,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "data") final ProfileDetails? profileDetails,
      @JsonKey(name: "token") final String? token}) = _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

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
  ProfileDetails? get profileDetails;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileDetails _$ProfileDetailsFromJson(Map<String, dynamic> json) {
  return _ProfileDetails.fromJson(json);
}

/// @nodoc
mixin _$ProfileDetails {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "fullName")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  Role? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "bio")
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "registerType")
  String? get registerType => throw _privateConstructorUsedError;
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "lng")
  String? get lng => throw _privateConstructorUsedError;
  @JsonKey(name: "lat")
  String? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: "geo_loc")
  GeoLoc? get geoLoc => throw _privateConstructorUsedError;
  @JsonKey(name: "otpExpireTime")
  dynamic get otpExpireTime => throw _privateConstructorUsedError;
  @JsonKey(name: "isOtpVerified")
  bool? get isOtpVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "isVerified")
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "isOnBoarding")
  bool? get isOnBoarding => throw _privateConstructorUsedError;
  @JsonKey(name: "preference")
  List<dynamic>? get preference => throw _privateConstructorUsedError;
  @JsonKey(name: "socialAccount")
  List<dynamic>? get socialAccount => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "banner_image")
  String? get bannerImage => throw _privateConstructorUsedError;
  @JsonKey(name: "preferenceInfo")
  List<dynamic>? get preferenceInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollowing")
  bool? get isFollowing => throw _privateConstructorUsedError;
  @JsonKey(name: "isFollowingRequest")
  bool? get isFollowingRequest => throw _privateConstructorUsedError;
  @JsonKey(name: "stats")
  Stats? get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDetailsCopyWith<ProfileDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDetailsCopyWith<$Res> {
  factory $ProfileDetailsCopyWith(
          ProfileDetails value, $Res Function(ProfileDetails) then) =
      _$ProfileDetailsCopyWithImpl<$Res, ProfileDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "role") Role? role,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "bio") String? bio,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "registerType") String? registerType,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "lng") String? lng,
      @JsonKey(name: "lat") String? lat,
      @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
      @JsonKey(name: "otpExpireTime") dynamic otpExpireTime,
      @JsonKey(name: "isOtpVerified") bool? isOtpVerified,
      @JsonKey(name: "isVerified") bool? isVerified,
      @JsonKey(name: "isOnBoarding") bool? isOnBoarding,
      @JsonKey(name: "preference") List<dynamic>? preference,
      @JsonKey(name: "socialAccount") List<dynamic>? socialAccount,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "banner_image") String? bannerImage,
      @JsonKey(name: "preferenceInfo") List<dynamic>? preferenceInfo,
      @JsonKey(name: "isFollowing") bool? isFollowing,
      @JsonKey(name: "isFollowingRequest") bool? isFollowingRequest,
      @JsonKey(name: "stats") Stats? stats});

  $RoleCopyWith<$Res>? get role;
  $GeoLocCopyWith<$Res>? get geoLoc;
  $StatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$ProfileDetailsCopyWithImpl<$Res, $Val extends ProfileDetails>
    implements $ProfileDetailsCopyWith<$Res> {
  _$ProfileDetailsCopyWithImpl(this._value, this._then);

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
    Object? role = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? bio = freezed,
    Object? city = freezed,
    Object? profileImage = freezed,
    Object? registerType = freezed,
    Object? otp = freezed,
    Object? location = freezed,
    Object? lng = freezed,
    Object? lat = freezed,
    Object? geoLoc = freezed,
    Object? otpExpireTime = freezed,
    Object? isOtpVerified = freezed,
    Object? isVerified = freezed,
    Object? isOnBoarding = freezed,
    Object? preference = freezed,
    Object? socialAccount = freezed,
    Object? createdAt = freezed,
    Object? bannerImage = freezed,
    Object? preferenceInfo = freezed,
    Object? isFollowing = freezed,
    Object? isFollowingRequest = freezed,
    Object? stats = freezed,
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
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      geoLoc: freezed == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc?,
      otpExpireTime: freezed == otpExpireTime
          ? _value.otpExpireTime
          : otpExpireTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isOtpVerified: freezed == isOtpVerified
          ? _value.isOtpVerified
          : isOtpVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnBoarding: freezed == isOnBoarding
          ? _value.isOnBoarding
          : isOnBoarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      preference: freezed == preference
          ? _value.preference
          : preference // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      socialAccount: freezed == socialAccount
          ? _value.socialAccount
          : socialAccount // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      preferenceInfo: freezed == preferenceInfo
          ? _value.preferenceInfo
          : preferenceInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowingRequest: freezed == isFollowingRequest
          ? _value.isFollowingRequest
          : isFollowingRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $RoleCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
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
  $StatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $StatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDetailsImplCopyWith<$Res>
    implements $ProfileDetailsCopyWith<$Res> {
  factory _$$ProfileDetailsImplCopyWith(_$ProfileDetailsImpl value,
          $Res Function(_$ProfileDetailsImpl) then) =
      __$$ProfileDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "fullName") String? fullName,
      @JsonKey(name: "role") Role? role,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "bio") String? bio,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "registerType") String? registerType,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "lng") String? lng,
      @JsonKey(name: "lat") String? lat,
      @JsonKey(name: "geo_loc") GeoLoc? geoLoc,
      @JsonKey(name: "otpExpireTime") dynamic otpExpireTime,
      @JsonKey(name: "isOtpVerified") bool? isOtpVerified,
      @JsonKey(name: "isVerified") bool? isVerified,
      @JsonKey(name: "isOnBoarding") bool? isOnBoarding,
      @JsonKey(name: "preference") List<dynamic>? preference,
      @JsonKey(name: "socialAccount") List<dynamic>? socialAccount,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "banner_image") String? bannerImage,
      @JsonKey(name: "preferenceInfo") List<dynamic>? preferenceInfo,
      @JsonKey(name: "isFollowing") bool? isFollowing,
      @JsonKey(name: "isFollowingRequest") bool? isFollowingRequest,
      @JsonKey(name: "stats") Stats? stats});

  @override
  $RoleCopyWith<$Res>? get role;
  @override
  $GeoLocCopyWith<$Res>? get geoLoc;
  @override
  $StatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$ProfileDetailsImplCopyWithImpl<$Res>
    extends _$ProfileDetailsCopyWithImpl<$Res, _$ProfileDetailsImpl>
    implements _$$ProfileDetailsImplCopyWith<$Res> {
  __$$ProfileDetailsImplCopyWithImpl(
      _$ProfileDetailsImpl _value, $Res Function(_$ProfileDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? bio = freezed,
    Object? city = freezed,
    Object? profileImage = freezed,
    Object? registerType = freezed,
    Object? otp = freezed,
    Object? location = freezed,
    Object? lng = freezed,
    Object? lat = freezed,
    Object? geoLoc = freezed,
    Object? otpExpireTime = freezed,
    Object? isOtpVerified = freezed,
    Object? isVerified = freezed,
    Object? isOnBoarding = freezed,
    Object? preference = freezed,
    Object? socialAccount = freezed,
    Object? createdAt = freezed,
    Object? bannerImage = freezed,
    Object? preferenceInfo = freezed,
    Object? isFollowing = freezed,
    Object? isFollowingRequest = freezed,
    Object? stats = freezed,
  }) {
    return _then(_$ProfileDetailsImpl(
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
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      registerType: freezed == registerType
          ? _value.registerType
          : registerType // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      geoLoc: freezed == geoLoc
          ? _value.geoLoc
          : geoLoc // ignore: cast_nullable_to_non_nullable
              as GeoLoc?,
      otpExpireTime: freezed == otpExpireTime
          ? _value.otpExpireTime
          : otpExpireTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isOtpVerified: freezed == isOtpVerified
          ? _value.isOtpVerified
          : isOtpVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnBoarding: freezed == isOnBoarding
          ? _value.isOnBoarding
          : isOnBoarding // ignore: cast_nullable_to_non_nullable
              as bool?,
      preference: freezed == preference
          ? _value._preference
          : preference // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      socialAccount: freezed == socialAccount
          ? _value._socialAccount
          : socialAccount // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bannerImage: freezed == bannerImage
          ? _value.bannerImage
          : bannerImage // ignore: cast_nullable_to_non_nullable
              as String?,
      preferenceInfo: freezed == preferenceInfo
          ? _value._preferenceInfo
          : preferenceInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowingRequest: freezed == isFollowingRequest
          ? _value.isFollowingRequest
          : isFollowingRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDetailsImpl implements _ProfileDetails {
  const _$ProfileDetailsImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "fullName") this.fullName,
      @JsonKey(name: "role") this.role,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "bio") this.bio,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "profile_image") this.profileImage,
      @JsonKey(name: "registerType") this.registerType,
      @JsonKey(name: "otp") this.otp,
      @JsonKey(name: "location") this.location,
      @JsonKey(name: "lng") this.lng,
      @JsonKey(name: "lat") this.lat,
      @JsonKey(name: "geo_loc") this.geoLoc,
      @JsonKey(name: "otpExpireTime") this.otpExpireTime,
      @JsonKey(name: "isOtpVerified") this.isOtpVerified,
      @JsonKey(name: "isVerified") this.isVerified,
      @JsonKey(name: "isOnBoarding") this.isOnBoarding,
      @JsonKey(name: "preference") final List<dynamic>? preference,
      @JsonKey(name: "socialAccount") final List<dynamic>? socialAccount,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "banner_image") this.bannerImage,
      @JsonKey(name: "preferenceInfo") final List<dynamic>? preferenceInfo,
      @JsonKey(name: "isFollowing") this.isFollowing,
      @JsonKey(name: "isFollowingRequest") this.isFollowingRequest,
      @JsonKey(name: "stats") this.stats})
      : _preference = preference,
        _socialAccount = socialAccount,
        _preferenceInfo = preferenceInfo;

  factory _$ProfileDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDetailsImplFromJson(json);

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
  @JsonKey(name: "role")
  final Role? role;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "bio")
  final String? bio;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  @JsonKey(name: "registerType")
  final String? registerType;
  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "location")
  final String? location;
  @override
  @JsonKey(name: "lng")
  final String? lng;
  @override
  @JsonKey(name: "lat")
  final String? lat;
  @override
  @JsonKey(name: "geo_loc")
  final GeoLoc? geoLoc;
  @override
  @JsonKey(name: "otpExpireTime")
  final dynamic otpExpireTime;
  @override
  @JsonKey(name: "isOtpVerified")
  final bool? isOtpVerified;
  @override
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @override
  @JsonKey(name: "isOnBoarding")
  final bool? isOnBoarding;
  final List<dynamic>? _preference;
  @override
  @JsonKey(name: "preference")
  List<dynamic>? get preference {
    final value = _preference;
    if (value == null) return null;
    if (_preference is EqualUnmodifiableListView) return _preference;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _socialAccount;
  @override
  @JsonKey(name: "socialAccount")
  List<dynamic>? get socialAccount {
    final value = _socialAccount;
    if (value == null) return null;
    if (_socialAccount is EqualUnmodifiableListView) return _socialAccount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "banner_image")
  final String? bannerImage;
  final List<dynamic>? _preferenceInfo;
  @override
  @JsonKey(name: "preferenceInfo")
  List<dynamic>? get preferenceInfo {
    final value = _preferenceInfo;
    if (value == null) return null;
    if (_preferenceInfo is EqualUnmodifiableListView) return _preferenceInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "isFollowing")
  final bool? isFollowing;
  @override
  @JsonKey(name: "isFollowingRequest")
  final bool? isFollowingRequest;
  @override
  @JsonKey(name: "stats")
  final Stats? stats;

  @override
  String toString() {
    return 'ProfileDetails(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, role: $role, phone: $phone, email: $email, bio: $bio, city: $city, profileImage: $profileImage, registerType: $registerType, otp: $otp, location: $location, lng: $lng, lat: $lat, geoLoc: $geoLoc, otpExpireTime: $otpExpireTime, isOtpVerified: $isOtpVerified, isVerified: $isVerified, isOnBoarding: $isOnBoarding, preference: $preference, socialAccount: $socialAccount, createdAt: $createdAt, bannerImage: $bannerImage, preferenceInfo: $preferenceInfo, isFollowing: $isFollowing, isFollowingRequest: $isFollowingRequest, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.registerType, registerType) ||
                other.registerType == registerType) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.geoLoc, geoLoc) || other.geoLoc == geoLoc) &&
            const DeepCollectionEquality()
                .equals(other.otpExpireTime, otpExpireTime) &&
            (identical(other.isOtpVerified, isOtpVerified) ||
                other.isOtpVerified == isOtpVerified) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isOnBoarding, isOnBoarding) ||
                other.isOnBoarding == isOnBoarding) &&
            const DeepCollectionEquality()
                .equals(other._preference, _preference) &&
            const DeepCollectionEquality()
                .equals(other._socialAccount, _socialAccount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bannerImage, bannerImage) ||
                other.bannerImage == bannerImage) &&
            const DeepCollectionEquality()
                .equals(other._preferenceInfo, _preferenceInfo) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isFollowingRequest, isFollowingRequest) ||
                other.isFollowingRequest == isFollowingRequest) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        fullName,
        role,
        phone,
        email,
        bio,
        city,
        profileImage,
        registerType,
        otp,
        location,
        lng,
        lat,
        geoLoc,
        const DeepCollectionEquality().hash(otpExpireTime),
        isOtpVerified,
        isVerified,
        isOnBoarding,
        const DeepCollectionEquality().hash(_preference),
        const DeepCollectionEquality().hash(_socialAccount),
        createdAt,
        bannerImage,
        const DeepCollectionEquality().hash(_preferenceInfo),
        isFollowing,
        isFollowingRequest,
        stats
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDetailsImplCopyWith<_$ProfileDetailsImpl> get copyWith =>
      __$$ProfileDetailsImplCopyWithImpl<_$ProfileDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDetailsImplToJson(
      this,
    );
  }
}

abstract class _ProfileDetails implements ProfileDetails {
  const factory _ProfileDetails(
      {@JsonKey(name: "_id") final String? id,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "fullName") final String? fullName,
      @JsonKey(name: "role") final Role? role,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "bio") final String? bio,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "profile_image") final String? profileImage,
      @JsonKey(name: "registerType") final String? registerType,
      @JsonKey(name: "otp") final String? otp,
      @JsonKey(name: "location") final String? location,
      @JsonKey(name: "lng") final String? lng,
      @JsonKey(name: "lat") final String? lat,
      @JsonKey(name: "geo_loc") final GeoLoc? geoLoc,
      @JsonKey(name: "otpExpireTime") final dynamic otpExpireTime,
      @JsonKey(name: "isOtpVerified") final bool? isOtpVerified,
      @JsonKey(name: "isVerified") final bool? isVerified,
      @JsonKey(name: "isOnBoarding") final bool? isOnBoarding,
      @JsonKey(name: "preference") final List<dynamic>? preference,
      @JsonKey(name: "socialAccount") final List<dynamic>? socialAccount,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "banner_image") final String? bannerImage,
      @JsonKey(name: "preferenceInfo") final List<dynamic>? preferenceInfo,
      @JsonKey(name: "isFollowing") final bool? isFollowing,
      @JsonKey(name: "isFollowingRequest") final bool? isFollowingRequest,
      @JsonKey(name: "stats") final Stats? stats}) = _$ProfileDetailsImpl;

  factory _ProfileDetails.fromJson(Map<String, dynamic> json) =
      _$ProfileDetailsImpl.fromJson;

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
  @JsonKey(name: "role")
  Role? get role;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "bio")
  String? get bio;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  @JsonKey(name: "registerType")
  String? get registerType;
  @override
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "location")
  String? get location;
  @override
  @JsonKey(name: "lng")
  String? get lng;
  @override
  @JsonKey(name: "lat")
  String? get lat;
  @override
  @JsonKey(name: "geo_loc")
  GeoLoc? get geoLoc;
  @override
  @JsonKey(name: "otpExpireTime")
  dynamic get otpExpireTime;
  @override
  @JsonKey(name: "isOtpVerified")
  bool? get isOtpVerified;
  @override
  @JsonKey(name: "isVerified")
  bool? get isVerified;
  @override
  @JsonKey(name: "isOnBoarding")
  bool? get isOnBoarding;
  @override
  @JsonKey(name: "preference")
  List<dynamic>? get preference;
  @override
  @JsonKey(name: "socialAccount")
  List<dynamic>? get socialAccount;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "banner_image")
  String? get bannerImage;
  @override
  @JsonKey(name: "preferenceInfo")
  List<dynamic>? get preferenceInfo;
  @override
  @JsonKey(name: "isFollowing")
  bool? get isFollowing;
  @override
  @JsonKey(name: "isFollowingRequest")
  bool? get isFollowingRequest;
  @override
  @JsonKey(name: "stats")
  Stats? get stats;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDetailsImplCopyWith<_$ProfileDetailsImpl> get copyWith =>
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

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "roleDisplayName")
  String? get roleDisplayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "roleDisplayName") String? roleDisplayName});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? roleDisplayName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleDisplayName: freezed == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleImplCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$RoleImplCopyWith(
          _$RoleImpl value, $Res Function(_$RoleImpl) then) =
      __$$RoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "roleDisplayName") String? roleDisplayName});
}

/// @nodoc
class __$$RoleImplCopyWithImpl<$Res>
    extends _$RoleCopyWithImpl<$Res, _$RoleImpl>
    implements _$$RoleImplCopyWith<$Res> {
  __$$RoleImplCopyWithImpl(_$RoleImpl _value, $Res Function(_$RoleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? role = freezed,
    Object? roleDisplayName = freezed,
  }) {
    return _then(_$RoleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      roleDisplayName: freezed == roleDisplayName
          ? _value.roleDisplayName
          : roleDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleImpl implements _Role {
  const _$RoleImpl(
      {@JsonKey(name: "_id") this.id,
      @JsonKey(name: "role") this.role,
      @JsonKey(name: "roleDisplayName") this.roleDisplayName});

  factory _$RoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(name: "role")
  final String? role;
  @override
  @JsonKey(name: "roleDisplayName")
  final String? roleDisplayName;

  @override
  String toString() {
    return 'Role(id: $id, role: $role, roleDisplayName: $roleDisplayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleDisplayName, roleDisplayName) ||
                other.roleDisplayName == roleDisplayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, role, roleDisplayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      __$$RoleImplCopyWithImpl<_$RoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleImplToJson(
      this,
    );
  }
}

abstract class _Role implements Role {
  const factory _Role(
          {@JsonKey(name: "_id") final String? id,
          @JsonKey(name: "role") final String? role,
          @JsonKey(name: "roleDisplayName") final String? roleDisplayName}) =
      _$RoleImpl;

  factory _Role.fromJson(Map<String, dynamic> json) = _$RoleImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(name: "roleDisplayName")
  String? get roleDisplayName;
  @override
  @JsonKey(ignore: true)
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  @JsonKey(name: "followingCount")
  int? get followingCount => throw _privateConstructorUsedError;
  @JsonKey(name: "followerCount")
  int? get followerCount => throw _privateConstructorUsedError;
  @JsonKey(name: "postCount")
  int? get postCount => throw _privateConstructorUsedError;
  @JsonKey(name: "savePostCount")
  int? get savePostCount => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewedRestaurantsCount")
  int? get reviewedRestaurantsCount => throw _privateConstructorUsedError;
  @JsonKey(name: "savedRestaurantsCount")
  int? get savedRestaurantsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {@JsonKey(name: "followingCount") int? followingCount,
      @JsonKey(name: "followerCount") int? followerCount,
      @JsonKey(name: "postCount") int? postCount,
      @JsonKey(name: "savePostCount") int? savePostCount,
      @JsonKey(name: "reviewedRestaurantsCount") int? reviewedRestaurantsCount,
      @JsonKey(name: "savedRestaurantsCount") int? savedRestaurantsCount});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingCount = freezed,
    Object? followerCount = freezed,
    Object? postCount = freezed,
    Object? savePostCount = freezed,
    Object? reviewedRestaurantsCount = freezed,
    Object? savedRestaurantsCount = freezed,
  }) {
    return _then(_value.copyWith(
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      postCount: freezed == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int?,
      savePostCount: freezed == savePostCount
          ? _value.savePostCount
          : savePostCount // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewedRestaurantsCount: freezed == reviewedRestaurantsCount
          ? _value.reviewedRestaurantsCount
          : reviewedRestaurantsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      savedRestaurantsCount: freezed == savedRestaurantsCount
          ? _value.savedRestaurantsCount
          : savedRestaurantsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsImplCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$StatsImplCopyWith(
          _$StatsImpl value, $Res Function(_$StatsImpl) then) =
      __$$StatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "followingCount") int? followingCount,
      @JsonKey(name: "followerCount") int? followerCount,
      @JsonKey(name: "postCount") int? postCount,
      @JsonKey(name: "savePostCount") int? savePostCount,
      @JsonKey(name: "reviewedRestaurantsCount") int? reviewedRestaurantsCount,
      @JsonKey(name: "savedRestaurantsCount") int? savedRestaurantsCount});
}

/// @nodoc
class __$$StatsImplCopyWithImpl<$Res>
    extends _$StatsCopyWithImpl<$Res, _$StatsImpl>
    implements _$$StatsImplCopyWith<$Res> {
  __$$StatsImplCopyWithImpl(
      _$StatsImpl _value, $Res Function(_$StatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followingCount = freezed,
    Object? followerCount = freezed,
    Object? postCount = freezed,
    Object? savePostCount = freezed,
    Object? reviewedRestaurantsCount = freezed,
    Object? savedRestaurantsCount = freezed,
  }) {
    return _then(_$StatsImpl(
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followerCount: freezed == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      postCount: freezed == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int?,
      savePostCount: freezed == savePostCount
          ? _value.savePostCount
          : savePostCount // ignore: cast_nullable_to_non_nullable
              as int?,
      reviewedRestaurantsCount: freezed == reviewedRestaurantsCount
          ? _value.reviewedRestaurantsCount
          : reviewedRestaurantsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      savedRestaurantsCount: freezed == savedRestaurantsCount
          ? _value.savedRestaurantsCount
          : savedRestaurantsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsImpl implements _Stats {
  const _$StatsImpl(
      {@JsonKey(name: "followingCount") this.followingCount,
      @JsonKey(name: "followerCount") this.followerCount,
      @JsonKey(name: "postCount") this.postCount,
      @JsonKey(name: "savePostCount") this.savePostCount,
      @JsonKey(name: "reviewedRestaurantsCount") this.reviewedRestaurantsCount,
      @JsonKey(name: "savedRestaurantsCount") this.savedRestaurantsCount});

  factory _$StatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsImplFromJson(json);

  @override
  @JsonKey(name: "followingCount")
  final int? followingCount;
  @override
  @JsonKey(name: "followerCount")
  final int? followerCount;
  @override
  @JsonKey(name: "postCount")
  final int? postCount;
  @override
  @JsonKey(name: "savePostCount")
  final int? savePostCount;
  @override
  @JsonKey(name: "reviewedRestaurantsCount")
  final int? reviewedRestaurantsCount;
  @override
  @JsonKey(name: "savedRestaurantsCount")
  final int? savedRestaurantsCount;

  @override
  String toString() {
    return 'Stats(followingCount: $followingCount, followerCount: $followerCount, postCount: $postCount, savePostCount: $savePostCount, reviewedRestaurantsCount: $reviewedRestaurantsCount, savedRestaurantsCount: $savedRestaurantsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsImpl &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.savePostCount, savePostCount) ||
                other.savePostCount == savePostCount) &&
            (identical(
                    other.reviewedRestaurantsCount, reviewedRestaurantsCount) ||
                other.reviewedRestaurantsCount == reviewedRestaurantsCount) &&
            (identical(other.savedRestaurantsCount, savedRestaurantsCount) ||
                other.savedRestaurantsCount == savedRestaurantsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      followingCount,
      followerCount,
      postCount,
      savePostCount,
      reviewedRestaurantsCount,
      savedRestaurantsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      __$$StatsImplCopyWithImpl<_$StatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsImplToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  const factory _Stats(
      {@JsonKey(name: "followingCount") final int? followingCount,
      @JsonKey(name: "followerCount") final int? followerCount,
      @JsonKey(name: "postCount") final int? postCount,
      @JsonKey(name: "savePostCount") final int? savePostCount,
      @JsonKey(name: "reviewedRestaurantsCount")
      final int? reviewedRestaurantsCount,
      @JsonKey(name: "savedRestaurantsCount")
      final int? savedRestaurantsCount}) = _$StatsImpl;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$StatsImpl.fromJson;

  @override
  @JsonKey(name: "followingCount")
  int? get followingCount;
  @override
  @JsonKey(name: "followerCount")
  int? get followerCount;
  @override
  @JsonKey(name: "postCount")
  int? get postCount;
  @override
  @JsonKey(name: "savePostCount")
  int? get savePostCount;
  @override
  @JsonKey(name: "reviewedRestaurantsCount")
  int? get reviewedRestaurantsCount;
  @override
  @JsonKey(name: "savedRestaurantsCount")
  int? get savedRestaurantsCount;
  @override
  @JsonKey(ignore: true)
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
