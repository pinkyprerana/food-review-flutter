// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_people_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherPeopleProfileModelImpl _$$OtherPeopleProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtherPeopleProfileModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataOfOtherPeople.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OtherPeopleProfileModelImplToJson(
        _$OtherPeopleProfileModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
    };

_$DataOfOtherPeopleImpl _$$DataOfOtherPeopleImplFromJson(
        Map<String, dynamic> json) =>
    _$DataOfOtherPeopleImpl(
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
      profileImage: json['profile_image'] as String?,
      registerType: json['registerType'] as String?,
      otp: json['otp'] as String?,
      location: json['location'] as String?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      geoLocation: json['geo_loc'] == null
          ? null
          : GeoLocation.fromJson(json['geo_loc'] as Map<String, dynamic>),
      otpExpireTime: json['otpExpireTime'],
      isOtpVerified: json['isOtpVerified'] as bool?,
      isVerified: json['isVerified'] as bool?,
      isOnBoarding: json['isOnBoarding'] as bool?,
      preference: json['preference'] as List<dynamic>?,
      socialAccount: json['socialAccount'] as List<dynamic>?,
      createdAt: json['createdAt'] as String?,
      bannerImage: json['banner_image'] as String?,
      preferenceInfo: json['preferenceInfo'] as List<dynamic>?,
      isFollowing: json['isFollowing'] as bool?,
      isFollowingRequest: json['isFollowingRequest'] as bool?,
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataOfOtherPeopleImplToJson(
        _$DataOfOtherPeopleImpl instance) =>
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
      'registerType': instance.registerType,
      'otp': instance.otp,
      'location': instance.location,
      'lng': instance.lng,
      'lat': instance.lat,
      'geo_loc': instance.geoLocation,
      'otpExpireTime': instance.otpExpireTime,
      'isOtpVerified': instance.isOtpVerified,
      'isVerified': instance.isVerified,
      'isOnBoarding': instance.isOnBoarding,
      'preference': instance.preference,
      'socialAccount': instance.socialAccount,
      'createdAt': instance.createdAt,
      'banner_image': instance.bannerImage,
      'preferenceInfo': instance.preferenceInfo,
      'isFollowing': instance.isFollowing,
      'isFollowingRequest': instance.isFollowingRequest,
      'stats': instance.stats,
    };

_$GeoLocationImpl _$$GeoLocationImplFromJson(Map<String, dynamic> json) =>
    _$GeoLocationImpl(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$GeoLocationImplToJson(_$GeoLocationImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
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
      followingCount: (json['followingCount'] as num?)?.toInt(),
      followerCount: (json['followerCount'] as num?)?.toInt(),
      postCount: (json['postCount'] as num?)?.toInt(),
      savePostCount: (json['savePostCount'] as num?)?.toInt(),
      reviewedRestaurantsCount:
          (json['reviewedRestaurantsCount'] as num?)?.toInt(),
      savedRestaurantsCount: (json['savedRestaurantsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StatsImplToJson(_$StatsImpl instance) =>
    <String, dynamic>{
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
      'postCount': instance.postCount,
      'savePostCount': instance.savePostCount,
      'reviewedRestaurantsCount': instance.reviewedRestaurantsCount,
      'savedRestaurantsCount': instance.savedRestaurantsCount,
    };
