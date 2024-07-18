import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/screens/your_lists/application/your_people_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/infrastructure/hive_database.dart';
import '../../../core/utils/toast.dart';
import '../domain/following_model.dart';
import '../domain/follower_model.dart';

class YourPeopleNotifier extends StateNotifier<YourPeopleState> {
  YourPeopleNotifier(this._dio, this._hiveDatabase) : super(const YourPeopleState());

  final HiveDatabase _hiveDatabase;
  final Dio _dio;

  final RefreshController followersRefreshController = RefreshController();
  final RefreshController followingRefreshController = RefreshController();
  final RefreshController requestRefreshController = RefreshController();

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

  updateSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
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
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);
      var response = await _dio.post(
        "${AppUrls.BASE_URL}${AppUrls.getAllFollowers}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowerModel followerModel = FollowerModel.fromJson(response.data);
        final followers = followerModel.followerList;

        if (isLoadMore) {
          final currentFriendsIds = state.followerList.map((friend) => friend.id).toSet();

          final uniqueNewFriends =
              followers.where((friend) => !currentFriendsIds.contains(friend.id)).toList();

          if (uniqueNewFriends.isEmpty && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            followerList: [
              ...state.followerList,
              ...uniqueNewFriends,
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          followerList: followers,
          followerTotalPages: followerModel.pages,
        );
      } else {
        showToastMessage(response.statusMessage.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage(error.toString());
    }
  }

  Future<void> getAllRequestList({bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore && (state.followerCurrentPage * 10 == state.followerList.length)) {
        state = state.copyWith(followerCurrentPage: state.followerCurrentPage + 1);
      } else {
        state = state.copyWith(followerCurrentPage: 1);
      }

      final FormData formData = FormData.fromMap(
          {"perpage": 10, "page": state.followerCurrentPage, "showing_status": "Request"});

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);
      var response = await _dio.post(
        "${AppUrls.BASE_URL}${AppUrls.getAllFollowers}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowerModel followerModel = FollowerModel.fromJson(response.data);
        final followers = followerModel.followerList;

        if (isLoadMore) {
          final currentFriendsIds = state.followerList.map((friend) => friend.id).toSet();

          final uniqueNewFriends =
              followers.where((friend) => !currentFriendsIds.contains(friend.id)).toList();

          if (uniqueNewFriends.isEmpty && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            followerList: [
              ...state.followerList,
              ...uniqueNewFriends,
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          followerList: followers,
          followerTotalPages: followerModel.pages,
        );
      } else {
        showToastMessage(response.statusMessage.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage(error.toString());
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
      });

      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      var response = await _dio.post(
        "${AppUrls.BASE_URL}${AppUrls.getAllFollowing}",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        FollowingModel followingModel = FollowingModel.fromJson(response.data);
        final following = followingModel.followingList;

        if (isLoadMore) {
          final currentFriendsIds = state.followingList.map((friend) => friend.id).toSet();

          final uniqueNewFriends =
              following.where((friend) => !currentFriendsIds.contains(friend.id)).toList();

          if (uniqueNewFriends.isEmpty && isLoadMore) {
            showToastMessage('No new profiles to display.');
          }

          state = state.copyWith(
            isLoading: false,
            followingList: [
              ...state.followingList,
              ...uniqueNewFriends,
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          followingList: following,
          followingTotalPages: followingModel.pages,
        );
      } else {
        showToastMessage(response.statusMessage.toString());
        state = state.copyWith(isLoading: false);
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showToastMessage(error.toString());
    }
  }
}
