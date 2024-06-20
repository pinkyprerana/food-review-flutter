import 'package:freezed_annotation/freezed_annotation.dart';
part 'follow_state.freezed.dart';

@freezed
class FollowState with _$FollowState {
  const factory FollowState({
    @Default(-1) int followIndex,
  }) = _FollowState;
}