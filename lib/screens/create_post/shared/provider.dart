import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/create_post_notifier.dart';
import '../application/create_post_state.dart';

final createPostNotifierProvider = StateNotifierProvider<CreatePostNotifier, CreatePostState>(
  (ref) => CreatePostNotifier(
    ref.watch(dioProvider),
    ref.watch(networkService),
  ),
);
