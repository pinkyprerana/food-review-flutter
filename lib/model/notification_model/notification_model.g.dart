// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      notificationList: (json['data'] as List<dynamic>)
          .map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      readAll: json['readAll'] as bool?,
      unreadCount: (json['unread_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.notificationList,
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'limit': instance.limit,
      'readAll': instance.readAll,
      'unread_count': instance.unreadCount,
    };

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      refPostId: json['ref_post_id'] as String?,
      refUserFollowId: json['ref_user_follow_id'] as String?,
      refPostCommentId: json['ref_post_comment_id'] as String?,
      refPostLikeId: json['ref_post_like_id'] as String?,
      refPostSaveId: json['ref_post_save_id'] as String?,
      status: json['status'] as String,
      readStatus: json['read_status'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      postedUserInfo: UserNotificationInfo.fromJson(
          json['posted_user_info'] as Map<String, dynamic>),
      receiverUserInfo: UserNotificationInfo.fromJson(
          json['receiver_user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
      'ref_post_id': instance.refPostId,
      'ref_user_follow_id': instance.refUserFollowId,
      'ref_post_comment_id': instance.refPostCommentId,
      'ref_post_like_id': instance.refPostLikeId,
      'ref_post_save_id': instance.refPostSaveId,
      'status': instance.status,
      'read_status': instance.readStatus,
      'createdAt': instance.createdAt.toIso8601String(),
      'posted_user_info': instance.postedUserInfo,
      'receiver_user_info': instance.receiverUserInfo,
    };

_$UserNotificationInfoImpl _$$UserNotificationInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationInfoImpl(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profileImage: json['profile_image'] as String,
    );

Map<String, dynamic> _$$UserNotificationInfoImplToJson(
        _$UserNotificationInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'profile_image': instance.profileImage,
    };
