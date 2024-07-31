// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'follower_model.freezed.dart';
part 'follower_model.g.dart';

@freezed
class FollowerModel with _$FollowerModel {
  const factory FollowerModel({
    @JsonKey(name: "status") required int status,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required List<DataOfFollowerModel> followerList,
    @JsonKey(name: "total") required int total,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "pages") required int pages,
    @JsonKey(name: "limit") required int limit,
  }) = _FollowerModel;

  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);
}

@freezed
class DataOfFollowerModel with _$DataOfFollowerModel {
  const factory DataOfFollowerModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "profile_image") required String profileImage,
    @JsonKey(name: "role_info") required RoleInfoOfFollower roleInfoOfFollower,
    @JsonKey(name: "request_id") dynamic requestId,
    @JsonKey(name: "isRequest") required bool isRequest,
    @JsonKey(name: "isFollow") required bool isFollow,
  }) = _DataOfFollowerModel;

  factory DataOfFollowerModel.fromJson(Map<String, dynamic> json) =>
      _$DataOfFollowerModelFromJson(json);
}

@freezed
class RoleInfoOfFollower with _$RoleInfoOfFollower {
  const factory RoleInfoOfFollower({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "roleDisplayName") required String roleDisplayName,
    @JsonKey(name: "role") required String role,
  }) = _RoleInfoOfFollower;

  factory RoleInfoOfFollower.fromJson(Map<String, dynamic> json) =>
      _$RoleInfoOfFollowerFromJson(json);
}
