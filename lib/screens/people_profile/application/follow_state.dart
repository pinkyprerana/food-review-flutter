import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/other_people_profile_model.dart';
import '../domain/post_list_of_other_model.dart';
part 'follow_state.freezed.dart';

@freezed
class FollowState with _$FollowState {
  const factory FollowState({
    @Default({}) Map<String, bool> userFollowStatus,
    @Default(false) bool isLoading,
    @Default([]) List<DataOfPostListOfOtherModel> postListOfOtherUser,
    @Default([]) List<GeoLoc>? coordinateList,
    @Default([]) List<UserInfo>? userInfoList,
    @Default([]) List<PreferenceInfo>? preferenceInfoList,
    @Default([]) List<RestaurantInfo>? restaurantInfoList,
    List<DataOfOtherPeople>? getDetails,
    OtherPeopleProfileModel? otherPeopleProfile,
  }) = _FollowState;
}
