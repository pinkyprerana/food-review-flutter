import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/chat_created_model.dart';
import '../domain/chat_model_firebase.dart';
part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadMore,
    @Default(false) bool isSending,
    @Default([]) List<ChatModel> allChatList,
    DataOfChat? dataOfChat,
    @Default('') String? selectedChat,
    @Default('') String? errorMessage,
    @Default(0) int currentPage,
    @Default(0) int totalPages,
  }) = _ChatState;

  const ChatState._();
}
