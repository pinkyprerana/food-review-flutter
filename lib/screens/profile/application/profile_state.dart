import 'package:for_the_table/model/user_profile/user_profile_model.dart';
import 'package:for_the_table/screens/profile/domain/user_activities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _ProfileState;
  const ProfileState._();
}
