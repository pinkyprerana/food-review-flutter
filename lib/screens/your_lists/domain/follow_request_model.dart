// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_request_model.freezed.dart';
part 'follow_request_model.g.dart';

@freezed
class FollowRequestModel with _$FollowRequestModel {
  const factory FollowRequestModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<FollowRequest>? requestsList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
  }) = _FollowRequestModel;

  factory FollowRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FollowRequestModelFromJson(json);
}

@freezed
class FollowRequest with _$FollowRequest {
  const factory FollowRequest({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "role_info") RoleInfo? roleInfo,
    @JsonKey(name: "request_id") String? requestId,
    @JsonKey(name: "isRequest") bool? isRequest,
    @JsonKey(name: "isFollow") bool? isFollow,
  }) = _FollowRequest;

  factory FollowRequest.fromJson(Map<String, dynamic> json) => _$FollowRequestFromJson(json);
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
