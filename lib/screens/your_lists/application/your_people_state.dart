import 'package:for_the_table/screens/your_lists/domain/follow_request_model.dart';
import 'package:for_the_table/screens/your_lists/domain/follower_model.dart';
import 'package:for_the_table/screens/your_lists/domain/following_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'your_people_state.freezed.dart';

@freezed
abstract class YourPeopleState with _$YourPeopleState {
  const factory YourPeopleState({
    @Default(0) int selectedIndex,
    @Default(false) bool isLoading,
    @Default("") String userId,
    @Default([]) List<DataOfFollowingModel> followingList,
    @Default([]) List<RoleInfoOfFollowing> roleInfoOfFollowing,
    @Default([]) List<DataOfFollowerModel> followerList,
    @Default([]) List<RoleInfoOfFollower> roleInfoOfFollower,
    @Default([]) List<FollowRequest> followRequestsList,
    @Default(1) int followerCurrentPage,
    @Default(1) int followerTotalPages,
    @Default(1) int followingCurrentPage,
    @Default(1) int followingTotalPages,
    @Default(1) int requestCurrentPage,
    @Default(1) int requestTotalPages,
    // @Default([]) List<DataOfFollowModel> requestList,
  }) = _YourPeopleState;
}
