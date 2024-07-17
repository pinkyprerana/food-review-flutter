// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_activities.freezed.dart';
part 'user_activities.g.dart';

@freezed
class UserActivities with _$UserActivities {
  const factory UserActivities({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Activity>? activitiesList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _UserActivities;

  factory UserActivities.fromJson(Map<String, dynamic> json) => _$UserActivitiesFromJson(json);
}

@freezed
class Activity with _$Activity {
  const factory Activity({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "file_full_path") String? imagePath,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "user_info") UserInfo? userInfo,
  }) = _Activity;

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "profile_image") String? profileImage,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}
