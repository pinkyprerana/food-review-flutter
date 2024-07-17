import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/postListOfOther_model.dart';
part 'follow_state.freezed.dart';

@freezed
class FollowState with _$FollowState {
  const factory FollowState({
    @Default(false) bool isFollowing,
    @Default(false) bool isLoading,
    @Default([]) List<DataOfPostListOfOtherModel> postListOfOtherUser,
    @Default([]) List<GeoLoc>? coordinateList,
    @Default([]) List<UserInfo>? userInfoList,
    @Default([]) List<PreferenceInfo>? preferenceInfoList,
    @Default([]) List<RestaurantInfo>? restaurantInfoList,
  }) = _FollowState;
}