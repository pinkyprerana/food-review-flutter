import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/screens/home/application/home_state.dart';
import 'package:for_the_table/screens/home/domain/post_model.dart';
import 'package:for_the_table/screens/home/presentation/widgets/post_feed_item.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._dio, this._hiveDatabase, this._networkApiService) : super(const HomeState());

  // ignore: unused_field
  final Dio _dio;
  final HiveDatabase _hiveDatabase;
  final NetworkApiService _networkApiService;

  TextEditingController commentController = TextEditingController();
  List<SwipeItem> swipeItems = [];
  List<SwipeItem> swipeItems2 = [];
  int count = 0;
  MatchEngine? matchEngine;
  MatchEngine? matchEngineFollowing;

  void setIsExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void selectButton(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void emptyAllPosts() {
    state = state.copyWith(isAllPostStackFinished: true);
  }

  void emptyFollowingPosts() {
    state = state.copyWith(isFollowingPostStackFinished: true);
  }

  final TextEditingController searchTextController = TextEditingController();
  int totalNumberOfPosts = 0;

  String? get userId => _hiveDatabase.box.get(AppPreferenceKeys.userId);
  String? get getLatitude => _hiveDatabase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude => _hiveDatabase.box.get(AppPreferenceKeys.longitude);

  // void loadMorePosts() async {
  //   if (state.currentPage > state.totalPages) {
  //     showToastMessage('No new posts to display');
  //     return;
  //   }

  //   await fetchPosts(isLoadMore: true);
  // }

  // Future<void> fetchPosts({bool isLoadMore = false}) async {
  //   state = state.copyWith(isLoading: !isLoadMore);

  //   if (isLoadMore && (state.currentPage * 10 == state.postList?.length)) {
  //     state = state.copyWith(currentPage: state.currentPage + 1);
  //   } else {
  //     state = state.copyWith(currentPage: 1);
  //   }

  //   final FormData formData = FormData.fromMap({
  //     "perpage": 10,
  //     "page": state.currentPage,
  //     "list_type": "list",
  //   });

  //   var headers = {
  //     'Accept': '*/*',
  //     'Content-Type': 'application/json',
  //     'token': await _hiveDatabase.box.get(AppPreferenceKeys.token),
  //   };

  //   _dio.options.headers.addAll(headers);

  //   try {
  //     var response = await _dio.post(
  //       "/post/list",
  //       data: formData,
  //     );

  //     if (response.statusCode == 200 && response.data != null) {
  //       PostModel postModel = PostModel.fromJson(response.data);
  //       final posts = postModel.postList;

  //       if (isLoadMore) {
  //         final currentPostsIds = state.postList?.map((post) => post.id).toSet();

  //         final uniqueNewPosts =
  //             posts?.where((post) => !(currentPostsIds?.contains(post.id) ?? false)).toList();

  //         if ((uniqueNewPosts?.isEmpty ?? false) && isLoadMore) {
  //           showToastMessage('No new posts to display.');
  //         }

  //         state = state.copyWith(
  //           isLoading: false,
  //           postList: [
  //             ...state.postList ?? [],
  //             ...uniqueNewPosts ?? [],
  //           ],
  //         );

  //         return;
  //       }

  //       state = state.copyWith(
  //         isLoading: false,
  //         postList: posts ?? [],
  //         totalPages: postModel.pages ?? 0,
  //       );
  //     }
  //   } on DioException catch (e) {
  //     final error = DioExceptions.fromDioError(e).message;
  //     showToastMessage(error, errorMessage: 'Something went wrong, please try again');
  //     state = state.copyWith(isLoading: false);
  //   }
  // }

  Future<void> loadMorePostFeed() async {
    if (state.currentPageAllPosts >= state.totalPagesAllPosts) {
      emptyAllPosts();
      showToastMessage('No more posts');
      return;
    }

    await getPostFeed(isLoadMore: true);
  }

  Future<void> getPostFeed({bool isLoadMore = false}) async {
    state = state.copyWith(isLoading: !isLoadMore);

    if (isLoadMore) {
      state = state.copyWith(currentPageAllPosts: state.currentPageAllPosts + 1);
    } else {
      state = state.copyWith(currentPageAllPosts: 1, allSwipeItems: []);
      swipeItems = [];
    }

    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
        url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
        body: {
          "list_type": "list",
          "perpage": 10,
          "page": state.currentPageAllPosts,
        },
      );

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
        state = state.copyWith(isLoading: false);
      } else if (dioException != null) {
        showDioError(dioException);
        state = state.copyWith(isLoading: false);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);

        if (postModel.status == 200) {
          List<Comment> allComments = [];

          for (Post post in postModel.postList ?? []) {
            if (post.commentInfo != null) {
              allComments.addAll(post.commentInfo!);
            }
          }

          if (isLoadMore) {
            swipeItems.clear();
          }

          for (int i = 0; i < (postModel.postList?.length ?? 0); i++) {
            swipeItems.add(
              SwipeItem(
                content: PostFeedItem(
                  post: postModel.postList?[i] ?? const Post(),
                  index: i,
                ),
                superlikeAction: () {
                  final updatedList = List.from(state.allSwipeItems);
                  updatedList.removeAt(0);
                  state = state.copyWith(allSwipeItems: [...updatedList]);
                },
                likeAction: () async {
                  final updatedList = List.from(state.allSwipeItems);
                  updatedList.removeAt(0);
                  state = state.copyWith(allSwipeItems: [...updatedList]);
                  await swipeRightToLikePost(() {}, postModel.postList?[i].id ?? "");
                },
                nopeAction: () async {
                  final updatedList = List.from(state.allSwipeItems);
                  updatedList.removeAt(0);
                  state = state.copyWith(allSwipeItems: [...updatedList]);
                  await swipeLeftToDislikePost(() {}, postModel.postList?[i].id ?? "");
                },
              ),
            );
          }

          if (isLoadMore) {
            final newSwipeItems = [...state.allSwipeItems, ...swipeItems];
            state = state.copyWith(isLoading: false, allSwipeItems: [...newSwipeItems]);

            swipeItems.clear();
            swipeItems.addAll(newSwipeItems);

            matchEngine = MatchEngine(swipeItems: [...swipeItems]);

            return;
          }

          final doubleTapList = List.generate(swipeItems.length, (index) => false);

          state = state.copyWith(
            isLoading: false,
            postList: postModel.postList, // i think the problem is here
            commentsList: allComments,
            allSwipeItems: [...swipeItems],
            totalPagesAllPosts: postModel.pages ?? 0,
            doubleTapList: doubleTapList,
          );

          matchEngine = MatchEngine(swipeItems: [...state.allSwipeItems]);
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

  Future<void> loadMoreFollowingPostFeed() async {
    if (state.currentPageAllPosts2 >= state.totalPagesAllPosts) {
      emptyFollowingPosts();
      showToastMessage('No more posts');
      return;
    }

    await getFollowingPostFeed(isLoadMore: true);
  }

  Future<void> getFollowingPostFeed({bool isLoadMore = false}) async {
    state = state.copyWith(isLoading: true);

    if (isLoadMore) {
      state = state.copyWith(currentPageAllPosts2: state.currentPageAllPosts2 + 1);
    } else {
      state = state.copyWith(currentPageAllPosts2: 1, followingSwipeItems: []);
      swipeItems2 = [];
    }

    try {
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

        List<Comment> allComments = [];

        for (Post post in postModel.postList ?? []) {
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
                post: postModel.postList?[i] ?? const Post(),
                index: i,
              ),
              superlikeAction: () {
                final updatedList = List.from(state.allSwipeItems);
                updatedList.removeAt(0);
                state = state.copyWith(followingSwipeItems: [...updatedList]);
              },
              likeAction: () async {
                await swipeRightToLikePost(() {
                  final updatedList = List.from(state.followingSwipeItems);
                  updatedList.removeAt(0);
                  state = state.copyWith(followingSwipeItems: [...updatedList]);
                }, postModel.postList?[i].id ?? "");
              },
              nopeAction: () async {
                await swipeLeftToDislikePost(() {
                  final updatedList = List.from(state.followingSwipeItems);
                  updatedList.removeAt(0);
                  state = state.copyWith(followingSwipeItems: [...updatedList]);
                }, postModel.postList?[i].id ?? "");
              },
            ),
          );
        }

        if (isLoadMore) {
          final newSwipeItems = [...state.followingSwipeItems, ...swipeItems2];
          state = state.copyWith(isLoading: false, followingSwipeItems: [...newSwipeItems]);

          swipeItems2.clear();
          swipeItems2.addAll(newSwipeItems);

          matchEngineFollowing = MatchEngine(swipeItems: [...swipeItems2]);
          return;
        }

        state = state.copyWith(
          isLoading: false,
          postList: postModel.postList, // i think the problem is here
          commentsList: allComments,
          followingSwipeItems: [...swipeItems2],
          totalPagesAllPosts: postModel.pages ?? 0,
        );

        matchEngineFollowing = MatchEngine(swipeItems: [...state.followingSwipeItems]);
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
