// ignore_for_file: parameter_assignments, empty_catches, invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_created_model.freezed.dart';
part 'chat_created_model.g.dart';

@freezed
class ChatCreatedModel with _$ChatCreatedModel {
  const factory ChatCreatedModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    DataOfChat ? dataOfChat,
    @JsonKey(name: "video_room")
    String? videoRoom,
  }) = _ChatCreatedModel;

  factory ChatCreatedModel.fromJson(Map<String, dynamic> json) => _$ChatCreatedModelFromJson(json);
}

@freezed
class DataOfChat with _$DataOfChat {
  const factory DataOfChat({
    @JsonKey(name: "creator_id")
    String? creatorId,
    @JsonKey(name: "user_id")
    String? userId,
    @JsonKey(name: "chat_token")
    String? chatToken,
    @JsonKey(name: "user_unread_count")
    int? userUnreadCount,
    @JsonKey(name: "creator_unread_count")
    int? creatorUnreadCount,
    @JsonKey(name: "new")
    bool? dataNew,
    @JsonKey(name: "isBlocked")
    bool? isBlocked,
    @JsonKey(name: "isDeleted")
    bool? isDeleted,
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "chat_date")
    String? chatDate,
    @JsonKey(name: "createdAt")
    String? createdAt,
    @JsonKey(name: "updatedAt")
    String? updatedAt,
  }) = _DataOfChat;

  factory DataOfChat.fromJson(Map<String, dynamic> json) => _$DataOfChatFromJson(json);
}

