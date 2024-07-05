// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'follower_model.freezed.dart';
// part 'follower_model.g.dart';
//
// @freezed
// class FollowerModel with $_FollowerModel {
//   const factory FollowerModel({
//     @JsonKey(name: "status") required int status,
//     @JsonKey(name: "type") required String type,
//     @JsonKey(name: "message") required String message,
//     @JsonKey(name: "data") required List<FollowerList> followerList,
//     @JsonKey(name: "total") required int total,
//     @JsonKey(name: "page") required int page,
//     @JsonKey(name: "pages") required int pages,
//     @JsonKey(name: "limit") required int limit,
//   }) = _FollowerModel;
//
//   factory FollowerModel.fromJson(Map<String, dynamic> json) =>
//       _$FollowerModelFromJson(json);
// }
//
// @freezed
// class FollowerList with $_FollowerList {
//   const factory FollowerList({
//     @JsonKey(name: "_id") required String id,
//     @JsonKey(name: "first_name") required String firstName,
//     @JsonKey(name: "last_name") required String lastName,
//     @JsonKey(name: "fullName") String? fullName, // Optional field
//     @JsonKey(name: "email") required String email,
//     @JsonKey(name: "profile_image") required String profileImage,
//     @JsonKey(name: "role_info") required RoleInfo roleInfo,
//     @JsonKey(name: "request_id") dynamic requestId, // Can be null
//     @JsonKey(name: "isRequest") required bool isRequest,
//     @JsonKey(name: "isFollow") required bool isFollow,
//   }) = _FollowerList;
//
//   factory FollowerList.fromJson(Map<String, dynamic> json) =>
//       _$FollowerListFromJson(json);
// }
//
// @freezed
// class RoleInfo with $_RoleInfo {
//   const factory RoleInfo({
//     @JsonKey(name: "_id") required String id,
//     @JsonKey(name: "roleDisplayName") required String roleDisplayName,
//     @JsonKey(name: "role") required String role,
//   }) = _RoleInfo;
//
//   factory RoleInfo.fromJson(Map<String, dynamic> json) =>
//       _$RoleInfoFromJson(json);
// }
