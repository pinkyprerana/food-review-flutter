import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/shared/providers.dart';
import 'package:for_the_table/screens/leaderboard/application/leaderboard_notifier.dart';
import 'package:for_the_table/screens/leaderboard/application/leaderboard_state.dart';

final leaderboardProvider = StateNotifierProvider<LeaderboardNotifier, LeaderboardState>((ref) {
  return LeaderboardNotifier(
    ref.watch(dioProvider),
    ref.watch(hiveProvider),
  );
});
