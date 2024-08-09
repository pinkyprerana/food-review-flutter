import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/screens/post_feed/application/post_feed_state.dart';
import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:for_the_table/screens/post_feed/presentation/widgets/heart_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/toast.dart';

class PostFeedNotifier extends StateNotifier<PostFeedState> {
  PostFeedNotifier(this._hiveDatabase, this._networkApiService, this._dio)
      : super(const PostFeedState());

  final HiveDatabase _hiveDatabase;
  final Dio _dio;
  final NetworkApiService _networkApiService;
  TextEditingController commentController = TextEditingController();

  final refreshController = RefreshController();

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
  String? get getLongitude =>
      _hiveDatabase.box.get(AppPreferenceKeys.longitude);

  void loadMorePosts() async {
    if (state.currentPage > state.totalPages) {
      showToastMessage('No new posts to display');
      refreshController.loadComplete();
      return;
    }

    await fetchPosts(isLoadMore: true);
    refreshController.loadComplete();
  }

  Future<void> fetchPosts({bool isLoadMore = false}) async {
    state = state.copyWith(isLoading: !isLoadMore);

    if (isLoadMore && (state.currentPage * 10 == state.postList?.length)) {
      state = state.copyWith(currentPage: state.currentPage + 1);
    } else {
      state = state.copyWith(currentPage: 1);
    }

    final FormData formData = FormData.fromMap({
      "perpage": 10,
      "page": state.currentPage,
      "list_type": "follow",
    });

    var headers = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
    };

    _dio.options.headers.addAll(headers);

    try {
      var response = await _dio.post(
        "/post/list",
        data: formData,
      );

      if (response.statusCode == 200 && response.data != null) {
        PostModel postModel = PostModel.fromJson(response.data);
        final posts = postModel.postList;

        if (isLoadMore) {
          final currentPostsIds =
              state.postList?.map((post) => post.id).toSet();

          final uniqueNewPosts = posts
              ?.where((post) => !(currentPostsIds?.contains(post.id) ?? false))
              .toList();

          if ((uniqueNewPosts?.isEmpty ?? false) && isLoadMore) {
            showToastMessage('No new posts to display.');
          }

          state = state.copyWith(
            isLoading: false,
            postList: [
              ...state.postList ?? [],
              ...uniqueNewPosts ?? [],
            ],
          );

          return;
        }

        state = state.copyWith(
          isLoading: false,
          postList: posts ?? [],
          totalPages: postModel.pages ?? 0,
        );
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error,
          errorMessage: 'Something went wrong, please try again');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getPostFeed({bool isPostLoading = false}) async {
    state = state.copyWith(isLoading: !isPostLoading);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
              body: {"list_type": "list"});
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

  Future<void> getFollowingPostFeed() async {
    // state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
              body: {"list_type": "follow"});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {
          state =
              state.copyWith(isLoading: false, postList: postModel.postList);
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
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.likeUnlikePost}',
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
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.saveUnsavePost}',
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

  Future<void> swipeRightToLikePost(
      VoidCallback voidCallback, String postID) async {
    // state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.swipeToLikeDislikePost}',
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

  Future<void> swipeLeftToDislikePost(
      VoidCallback voidCallback, String postID) async {
    // state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.swipeToLikeDislikePost}',
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
      var (response, dioException) =
          await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.addComment}',
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

  Future<void> postCommentLikeUnlike(
      VoidCallback voidCallback, String commentID) async {
    state = state.copyWith(isCommentLoading: true);
    try {
      var (response, dioException) =
          await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.likeUnlikeComment}',
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

  Future<void> showFavourite(BuildContext context) async {
    state = state.copyWith(isHeartAnimating: true);

    // OverlayState? overlayState = Overlay.of(context);
    // OverlayEntry overlayEntry = OverlayEntry(
    //   builder: (context) {
    //     return Positioned(
    //       top: MediaQuery.of(context).size.height / 2,
    //       right: MediaQuery.of(context).size.width / 2 - 34,
    //       child: HeartAnimationWidget(
    //         isAnimating: state.isHeartAnimating,
    //         child: const Icon(
    //           Icons.favorite,
    //           size: 70,
    //           color: Colors.white,
    //         ),
    //       ),
    //     );
    //   },
    // );

    // overlayState?.insert(overlayEntry);

    // await Future.delayed(const Duration(seconds: 2));

    // overlayEntry.remove();
  }

  void setFvoriteToFalse() {
    state = state.copyWith(isHeartAnimating: false);
  }
}
