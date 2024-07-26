import 'package:for_the_table/model/user_profile/user_profile_model.dart';
import 'package:for_the_table/screens/profile/domain/posts_model.dart';
import 'package:for_the_table/screens/profile/domain/user_activities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../model/notification_model/notification_model.dart';
import '../../../model/saved_post_model/saved_post_model.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isBeingSubmitted,
    @Default('') String profileImgPath,
    ProfileDetails? fetchedUser,
    @Default('') String profileImage,
    UserProfileModel? userProfileResponseModel,
    List<Activity>? userActivitiesList,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(true) isMoreDataFetchable,
    @Default([]) List<DataOfSavedPostModel> savedList,
    @Default([]) List<NotificationData> notificationList,
    @Default([]) List<Posts> dislikedPostsList,
    @Default([]) List<Posts> likedPostList,
    @Default(false) bool isExpanded,
  }) = _ProfileState;
  const ProfileState._();
}
