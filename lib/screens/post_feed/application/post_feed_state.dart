import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swipe_cards/swipe_cards.dart';

part 'post_feed_state.freezed.dart';

@freezed
class PostFeedState with _$PostFeedState {
  const factory PostFeedState({
    @Default(false) bool isLoading,
    @Default(false) bool isSavePost,
    @Default(false) bool isCommentLoading,
    @Default(false) bool isExpanded,
    @Default(false) bool isLiked,
    @Default(false) bool isStackFinished,
    @Default(0) int selectedIndex,
    @Default([]) List postTitles,
    @Default([]) List<DataOfPostModel>? postList,
    @Default([]) List<UserInfo>? userInfoList,
    @Default([]) List<CommentInfo>? commentInfoList,
    @Default([]) List<PreferenceInfo>? preferenceInfoList,
    @Default([]) List<RestaurantInfo>? restaurantInfoList,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(false) bool isHeartAnimating,
    @Default(1) int currentPageAllPosts,
    @Default(1) int currentPageAllPosts2,
    @Default(1) int totalPagesAllPosts,
    @Default([]) List<SwipeItem> swipeItems,
    @Default([]) List<SwipeItem> swipeItems2,
  }) = _PostFeedState;
  const PostFeedState._();
}
