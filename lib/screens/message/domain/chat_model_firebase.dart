import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_model_firebase.freezed.dart';
part 'chat_model_firebase.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String chatAttachment,
    required int createdAt,
    required String? message,
    required String reaction,
    required bool read,
    required String receiverID,
    required String senderID,
    ReplyTo? replyTo,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}

@freezed
class ReplyTo with _$ReplyTo {
  const factory ReplyTo({
    required String messageId,
    required String? message,
    required String chatAttachment,
  }) = _ReplyTo;

  factory ReplyTo.fromJson(Map<String, dynamic> json) => _$ReplyToFromJson(json);
}
