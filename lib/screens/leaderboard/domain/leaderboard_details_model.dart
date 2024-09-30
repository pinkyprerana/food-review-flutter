// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_details_model.freezed.dart';
part 'leaderboard_details_model.g.dart';

@freezed
class LeaderboardDetailsModel with _$LeaderboardDetailsModel {
  const factory LeaderboardDetailsModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<LeaderboardDetail>? data,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _LeaderboardDetailsModel;

  factory LeaderboardDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardDetailsModelFromJson(json);
}

@freezed
class LeaderboardDetail with _$LeaderboardDetail {
  const factory LeaderboardDetail({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "role_info") RoleInfo? roleInfo,
    @JsonKey(name: "location") String? location,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "point") int? point,
  }) = _LeaderboardDetail;

  factory LeaderboardDetail.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardDetailFromJson(json);
}

@freezed
class RoleInfo with _$RoleInfo {
  const factory RoleInfo({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "roleDisplayName") String? roleDisplayName,
    @JsonKey(name: "role") String? role,
  }) = _RoleInfo;

  factory RoleInfo.fromJson(Map<String, dynamic> json) => _$RoleInfoFromJson(json);
}
