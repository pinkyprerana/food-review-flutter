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
    List<DataOfChatList>? allChatList,
    @JsonKey(name: "user_unread_count")
    int? userUnreadCount,
  }) = _ChatUserListModel;

  factory ChatUserListModel.fromJson(Map<String, dynamic> json) => _$ChatUserListModelFromJson(json);
}

@freezed
class DataOfChatList with _$DataOfChatList {
  const factory DataOfChatList({
    @JsonKey(name: "userDetails")
    RDetails? userDetails,
    @JsonKey(name: "creatorDetails")
    RDetails? creatorDetails,
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
    @JsonKey(name: "isBlocked")
    bool? isBlocked,
    @JsonKey(name: "isDeleted")
    bool? isDeleted,
    @JsonKey(name: "chat_date")
    String? chatDate,
    @JsonKey(name: "createdAt")
    String? createdAt,
    @JsonKey(name: "last_message")
    String? lastMessage,
    @JsonKey(name: "isLastMessage")
    bool? isLastMessage,
  }) = _DataOfChatList;

  factory DataOfChatList.fromJson(Map<String, dynamic> json) => _$DataOfChatListFromJson(json);
}

@freezed
class RDetails with _$RDetails {
  const factory RDetails({
    @JsonKey(name: "_id")
    String? id,
    @JsonKey(name: "first_name")
    String? firstName,
    @JsonKey(name: "last_name")
    String? lastName,
    @JsonKey(name: "profile_image")
    String? profileImage,
  }) = _RDetails;

  factory RDetails.fromJson(Map<String, dynamic> json) => _$RDetailsFromJson(json);
}
