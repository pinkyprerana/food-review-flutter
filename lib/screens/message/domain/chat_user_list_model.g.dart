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
      allChatList: (json['data'] as List<dynamic>?)
          ?.map((e) => DataOfChatList.fromJson(e as Map<String, dynamic>))
          .toList(),
      userUnreadCount: (json['user_unread_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChatUserListModelImplToJson(
        _$ChatUserListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
      'data': instance.allChatList,
      'user_unread_count': instance.userUnreadCount,
    };

_$DataOfChatListImpl _$$DataOfChatListImplFromJson(Map<String, dynamic> json) =>
    _$DataOfChatListImpl(
      userDetails: json['userDetails'] == null
          ? null
          : RDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
      creatorDetails: json['creatorDetails'] == null
          ? null
          : RDetails.fromJson(json['creatorDetails'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      creatorId: json['creator_id'] as String?,
      userId: json['user_id'] as String?,
      chatToken: json['chat_token'] as String?,
      userUnreadCount: (json['user_unread_count'] as num?)?.toInt(),
      creatorUnreadCount: (json['creator_unread_count'] as num?)?.toInt(),
      isBlocked: json['isBlocked'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      chatDate: json['chat_date'] as String?,
      createdAt: json['createdAt'] as String?,
      lastMessage: json['last_message'] == null
          ? null
          : LastMessage.fromJson(json['last_message'] as Map<String, dynamic>),
      isLastMessage: json['isLastMessage'] as bool?,
    );

Map<String, dynamic> _$$DataOfChatListImplToJson(
        _$DataOfChatListImpl instance) =>
    <String, dynamic>{
      'userDetails': instance.userDetails,
      'creatorDetails': instance.creatorDetails,
      '_id': instance.id,
      'creator_id': instance.creatorId,
      'user_id': instance.userId,
      'chat_token': instance.chatToken,
      'user_unread_count': instance.userUnreadCount,
      'creator_unread_count': instance.creatorUnreadCount,
      'isBlocked': instance.isBlocked,
      'isDeleted': instance.isDeleted,
      'chat_date': instance.chatDate,
      'createdAt': instance.createdAt,
      'last_message': instance.lastMessage,
      'isLastMessage': instance.isLastMessage,
    };

_$RDetailsImpl _$$RDetailsImplFromJson(Map<String, dynamic> json) =>
    _$RDetailsImpl(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$RDetailsImplToJson(_$RDetailsImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
    };

_$LastMessageImpl _$$LastMessageImplFromJson(Map<String, dynamic> json) =>
    _$LastMessageImpl(
      chatAttachment: json['chatAttachment'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      message: json['message'] as String?,
      reaction: json['reaction'] as String?,
      read: json['read'] as bool?,
      receiverId: json['receiverID'] as String?,
      senderId: json['senderID'] as String?,
    );

Map<String, dynamic> _$$LastMessageImplToJson(_$LastMessageImpl instance) =>
    <String, dynamic>{
      'chatAttachment': instance.chatAttachment,
      'createdAt': instance.createdAt,
      'message': instance.message,
      'reaction': instance.reaction,
      'read': instance.read,
      'receiverID': instance.receiverId,
      'senderID': instance.senderId,
    };
