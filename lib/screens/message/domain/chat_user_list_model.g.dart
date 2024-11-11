// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatUserListModelImpl _$$ChatUserListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatUserListModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataOfChatListModel.fromJson(json['data'] as Map<String, dynamic>),
      videoRoom: json['video_room'] as String?,
    );

Map<String, dynamic> _$$ChatUserListModelImplToJson(
        _$ChatUserListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.data,
      'video_room': instance.videoRoom,
    };

_$DataOfChatListModelImpl _$$DataOfChatListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DataOfChatListModelImpl(
      id: json['_id'] as String?,
      creatorId: json['creator_id'] as String?,
      userId: json['user_id'] as String?,
      chatToken: json['chat_token'] as String?,
      userUnreadCount: (json['user_unread_count'] as num?)?.toInt(),
      creatorUnreadCount: (json['creator_unread_count'] as num?)?.toInt(),
      dataNew: json['new'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      chatDate: json['chat_date'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DataOfChatListModelImplToJson(
        _$DataOfChatListModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'creator_id': instance.creatorId,
      'user_id': instance.userId,
      'chat_token': instance.chatToken,
      'user_unread_count': instance.userUnreadCount,
      'creator_unread_count': instance.creatorUnreadCount,
      'new': instance.dataNew,
      'isBlocked': instance.isBlocked,
      'isDeleted': instance.isDeleted,
      'chat_date': instance.chatDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
