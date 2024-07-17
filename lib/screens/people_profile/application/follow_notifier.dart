import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/toast.dart';
import 'follow_state.dart';

class FollowNotifier extends StateNotifier<FollowState> {
  FollowNotifier(this._networkApiService, this._hiveDatabase) : super(const FollowState());

  final NetworkApiService _networkApiService;
  final HiveDatabase _hiveDatabase;


  //  setFollowingState(bool following) {
  //    state = state.copyWith(isFollowing: !state.isFollowing);
  // }

  Future<void> follow_unfollow(VoidCallback voidCallback, String userID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (
      response,
      dioException
      ) = await _networkApiService.postApiRequestWithToken(
          url:
          '${AppUrls.BASE_URL}${AppUrls.follow_unfollow}',
          body: {
            "follow_user_id": userID,
          });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          state = state.copyWith(isFollowing: !state.isFollowing);
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

  // Future<void> getAllPosts() async {
  //   state = state.copyWith(isLoading: true);
  //
  //   try {
  //     var (response, dioException) =
  //     await _networkApiService.getApiRequest(
  //         url: "${AppUrls.BASE_URL}${AppUrls.getPostFeed}");
  //
  //     if (response == null && dioException == null) {
  //       showConnectionWasInterruptedToastMessage();
  //     } else if (dioException != null) {
  //       showDioError(dioException);
  //     } else {
  //       PostModel postModel =
  //       PostModel.fromJson(response.data);
  //       if (postModel.status == 200) {
  //         state = state.copyWith(isLoading: false,
  //             postList: postModel.postList);
  //       } else {
  //         showToastMessage(postModel.message.toString());
  //       }
  //     }
  //   } catch (error) {
  //     AppLog.log(error.toString());
  //     state = state.copyWith(isLoading: false);
  //     showConnectionWasInterruptedToastMessage();
  //   }
  // }

}
