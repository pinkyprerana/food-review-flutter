// ignore_for_file: parameter_assignments, empty_catches, invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_user_list_model.freezed.dart';
part 'chat_user_list_model.g.dart';

@freezed
class ChatUserListModel with _$ChatUserListModel {
  const factory ChatUserListModel({
    @JsonKey(name: "status")
    int? status,
    @JsonKey(name: "type")
    String? type,
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    DataOfChatListModel? data,
    @JsonKey(name: "video_room")
    String? videoRoom,
  }) = _ChatUserListModel;

  factory ChatUserListModel.fromJson(Map<String, dynamic> json) => _$ChatUserListModelFromJson(json);
}

@freezed
class DataOfChatListModel with _$DataOfChatListModel {
  const factory DataOfChatListModel({
    @JsonKey(name: "_id")
    String? id,
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
    @JsonKey(name: "chat_date")
    String? chatDate,
    @JsonKey(name: "createdAt")
    String? createdAt,
    @JsonKey(name: "updatedAt")
    String? updatedAt,
  }) = _DataOfChatListModel;

  factory DataOfChatListModel.fromJson(Map<String, dynamic> json) => _$DataOfChatListModelFromJson(json);
}
