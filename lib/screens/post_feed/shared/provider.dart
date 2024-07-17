import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/post_feed_notifier.dart';
import '../application/post_feed_state.dart';

final postFeedNotifierProvider =
    StateNotifierProvider.autoDispose<PostFeedNotifier, PostFeedState>(
  (ref) => PostFeedNotifier(
      ref.watch(dioProvider), ref.watch(hiveProvider), ref.watch(networkService)),
);
