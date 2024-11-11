// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      chatAttachment: json['chatAttachment'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      message: json['message'] as String,
      reaction: json['reaction'] as String,
      read: json['read'] as bool,
      receiverID: json['receiverID'] as String,
      senderID: json['senderID'] as String,
      replyTo: json['replyTo'] == null
          ? null
          : ReplyTo.fromJson(json['replyTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'chatAttachment': instance.chatAttachment,
      'createdAt': instance.createdAt,
      'message': instance.message,
      'reaction': instance.reaction,
      'read': instance.read,
      'receiverID': instance.receiverID,
      'senderID': instance.senderID,
      'replyTo': instance.replyTo,
    };

_$ReplyToImpl _$$ReplyToImplFromJson(Map<String, dynamic> json) =>
    _$ReplyToImpl(
      messageId: json['messageId'] as String,
      message: json['message'] as String,
      chatAttachment: json['chatAttachment'] as String,
    );

Map<String, dynamic> _$$ReplyToImplToJson(_$ReplyToImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'message': instance.message,
      'chatAttachment': instance.chatAttachment,
    };
