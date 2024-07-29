import 'package:for_the_table/screens/leaderboard/domain/leaderboard_details_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState({
    @Default(false) bool isLoading,
    @Default([]) List<LeaderboardDetail> leaderboardList,
    @Default(0) int totalStandings,
    @Default(0) int currentPage,
    @Default(0) int totalPages,
  }) = _LeaderboardState;

  const LeaderboardState._();
}
