// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_created_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatCreatedModelImpl _$$ChatCreatedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatCreatedModelImpl(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
      dataOfChat: json['data'] == null
          ? null
          : DataOfChat.fromJson(json['data'] as Map<String, dynamic>),
      videoRoom: json['video_room'] as String?,
    );

Map<String, dynamic> _$$ChatCreatedModelImplToJson(
        _$ChatCreatedModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.dataOfChat,
      'video_room': instance.videoRoom,
    };

_$DataOfChatImpl _$$DataOfChatImplFromJson(Map<String, dynamic> json) =>
    _$DataOfChatImpl(
      creatorId: json['creator_id'] as String?,
      userId: json['user_id'] as String?,
      chatToken: json['chat_token'] as String?,
      userUnreadCount: (json['user_unread_count'] as num?)?.toInt(),
      creatorUnreadCount: (json['creator_unread_count'] as num?)?.toInt(),
      dataNew: json['new'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      id: json['_id'] as String?,
      chatDate: json['chat_date'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$DataOfChatImplToJson(_$DataOfChatImpl instance) =>
    <String, dynamic>{
      'creator_id': instance.creatorId,
      'user_id': instance.userId,
      'chat_token': instance.chatToken,
      'user_unread_count': instance.userUnreadCount,
      'creator_unread_count': instance.creatorUnreadCount,
      'new': instance.dataNew,
      'isBlocked': instance.isBlocked,
      'isDeleted': instance.isDeleted,
      '_id': instance.id,
      'chat_date': instance.chatDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
