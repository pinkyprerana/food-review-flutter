import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/following_model.dart';
import '../domain/follower_model.dart';
part 'yourPeople_state.freezed.dart';

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
    // @Default([]) List<DataOfFollowModel> requestList,
  }) = _YourPeopleState;
}