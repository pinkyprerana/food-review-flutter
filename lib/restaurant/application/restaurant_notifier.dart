import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/restaurant/application/restaurant_state.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../post_feed/domain/postFeed_model.dart';

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  RestaurantNotifier(
    this._dio,
    this._hiveDataBase,
      this._networkApiService
  ) : super(const RestaurantState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;

  int totalNumberOfRestaurants = 0;

  RefreshController restaurantRefreshController = RefreshController();

  @override
  void dispose() {
    restaurantRefreshController.dispose();
    super.dispose();
  }

  Future<void> loadMoreRestaurants(BuildContext context) async {
    AppLog.log('state.currentPage: ------->> ${state.currentPage}');
    if (state.currentPage > state.totalPages) {
      showToastMessage('No more restaurants');
      restaurantRefreshController.loadComplete();
      return;
    }

    await getRestaurants(context: context, isLoadMore: true);
    restaurantRefreshController.loadComplete();
  }

  Future<void> getRestaurants({
    required BuildContext context,
    bool isLoadMore = false,
  }) async {
    AppLog.log('state.currentPage ======== ${state.currentPage}');
    try {
      state = state.copyWith(isLoading: !isLoadMore);

      if (isLoadMore) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      }

      final data = {
        "perpage": 10,
        "page": state.currentPage,
        "search": "",
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final reastaurantListResponseModel =
            RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList =
            reastaurantListResponseModel.restaurantList;

        totalNumberOfRestaurants = reastaurantListResponseModel.total ?? 0;

        state = state.copyWith(
          isLoading: false,
          restaurantList: [
            ...state.restaurantList ?? [],
            ...restaurantList ?? []
          ],
          totalPages: reastaurantListResponseModel.pages ?? 0,
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isLoading: false);
    }
  }


  Future<void> getHomeRestaurants({
    required BuildContext context,
    bool isLoadMore = false,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final data = {
        "perpage": 4,
        "page": 1,
        "search": "",
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.BASE_URL}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final reastaurantListResponseModel =
            RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList =
            reastaurantListResponseModel.restaurantList;

        totalNumberOfRestaurants = reastaurantListResponseModel.total ?? 0;

        state = state.copyWith(
          isLoading: false,
          homeRestaurantList: restaurantList,
          // restaurantList: [
          //   ...state.restaurantList ?? [],
          //   ...restaurantList ?? []
          // ],
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getPostListRelatedToRestaurant(VoidCallback voidCallback, String restaurantId ) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService.postApiRequestWithToken(
          url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}',
          body:
          {
            "lat": "29.95106579999999",
            "lng":  "-90.0715323",
            'restaurant_id': restaurantId//"668d35376a30ef22a21e2f06"
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
}
