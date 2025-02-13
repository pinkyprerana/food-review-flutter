import 'package:for_the_table/screens/your_lists/domain/follow_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../model/restaurant/restaurantlist_response_model.dart';
part 'your_people_state.freezed.dart';

@freezed
abstract class YourPeopleState with _$YourPeopleState {
  const factory YourPeopleState({
    @Default(0) int selectedIndex,
    @Default(false) bool isLoading,
    @Default("") String userId,
    @Default([]) List<Users> followingList,
    @Default([]) List<Users> followerList,
    @Default([]) List<Users> allUsersList,
    @Default([]) List<Users> followRequestsList,
    @Default(1) int followerCurrentPage,
    @Default(1) int followerTotalPages,
    @Default(1) int followingCurrentPage,
    @Default(1) int followingTotalPages,
    @Default(1) int requestCurrentPage,
    @Default(1) int requestTotalPages,
    @Default(0) int allUsersListLength,
    @Default(1) int allUsersCurrentPage,
    @Default(1) int allUsersTotalPages,



    @Default([]) List<Restaurant>? restaurantList,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(0) int totalPages,
    @Default(true) isMoreDataFetchable,
    @Default(0) int totalNumberOfRestaurants,
  }) = _YourPeopleState;
}
