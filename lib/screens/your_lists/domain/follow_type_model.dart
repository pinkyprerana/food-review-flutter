// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_type_model.freezed.dart';
part 'follow_type_model.g.dart';

@freezed
class FollowTypeModel with _$FollowTypeModel {
  const factory FollowTypeModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Users>? usersList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _FollowTypeModel;

  factory FollowTypeModel.fromJson(Map<String, dynamic> json) => _$FollowTypeModelFromJson(json);
}

@freezed
class Users with _$Users {
  const factory Users({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "role_info") RoleInfo? roleInfo,
    @JsonKey(name: "following_request_id") dynamic followingRequestId,
    @JsonKey(name: "follower_request_id") String? followerRequestId,
    @JsonKey(name: "isFollowingRequest") bool? isFollowingRequest,
    @JsonKey(name: "isFollowerRequest") bool? isFollowerRequest,
    @JsonKey(name: "isFollowing") bool? isFollowing,
    @JsonKey(name: "isFollower") bool? isFollower,
  }) = _Datum;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
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
