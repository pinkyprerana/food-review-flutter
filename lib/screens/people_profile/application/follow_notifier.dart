import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/app_log.dart';
import '../../../core/utils/toast.dart';
import '../domain/postListOfOther_model.dart';
import 'follow_state.dart';

class FollowNotifier extends StateNotifier<FollowState> {
  FollowNotifier(this._networkApiService, this._hiveDatabase) : super(const FollowState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;

  String? get getLatitude => _hiveDatabase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDatabase.box.get(AppPreferenceKeys.longitude);

  Future<void> followUnfollow(VoidCallback voidCallback, String userID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.BASE_URL}${AppUrls.followUnfollow}',
        body: {
          "follow_user_id": userID,
        },
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          final isFollowing = state.userFollowStatus[userID] ?? false;
          state = state.copyWith(
            userFollowStatus: {...state.userFollowStatus, userID: !isFollowing},
          );
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
          .postApiRequestWithToken(url: "${AppUrls.BASE_URL}${AppUrls.getPostFeed}", body: {
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
}
