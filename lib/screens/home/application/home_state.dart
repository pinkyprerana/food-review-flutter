import 'package:for_the_table/screens/home/domain/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swipe_cards/swipe_cards.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isCommentLoading,
    @Default(false) bool isHeartAnimating,
    @Default(false) bool isAllPostStackFinished,
    @Default(false) bool isFollowingPostStackFinished,
    @Default(false) bool isSavePost,
    @Default(false) bool isLiked,
    @Default(false) bool isDoubleTapped,
    @Default(false) bool isExpanded,
    @Default(true) bool isVideoOnMute,
    @Default('') String followStatus,
    @Default([]) List<SwipeItem> allSwipeItems,
    @Default([]) List<SwipeItem> followingSwipeItems,
    @Default([]) List<Comment>? commentsList,
    @Default([]) List<Post>? postList,
    @Default([]) List<bool> doubleTapList,
    @Default(0) int selectedIndex,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(1) int currentPageAllPosts,
    @Default(1) int currentPageAllPosts2,
    @Default(1) int totalPagesAllPosts,
    @Default(false) bool postDetailsIsLoading,
  }) = _HomeState;

  const HomeState._();
}
