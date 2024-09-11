import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import '../application/follow_notifier.dart';
import '../application/follow_state.dart';

final followNotifierProvider = StateNotifierProvider<FollowNotifier, FollowState>(
  (ref) => FollowNotifier(
    ref.watch(networkService),
  ),
);
