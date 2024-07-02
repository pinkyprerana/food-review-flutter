import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/createPost_notifier.dart';
import '../application/createPost_state.dart';


final CreatePostNotifierProvider = StateNotifierProvider<CreatePostNotifier, CreatePostState>(
      (ref) =>CreatePostNotifier(
    ref.watch(dioProvider),
    ref.watch(networkService),
  ),
);
