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
import 'package:for_the_table/screens/post_feed/presentation/widgets/post_feed_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../core/constants/app_urls.dart';
import '../../../core/utils/toast.dart';

class PostFeedNotifier extends StateNotifier<PostFeedState> {
  PostFeedNotifier(this._hiveDatabase, this._networkApiService, this._dio)
      : super(const PostFeedState());

  final HiveDatabase _hiveDatabase;
  final Dio _dio;
  final NetworkApiService _networkApiService;
  TextEditingController commentController = TextEditingController();
  List<SwipeItem> swipeItems = [];
  List<SwipeItem> swipeItems2 = [];
  int count = 0;
  MatchEngine? matchEngine;
  MatchEngine? matchEngineFollowing;

  final refreshController = RefreshController();

  void setIsExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void selectButton(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void stackEmptyStatus() {
    state = state.copyWith(isStackFinished: true);
  }

  final TextEditingController searchTextController = TextEditingController();
  int totalNumberOfPosts = 0;

  String? get userId => _hiveDatabase.box.get(AppPreferenceKeys.userId);
  String? get getLatitude => _hiveDatabase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDatabase.box.get(AppPreferenceKeys.longitude);

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
          final currentPostsIds = state.postList?.map((post) => post.id).toSet();

          final uniqueNewPosts =
              posts?.where((post) => !(currentPostsIds?.contains(post.id) ?? false)).toList();

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
      showToastMessage(error, errorMessage: 'Something went wrong, please try again');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loadMorePostFeed() async {
    if (state.currentPageAllPosts >= state.totalPagesAllPosts) {
      stackEmptyStatus();
      showToastMessage('No more posts');
      return;
    }

    await getPostFeed(isLoadMore: true);
  }

  Future<void> getPostFeed({
    bool isPostLoading = false,
    bool isLoadMore = false,
    bool isPostLikeUnlike = false,
  }) async {
    state = state.copyWith(isLoading: !isPostLoading && !isLoadMore && !isPostLikeUnlike);

    try {
      if (isLoadMore) {
        state = state.copyWith(currentPageAllPosts: state.currentPageAllPosts + 1);
      } else {
        state = state.copyWith(currentPageAllPosts: 1);
      }

      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
        body: {
          "list_type": "list",
          "perpage": 10,
          "page": state.currentPageAllPosts,
        },
      );
      // state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        try {
          PostModel postModel = PostModel.fromJson(response.data);
          if (postModel.status == 200) {
            List<CommentInfo> allComments = [];

            for (DataOfPostModel post in postModel.postList ?? []) {
              if (post.commentInfo != null) {
                allComments.addAll(post.commentInfo!);
              }
            }

            if (isLoadMore) {
              swipeItems.clear();
            }

            // if (!isPostLikeUnlike) {
            for (int i = 0; i < (postModel.postList?.length ?? 0); i++) {
              swipeItems.add(
                SwipeItem(
                  content: PostFeedItem(
                    postList: postModel.postList?[i],
                    index: i,
                  ),
                  superlikeAction: () {
                    final updatedList = List.from(state.swipeItems);
                    updatedList.removeAt(0);
                    state = state.copyWith(swipeItems: [...updatedList]);
                  },
                  likeAction: () async {
                    await swipeRightToLikePost(() {
                      final updatedList = List.from(state.swipeItems);
                      updatedList.removeAt(0);
                      state = state.copyWith(swipeItems: [...updatedList]);
                    }, postModel.postList?[i].id ?? "");
                  },
                  nopeAction: () async {
                    await swipeLeftToDislikePost(() {
                      final updatedList = List.from(state.swipeItems);
                      updatedList.removeAt(0);
                      state = state.copyWith(swipeItems: [...updatedList]);
                    }, postModel.postList?[i].id ?? "");
                  },
                ),
              );
            }
            // }

            if (isLoadMore) {
              state = state
                  .copyWith(isLoading: false, swipeItems: [...state.swipeItems, ...swipeItems]);
              matchEngine = MatchEngine(swipeItems: [...state.swipeItems]);
              return;
            }

            final doubleTapList = List.generate(swipeItems.length, (index) => false);

            state = state.copyWith(
              isLoading: false,
              postList: postModel.postList, // i think the problem is here
              commentInfoList: allComments,
              swipeItems: [...swipeItems],
              totalPagesAllPosts: postModel.pages ?? 0,
              doubleTapList: doubleTapList,
            );

            matchEngine = MatchEngine(swipeItems: [...state.swipeItems]);
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

  Future<void> loadMoreFollowingPostFeed() async {
    if (state.currentPageAllPosts2 >= state.totalPagesAllPosts) {
      stackEmptyStatus();
      showToastMessage('No more posts');
      return;
    }
    AppLog.log('-----------------------load more callled----------------------------');
    await getFollowingPostFeed(isLoadMore: true);
  }

  Future<void> getFollowingPostFeed({bool isLoadMore = false}) async {
    state = state.copyWith(isLoading: true);
    try {
      if (isLoadMore) {
        state = state.copyWith(currentPageAllPosts2: state.currentPageAllPosts2 + 1);
      } else {
        state = state.copyWith(currentPageAllPosts2: 1);
      }

      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}', body: {
        "list_type": "follow",
        "perpage": 10,
        "page": state.currentPageAllPosts2,
      });

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {
          List<CommentInfo> allComments = [];
          for (var post in postModel.postList ?? []) {
            if (post.commentInfo != null) {
              allComments.addAll(post.commentInfo!);
            }
          }

          if (isLoadMore) {
            swipeItems2.clear();
          }

          for (int i = 0; i < (postModel.postList?.length ?? 0); i++) {
            swipeItems2.add(
              SwipeItem(
                content: PostFeedItem(
                  postList: postModel.postList?[i],
                  index: i,
                ),
                superlikeAction: () {
                  final updatedList = List.from(state.swipeItems);
                  updatedList.removeAt(0);
                  state = state.copyWith(swipeItems: [...updatedList]);
                },
                likeAction: () async {
                  await swipeRightToLikePost(() {
                    final updatedList = List.from(state.swipeItems2);
                    updatedList.removeAt(0);
                    state = state.copyWith(swipeItems2: [...updatedList]);
                  }, postModel.postList?[i].id ?? "");
                },
                nopeAction: () async {
                  await swipeLeftToDislikePost(() {
                    final updatedList = List.from(state.swipeItems2);
                    updatedList.removeAt(0);
                    state = state.copyWith(swipeItems2: [...updatedList]);
                  }, postModel.postList?[i].id ?? "");
                },
              ),
            );
          }

          if (isLoadMore) {
            state = state
                .copyWith(isLoading: false, swipeItems2: [...state.swipeItems2, ...swipeItems2]);
            matchEngineFollowing = MatchEngine(swipeItems: [...state.swipeItems2]);
            return;
          }

          state = state.copyWith(
            isLoading: false,
            postList: postModel.postList, // i think the problem is here
            // commentInfoList: allComments,
            swipeItems2: [...swipeItems2],
            totalPagesAllPosts: postModel.pages ?? 0,
          );

          matchEngineFollowing = MatchEngine(swipeItems: [...state.swipeItems2]);
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

  void updateIsDoubleTappedStatus() {
    state = state.copyWith(isDoubleTapped: true);
  }

  Future<void> likePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isSavePost: true);

    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.baseUrl}/post-like/insert', body: {"post_id": postID});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          // await getPostFeed(isPostLoading: true);
          state = state.copyWith(isLiked: false, isDoubleTapped: true);
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

  Future<void> likeUnlikePost(VoidCallback voidCallback, String postID) async {
    state = state.copyWith(isSavePost: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.baseUrl}${AppUrls.likeUnlikePost}', body: {"post_id": postID});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          // await getPostFeed(isPostLikeUnlike: true);
          state = state.copyWith(isLiked: false, isDoubleTapped: false);
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
          url: '${AppUrls.baseUrl}${AppUrls.saveUnsavePost}', body: {"post_id": postID});
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        Map<String, dynamic> jsonData = response.data;

        if (response.statusCode == 200) {
          showToastMessage(jsonData['message']);
          // await getPostFeed(isPostLoading: true);
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
    // state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
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

  Future<void> swipeLeftToDislikePost(VoidCallback voidCallback, String postID) async {
    // state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
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
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
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
          // await getPostFeed(isPostLoading: true);
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
          // await getPostFeed(isPostLoading: true);
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
  }

  void setFvoriteToFalse() {
    state = state.copyWith(isHeartAnimating: false);
  }
}
