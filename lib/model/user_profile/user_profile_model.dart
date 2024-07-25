// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") ProfileDetails? profileDetails,
    @JsonKey(name: "stats") Stats? stats,
    @JsonKey(name: "savePostStats") SavePostStats? savePostStats,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
}

@freezed
class ProfileDetails with _$ProfileDetails {
  const factory ProfileDetails({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "role") Role? role,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "bio") String? bio,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "profile_image") @Default('') String profileImage,
    @JsonKey(name: "otp") String? otp,
    @JsonKey(name: "isOtpVerified") @Default(false) bool isOtpVerified,
    @JsonKey(name: "isVerified") bool? isVerified,
    @JsonKey(name: "isOnBoarding") @Default(false) bool isOnBoarding,
    @JsonKey(name: "preference") @Default([]) List preference,
    @JsonKey(name: "socialAccount") @Default([]) List socialAccount,
    @JsonKey(name: "otpExpireTime") DateTime? otpExpireTime,
  }) = _ProfileDetails;

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => _$ProfileDetailsFromJson(json);
}

@freezed
class Role with _$Role {
  const factory Role({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "roleDisplayName") String? roleDisplayName,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: "followingCount") @Default(0) int followingCount,
    @JsonKey(name: "followerCount") @Default(0) int followerCount,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

@freezed
class SavePostStats with _$SavePostStats {
  const factory SavePostStats({
    @JsonKey(name: "savePostCount") @Default(0) int savePostCount,
  }) = _SavePostStats;

  factory SavePostStats.fromJson(Map<String, dynamic> json) => _$SavePostStatsFromJson(json);
}
