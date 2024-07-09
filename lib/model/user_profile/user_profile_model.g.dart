// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      profileDetails: json['data'] == null
          ? null
          : ProfileDetails.fromJson(json['data'] as Map<String, dynamic>),
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
      savePostStats: json['savePostStats'] == null
          ? null
          : SavePostStats.fromJson(
              json['savePostStats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.profileDetails,
      'stats': instance.stats,
      'savePostStats': instance.savePostStats,
    };

_$ProfileDetailsImpl _$$ProfileDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDetailsImpl(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['fullName'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      city: json['city'] as String?,
      profileImage: json['profile_image'] as String? ?? '1',
      otp: json['otp'] as String?,
      isOtpVerified: json['isOtpVerified'] as bool? ?? false,
      isVerified: json['isVerified'] as bool?,
      isOnBoarding: json['isOnBoarding'] as bool? ?? false,
      preference: json['preference'] as List<dynamic>? ?? const [],
      socialAccount: json['socialAccount'] as List<dynamic>? ?? const [],
      otpExpireTime: json['otpExpireTime'] == null
          ? null
          : DateTime.parse(json['otpExpireTime'] as String),
    );

Map<String, dynamic> _$$ProfileDetailsImplToJson(
        _$ProfileDetailsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullName': instance.fullName,
      'role': instance.role,
      'phone': instance.phone,
      'email': instance.email,
      'bio': instance.bio,
      'city': instance.city,
      'profile_image': instance.profileImage,
      'otp': instance.otp,
      'isOtpVerified': instance.isOtpVerified,
      'isVerified': instance.isVerified,
      'isOnBoarding': instance.isOnBoarding,
      'preference': instance.preference,
      'socialAccount': instance.socialAccount,
      'otpExpireTime': instance.otpExpireTime?.toIso8601String(),
    };

_$RoleImpl _$$RoleImplFromJson(Map<String, dynamic> json) => _$RoleImpl(
      id: json['_id'] as String?,
      role: json['role'] as String?,
      roleDisplayName: json['roleDisplayName'] as String?,
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'role': instance.role,
      'roleDisplayName': instance.roleDisplayName,
    };

_$StatsImpl _$$StatsImplFromJson(Map<String, dynamic> json) => _$StatsImpl(
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
      followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StatsImplToJson(_$StatsImpl instance) =>
    <String, dynamic>{
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
    };

_$SavePostStatsImpl _$$SavePostStatsImplFromJson(Map<String, dynamic> json) =>
    _$SavePostStatsImpl(
      savePostCount: (json['savePostCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SavePostStatsImplToJson(_$SavePostStatsImpl instance) =>
    <String, dynamic>{
      'savePostCount': instance.savePostCount,
    };
