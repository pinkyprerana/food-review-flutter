import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/postFeed_model.dart';
part 'post_feed_state.freezed.dart';

@freezed
class PostFeedState with _$PostFeedState {
  const factory PostFeedState({
    @Default(false) bool isLoading,
    @Default(false) bool isExpanded,
    @Default(0) int selectedIndex,
    @Default([]) List postTitles,
    @Default([]) List<DataOfPostModel>? postList,
    @Default([]) List<UserInfo>? userInfoList,
    @Default([]) List<RestaurantInfo>? restaurantInfoList,
  }) = _PostFeedState;
  const PostFeedState._();
}
