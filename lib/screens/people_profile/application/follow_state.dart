import 'package:freezed_annotation/freezed_annotation.dart';
part 'follow_state.freezed.dart';

@freezed
class FollowState with _$FollowState {
  const factory FollowState({
    @Default(false) bool isFollowing,
    @Default(false) bool isLoading,
  }) = _FollowState;
}