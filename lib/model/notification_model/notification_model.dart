import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") required List<NotificationData> notificationList,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "pages") int? pages,
    @JsonKey(name: "limit") int? limit,
    @JsonKey(name: "readAll") bool? readAll,
    @JsonKey(name: "unread_count") int? unreadCount,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
abstract class NotificationData with _$NotificationData {
  const factory NotificationData({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "ref_post_id") String? refPostId,
    @JsonKey(name: "ref_user_follow_id") String? refUserFollowId,
    @JsonKey(name: "ref_post_comment_id") String? refPostCommentId,
    @JsonKey(name: "ref_post_like_id") String? refPostLikeId,
    @JsonKey(name: "ref_post_save_id") String? refPostSaveId,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "read_status") required bool readStatus,
    @JsonKey(name: "createdAt") required String createdAt,
    @JsonKey(name: "posted_user_info") required UserNotificationInfo postedUserInfo,
    @JsonKey(name: "receiver_user_info") required UserNotificationInfo receiverUserInfo,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

@freezed
abstract class UserNotificationInfo with _$UserNotificationInfo {
  const factory UserNotificationInfo({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "fullName") required String fullName,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "profile_image") required String profileImage,
  }) = _UserNotificationInfo;

  factory UserNotificationInfo.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationInfoFromJson(json);
}
