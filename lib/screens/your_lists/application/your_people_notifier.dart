import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/screens/your_lists/application/your_people_state.dart';
import 'package:for_the_table/screens/your_lists/domain/follow_type_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/utils/toast.dart';

class YourPeopleNotifier extends StateNotifier<YourPeopleState> {
  YourPeopleNotifier(this._dio, this._hiveDatabase) : super(const YourPeopleState());

  final HiveDatabase _hiveDatabase;
  final Dio _dio;

  final RefreshController followersRefreshController = RefreshController();
  final RefreshController followingRefreshController = RefreshController();
  final RefreshController requestRefreshController = RefreshController();
  final RefreshController allUsersRefreshController = RefreshController();
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    followersRefreshController.dispose();
    followingRefreshController.dispose();
    requestRefreshController.dispose();
    searchController.dispose();
    allUsersRefreshController.dispose();
    super.dispose();
  }

  void clearSearch() => searchController.clear();

  void loadMoreFollowers() async {
    if (state.followerCurrentPage > state.followerTotalPages) {
      showToastMessage('No new profiles to display');
      followersRefreshController.loadComplete();
      return;
    }

    await getAllFollowerList(isLoadMore: true);
    followersRefreshController.loadComplete();
  }

  void loadMoreFollowings() async {
    if (state.followingCurrentPage > state.followingTotalPages) {
      showToastMessage('No new profiles to display');
      followingRefreshController.loadComplete();
      return;
    }

    await getAllFollowingList(isLoadMore: true);
    followingRefreshController.loadComplete();
  }

  void loadMoreRequests() async {
    if (state.requestCurrentPage > state.requestTotalPages) {
      showToastMessage('No new profiles to display');
      requestRefreshController.loadComplete();
      return;
    }

    await getAllRequestList(isLoadMore: true);
    requestRefreshController.loadComplete();
  }

  void loadMoreUsers() async {
    if (state.allUsersCurrentPage > state.allUsersTotalPages) {
      showToastMessage('No new profiles to display');
      allUsersRefreshController.loadComplete();
      return;
    }

    await getAllUsersList(isLoadMore: true);
    allUsersRefreshController.loadComplete();
  }

  updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void setAllUsersListToZero() {
    state = state.copyWith(allUsersListLength: 0);
  }

  Future<void> getAllUsersList({bool isLoadMore = false, bool isFollowState = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore && !isFollowState);

      if (isLoadMore && (state.allUsersCurrentPage * 10 == state.allUsersListLength)) {
        state = state.copyWith(allUsersCurrentPage: state.allUsersCurrentPage + 1);
      } else {
        state = state.copyWith(allUsersCurrentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": 10,
        "page": state.allUsersCurrentPage,
        if (searchController.text.isNotEmpty) "search": searchController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);
      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.getAllFollowing}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowTypeModel usersModel = FollowTypeModel.fromJson(response.data);
        final users = usersModel.usersList;
        final List<Users> filteredList = [];

        if (isLoadMore) {
          final currentFriendsIds = state.allUsersList.map((friend) => friend.id).toSet();

          final uniqueNewFriends =
              users?.where((friend) => !currentFriendsIds.contains(friend.id)).toList();

          if ((uniqueNewFriends?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          // filteredList.clear();

          for (Users users in uniqueNewFriends ?? []) {
            if (users.isFollowing == false) {
              filteredList.add(users);
            }
          }

          state = state.copyWith(
            isLoading: false,
            allUsersList: [
              ...state.allUsersList,
              ...filteredList,
            ],
            allUsersListLength: state.allUsersListLength + (users?.length ?? 0),
          );

          return;
        }

        for (Users users in usersModel.usersList ?? []) {
          if (users.isFollowing == false) {
            filteredList.add(users);
          }
        }

        state = state.copyWith(
          isLoading: false,
          allUsersListLength: state.allUsersListLength + (users?.length ?? 0),
          allUsersList: filteredList,
          allUsersTotalPages: usersModel.pages ?? 0,
        );
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong, please try again');
    }
  }

  Future<void> getAllFollowerList({bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.followerCurrentPage * 10 == state.followerList.length)) {
        state = state.copyWith(followerCurrentPage: state.followerCurrentPage + 1);
      } else {
        state = state.copyWith(followerCurrentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": 10,
        "page": state.followerCurrentPage,
        "showing_status": "Follower",
        if (searchController.text.isNotEmpty) "search": searchController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);
      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.getAllFollowing}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowTypeModel followerModel = FollowTypeModel.fromJson(response.data);
        final followers = followerModel.usersList;

        if (isLoadMore) {
          final currentFriendsIds = state.followerList.map((friend) => friend.id).toSet();

          final uniqueNewFriends =
              followers?.where((friend) => !currentFriendsIds.contains(friend.id)).toList();

          if ((uniqueNewFriends?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            followerList: [
              ...state.followerList,
              ...uniqueNewFriends ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          followerList: followers ?? [],
          followerTotalPages: followerModel.pages ?? 0,
        );
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> getAllRequestList({bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.requestCurrentPage * 10 == state.followRequestsList.length)) {
        state = state.copyWith(requestCurrentPage: state.requestCurrentPage + 1);
      } else {
        state = state.copyWith(requestCurrentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": 10,
        "page": state.requestCurrentPage,
        "showing_status": "Follower Request",
        if (searchController.text.isNotEmpty) "search": searchController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);
      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.getAllFollowing}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowTypeModel followRequestModel = FollowTypeModel.fromJson(response.data);
        final followRequests = followRequestModel.usersList;

        if (isLoadMore) {
          final currentRequestsIds = state.followRequestsList.map((req) => req.id).toSet();

          final uniqueNewRequests =
              followRequests?.where((req) => !currentRequestsIds.contains(req.id)).toList();

          if ((uniqueNewRequests?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            followRequestsList: [
              ...state.followRequestsList,
              ...uniqueNewRequests ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          followRequestsList: followRequests ?? [],
          requestTotalPages: followRequestModel.pages ?? 0,
        );
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> getAllFollowingList({bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.followingCurrentPage * 10 == state.followingList.length)) {
        state = state.copyWith(followingCurrentPage: state.followingCurrentPage + 1);
      } else {
        state = state.copyWith(followingCurrentPage: 1);
      }

      final FormData formData = FormData.fromMap({
        "perpage": 10,
        "page": state.followingCurrentPage,
        "showing_status": "Following",
        if (searchController.text.isNotEmpty) "search": searchController.text,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.getAllFollowing}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowTypeModel followingModel = FollowTypeModel.fromJson(response.data);
        final following = followingModel.usersList;

        if (isLoadMore) {
          final currentFriendsIds = state.followingList.map((friend) => friend.id).toSet();

          final uniqueNewFriends =
              following?.where((friend) => !currentFriendsIds.contains(friend.id)).toList();

          if ((uniqueNewFriends?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            followingList: [
              ...state.followingList,
              ...uniqueNewFriends ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          followingList: following ?? [],
          followingTotalPages: followingModel.pages ?? 0,
        );
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> acceptFriendRequest(String requestId) async {
    try {
      state = state.copyWith(isLoading: true);

      final FormData formData = FormData.fromMap({
        "request_id": requestId,
        "status": "Accept",
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.acceptOrRejectRequest}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        showToastMessage(response.data["message"]);
        await getAllRequestList();
        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> unfollowFriend(String userId) async {
    try {
      state = state.copyWith(isLoading: true);

      final FormData formData = FormData.fromMap({
        "follow_user_id": userId,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.followUnfollow}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        showToastMessage(response.data["message"]);
        await getAllFollowingList();
        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  Future<void> followFriend(String userId) async {
    try {
      state = state.copyWith(isLoading: true);

      final FormData formData = FormData.fromMap({
        "follow_user_id": userId,
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.post(
        "${AppUrls.baseUrl}${AppUrls.followUnfollow}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        showToastMessage(response.data["message"]);
        await getAllFollowerList();
        state = state.copyWith(isLoading: false);
      } else {
        showToastMessage(response.data["message"]);
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage('Something went wrong. Please try in some time.');
    }
  }

  void searchUser() async {
    if (state.selectedIndex == 0) {
      await getAllFollowerList();
    } else if (state.selectedIndex == 1) {
      await getAllFollowingList();
    } else {
      await getAllRequestList();
    }
  }

// Future<void> searchUserRestaurant(WidgetRef ref) async {
//   final restaurantNotifier = ref.watch(restaurantNotifierProvider.notifier);
//   if (state.selectedIndex == 0) {
//     await getAllUsersList();
//   } else{
//     await restaurantNotifier.getRestaurants(ref: ref);
//   }
// }

}
