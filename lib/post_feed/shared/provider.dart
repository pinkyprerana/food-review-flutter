import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/list/application/list_notifier.dart';
import 'package:for_the_table/list/application/list_state.dart';
import 'package:for_the_table/post_feed/application/post_feed_notifier.dart';
import 'package:for_the_table/post_feed/application/post_feed_state.dart';

final postFeedNotifierProvider =
    StateNotifierProvider.autoDispose<PostFeedNotifier, PostFeedState>(
  (ref) => PostFeedNotifier(ref.watch(dioProvider), ref.watch(hiveProvider)),
);