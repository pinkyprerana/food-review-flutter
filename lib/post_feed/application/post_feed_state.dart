import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_feed_state.freezed.dart';

@freezed
class PostFeedState with _$PostFeedState {
  const factory PostFeedState({
    @Default(false) bool isExpanded,
    @Default(0) int selectedIndex,
  }) = _PostFeedState;
  const PostFeedState._();
}
