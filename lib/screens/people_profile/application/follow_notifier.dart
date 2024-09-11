import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/screens/people_profile/domain/other_people_profile_model.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../domain/post_list_of_other_model.dart';
import 'follow_state.dart';

class FollowNotifier extends StateNotifier<FollowState> {
  FollowNotifier(this._networkApiService, this._hiveDatabase) : super(const FollowState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;

  String? get getLatitude => _hiveDatabase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDatabase.box.get(AppPreferenceKeys.longitude);
  String? get getUserId => _hiveDatabase.box.get(AppPreferenceKeys.userId);

  Future<void> followUnfollow(VoidCallback voidCallback, String userID) async {
    // state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.followUnfollow}',
        body: {
          "follow_user_id": userID,
        },
      );
      // state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          await updateUserData(userID);
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getAllPostsOfOtherUserProfile(VoidCallback voidCallback, String userID) async {
    state = state.copyWith(isLoading: true);

    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: "${AppUrls.baseUrl}${AppUrls.getPostFeed}", body: {
        "lat": getLatitude,
        "lng": getLongitude,
        "user_id": userID,
      });

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostListOfOtherModel postListOfOtherModel = PostListOfOtherModel.fromJson(response.data);
        if (postListOfOtherModel.status == 200) {
          state = state.copyWith(
              isLoading: false, postListOfOtherUser: postListOfOtherModel.postListOfOtherUser);
        } else {
          showToastMessage(postListOfOtherModel.message.toString());
        }
      }
    } catch (error) {
      AppLog.log(error.toString());
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getOtherPeopleDetails(VoidCallback voidCallback, String userID) async {
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: "${AppUrls.baseUrl}${AppUrls.getOtherUserDetails}", body: {
        "user_id": userID,
      });

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else if (response.statusCode == 200 && response.data != null) {
        final otherPeopleProfileModel = OtherPeopleProfileModel.fromJson(response.data);
        final List<DataOfOtherPeople> detailsList = [otherPeopleProfileModel.data!];

        state = state.copyWith(
          isLoading: false,
          getDetails: detailsList,
          otherPeopleProfile: otherPeopleProfileModel,
        );
      } else {
        showToastMessage(response.data?['message'].toString() ?? 'Unexpected error');
      }
    } catch (error) {
      AppLog.log(error.toString());
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  DataOfOtherPeople? getUserById(String userId) {
    return state.getDetails?.firstWhere(
          (user) => user.id == userId,
      orElse: () => const DataOfOtherPeople(id: '', fullName: ''),
    );
  }

  Future<void> updateUserData(String userID) async {
    await getOtherPeopleDetails(() {}, userID);
    if (state.getDetails?.any((user) => user.id == userID && user.isFollowing == true) ?? false) {
      await getAllPostsOfOtherUserProfile(() {}, userID);
    }
  }
}
