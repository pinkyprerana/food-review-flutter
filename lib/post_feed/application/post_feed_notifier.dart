import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/post_feed/application/post_feed_state.dart';
import 'package:for_the_table/post_feed/domain/postFeed_model.dart';
import '../../core/constants/app_urls.dart';
import '../../core/utils/toast.dart';

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

  Future<void> getPostFeed() async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}');
      state = state.copyWith(isLoading: false);

      if (response == null && dioException == null) {
        showConnectionWasInterruptedToastMessage();
      } else if (dioException != null) {
        showDioError(dioException);
      } else {
        PostModel postModel = PostModel.fromJson(response.data);
        if (postModel.status == 200) {


          final List<DataOfPostModel>? postList = postModel.postList;

          totalNumberOfPosts = postModel.total ?? 0;


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


}
