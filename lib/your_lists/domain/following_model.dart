import 'package:freezed_annotation/freezed_annotation.dart';
part 'following_model.freezed.dart';
part 'following_model.g.dart';

@freezed
class FollowingModel with _$FollowingModel {
  const factory FollowingModel({
    @JsonKey(name: "status") required int status,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required List<DataOfFollowingModel> followingList,
    @JsonKey(name: "total") required int total,
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "pages") required int pages,
    @JsonKey(name: "limit") required int limit,
  }) = _FollowingModel;

  factory FollowingModel.fromJson(Map<String, dynamic> json) =>
      _$FollowingModelFromJson(json);
}

@freezed
class DataOfFollowingModel with _$DataOfFollowingModel {
  const factory DataOfFollowingModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "fullName") String? fullName,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "profile_image") required String profileImage,
    @JsonKey(name: "role_info") required RoleInfoOfFollowing roleInfoOfFollowing,
    @JsonKey(name: "request_id") dynamic requestId,
    @JsonKey(name: "isRequest") required bool isRequest,
    @JsonKey(name: "isFollow") required bool isFollow,
  }) = _DataOfFollowingModel;

  factory DataOfFollowingModel.fromJson(Map<String, dynamic> json) =>
      _$DataOfFollowingModelFromJson(json);
}

@freezed
class RoleInfoOfFollowing with _$RoleInfoOfFollowing {
  const factory RoleInfoOfFollowing({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "roleDisplayName") required String roleDisplayName,
    @JsonKey(name: "role") required String role,
  }) = _RoleInfoOfFollowing;

  factory RoleInfoOfFollowing.fromJson(Map<String, dynamic> json) =>
      _$RoleInfoOfFollowingFromJson(json);
}
