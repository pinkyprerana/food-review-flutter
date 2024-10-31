import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/chat_notifier.dart';
import '../application/chat_state.dart';

final chatNotifierProvider =
StateNotifierProvider<ChatNotifier, ChatState>((ref) =>
    ChatNotifier(ref.watch(dioProvider), ref.watch(hiveProvider), ref.watch(networkService)));
