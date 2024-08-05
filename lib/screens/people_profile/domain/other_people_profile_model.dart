// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_people_profile_model.freezed.dart';
part 'other_people_profile_model.g.dart';

@freezed
class OtherPeopleProfileModel with _$OtherPeopleProfileModel {
  const factory OtherPeopleProfileModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    DataOfOtherPeople? data,
  }) = _OtherPeopleProfileModel;

  factory OtherPeopleProfileModel.fromJson(Map<String, dynamic> json) => _$OtherPeopleProfileModelFromJson(json);
}

@freezed
class DataOfOtherPeople with _$DataOfOtherPeople {
  const factory DataOfOtherPeople({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "first_name")
    String? firstName,
    @JsonKey(name: "last_name")
    String? lastName,
    @JsonKey(name: "fullName")
    String? fullName,
    @JsonKey(name: "role")
    Role? role,
    @JsonKey(name: "phone")
    String? phone,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "bio")
    String? bio,
    @JsonKey(name: "city")
    String? city,
    @JsonKey(name: "profile_image")
    String? profileImage,
    @JsonKey(name: "registerType")
    String? registerType,
    @JsonKey(name: "otp")
    String? otp,
    @JsonKey(name: "location")
    String? location,
    @JsonKey(name: "lng")
    String? lng,
    @JsonKey(name: "lat")
    String? lat,
    @JsonKey(name: "geo_loc")
    GeoLocation? geoLocation,
    @JsonKey(name: "otpExpireTime")
    dynamic otpExpireTime,
    @JsonKey(name: "isOtpVerified")
    bool? isOtpVerified,
    @JsonKey(name: "isVerified")
    bool? isVerified,
    @JsonKey(name: "isOnBoarding")
    bool? isOnBoarding,
    @JsonKey(name: "preference")
    List<dynamic>? preference,
    @JsonKey(name: "socialAccount")
    List<dynamic>? socialAccount,
    @JsonKey(name: "createdAt")
    String? createdAt,
    @JsonKey(name: "banner_image")
    String? bannerImage,
    @JsonKey(name: "preferenceInfo")
    List<dynamic>? preferenceInfo,
    @JsonKey(name: "isFollowing")
    bool? isFollowing,
    @JsonKey(name: "isFollowingRequest")
    bool? isFollowingRequest,
    @JsonKey(name: "stats")
    Stats? stats,
  }) = _DataOfOtherPeople;

  factory DataOfOtherPeople.fromJson(Map<String, dynamic> json) => _$DataOfOtherPeopleFromJson(json);
}

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "coordinates")
    List<double>? coordinates,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);
}

@freezed
class Role with _$Role {
  const factory Role({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "role")
    String? role,
    @JsonKey(name: "roleDisplayName")
    String? roleDisplayName,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: "followingCount")
    int? followingCount,
    @JsonKey(name: "followerCount")
    int? followerCount,
    @JsonKey(name: "postCount")
    int? postCount,
    @JsonKey(name: "savePostCount")
    int? savePostCount,
    @JsonKey(name: "reviewedRestaurantsCount")
    int? reviewedRestaurantsCount,
    @JsonKey(name: "savedRestaurantsCount")
    int? savedRestaurantsCount,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
