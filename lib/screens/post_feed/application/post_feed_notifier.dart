import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/screens/post_feed/application/post_feed_state.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/toast.dart';
import '../domain/postFeed_model.dart';

class PostFeedNotifier extends StateNotifier<PostFeedState> {
  PostFeedNotifier(this._dio, this._hiveDatabase, this._networkApiService)
      : super(const PostFeedState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;
  NetworkApiService _networkApiService;

  // void setListIndex(int index) {
  //   state = state.copyWith(listIndex: index);
  //   print(state.listIndex);
  // }

  void setIsExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
    AppLog.log('state.isExpanded===== ${state.isExpanded}');
  }

  void selectButton(int index) {
    state = state.copyWith(selectedIndex: index);
    AppLog.log('selectedIndex ----------- ${state.selectedIndex}');
  }

  final TextEditingController searchTextController =
  TextEditingController();
  int totalNumberOfPosts = 0;

  String? get userId=> _hiveDatabase.box.get(AppPreferenceKeys.userId);
  String? get getLatitude=> _hiveDatabase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude=> _hiveDatabase.box.get(AppPreferenceKeys.longitude);


  Future<void> getPostFeed() async {
    AppLog.log("Latitude: ${getLatitude}");
    AppLog.log("Longitude: ${getLongitude}");
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}',
        body:
          {
            "lat": getLatitude,
            "lng": getLongitude,
            "user_id": userId,
          }
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {
          state = state.copyWith(
              isLoading: false,
              postList:
                postModel.postList
          );

        } else {
          showToastMessage(postModel.message.toString());
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getFollowingPostFeed( follow) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}',
          body:
          {
            "lat": getLatitude,
            "lng": getLongitude,
            "user_id": userId,
            "view_type": follow,
          }
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {
          state = state.copyWith(
              isLoading: false,
              postList:
              postModel.postList
          );

        } else {
          showToastMessage(postModel.message.toString());
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> likeUnlikePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-like/add'}',
          body:
          {
            "post_id": postID
          }
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
          state = state.copyWith(isLiked: !state.isLiked);
          voidCallback.call();

        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> saveUnsavePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-save/add'}',
          body: {"post_id": postID});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          final updatedSavedPosts = Map<String, bool>.from(state.savedPosts);
          updatedSavedPosts[postID] = !(updatedSavedPosts[postID] ?? false);
          state = state.copyWith(savedPosts: updatedSavedPosts);
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> swipeRightToLikePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-like/swapped'}',
          body:
          {
            "post_id": postID,
            "type": "like"
          }
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
          // state = state.copyWith(isLiked: !state.isLiked);
          voidCallback.call();

        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> swipeLeftToDislikePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-like/swapped'}',
          body:
          {
            "post_id": postID,
            "type": "dislike"
          }
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
          // state = state.copyWith(isLiked: !state.isLiked);
          voidCallback.call();

        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

}
