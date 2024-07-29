import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/screens/post_feed/application/post_feed_state.dart';
import 'package:for_the_table/screens/post_feed/domain/postFeed_model.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/toast.dart';

class PostFeedNotifier extends StateNotifier<PostFeedState> {
  PostFeedNotifier(this._hiveDatabase, this._networkApiService) : super(const PostFeedState());

  final HiveDatabase _hiveDatabase;
  final NetworkApiService _networkApiService;
  TextEditingController commentController = TextEditingController();

  void setIsExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
    AppLog.log('state.isExpanded===== ${state.isExpanded}');
  }

  void selectButton(int index) {
    state = state.copyWith(selectedIndex: index);
    AppLog.log('selectedIndex ----------- ${state.selectedIndex}');
  }

  void stackEmptyStatus() {
    state = state.copyWith(isStackFinished: true);
  }

  final TextEditingController searchTextController = TextEditingController();
  int totalNumberOfPosts = 0;

  String? get userId => _hiveDatabase.box.get(AppPreferenceKeys.userId);
  String? get getLatitude => _hiveDatabase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDatabase.box.get(AppPreferenceKeys.longitude);

  Future<void> getPostFeed({bool isPostLoading = false}) async {
    AppLog.log("Latitude: $getLatitude");
    AppLog.log("Longitude: $getLongitude");
    state = state.copyWith(isLoading: !isPostLoading);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}',
        body: {
          'view_type':'list'
        }
      );
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        try {
          PostModel postModel = PostModel.fromJson(response.data);
          if (postModel.status == 200) {
            List<CommentInfo> allComments = [];
            for (var post in postModel.postList ?? []) {
              if (post.commentInfo != null) {
                allComments.addAll(post.commentInfo!);
              }
            }

            state = state.copyWith(
              isLoading: false,
              postList: postModel.postList,
              commentInfoList: allComments,
            );
          } else {
            showToastMessage(postModel.message.toString());
          }
        } catch (error) {
          AppLog.log("Error parsing PostModel: $error");
          showToastMessage("Error parsing response data");
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isLoading: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> getFollowingPostFeed(follow) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}', body: {
        "lat": getLatitude,
        "lng": getLongitude,
        "user_id": userId,
        "view_type": follow,
      });
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {
          state = state.copyWith(isLoading: false, postList: postModel.postList);
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
    state = state.copyWith(isSavePost: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-like/add'}', body: {"post_id": postID});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          await getPostFeed(isPostLoading: true);
          state = state.copyWith(isLiked: false);
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isSavePost: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> saveUnsavePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isSavePost: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-save/add'}', body: {"post_id": postID});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          await getPostFeed(isPostLoading: true);
          state = state.copyWith(isSavePost: false);
          voidCallback.call();
        } else {
          state = state.copyWith(isSavePost: false);
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      AppLog.log("Error fetching post feed: $error");
      state = state.copyWith(isSavePost: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> swipeRightToLikePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${'/post-like/swapped'}',
          body: {"post_id": postID, "type": "like"});
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
          body: {"post_id": postID, "type": "dislike"});
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

  Future<void> postComment(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isCommentLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.BASE_URL}/post-comment/add',
        body: {
          "post_id": postID,
          "comment": commentController.text,
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
          await getPostFeed(isPostLoading: true);
          state = state.copyWith(isCommentLoading: false);
          commentController.clear();
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isSavePost: false);
      showConnectionWasInterruptedToastMessage();
    }
  }

  Future<void> postCommentLikeUnlike(VoidCallback voidCallback, String commentID) async {
    state = state.copyWith(isCommentLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.BASE_URL}/post-like/comment',
        body: {
          "comment_id": commentID,
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
          await getPostFeed(isPostLoading: true);
          state = state.copyWith(isCommentLoading: false);
          commentController.clear();
          voidCallback.call();
        } else {
          showToastMessage(jsonData['message']);
        }
      }
    } catch (error) {
      state = state.copyWith(isSavePost: false);
      showConnectionWasInterruptedToastMessage();
    }
  }
}
