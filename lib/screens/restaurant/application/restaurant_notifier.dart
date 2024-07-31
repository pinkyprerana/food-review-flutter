import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/infrastructure/network_api_services.dart';
import 'package:for_the_table/core/utils/app_log.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/model/restaurant/postlist_per_restaurant_response_model.dart';
import 'package:for_the_table/model/restaurant/restaurant_details_model.dart';
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/model/restaurant/saved_restaurants_response_model.dart';
import 'package:for_the_table/screens/post_feed/domain/post_feed_model.dart';
import 'package:for_the_table/screens/restaurant/application/restaurant_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  RestaurantNotifier(this._dio, this._hiveDataBase, this._networkApiService)
      : super(const RestaurantState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;

  RestaurantDetailsModel? reastaurantDetials;

  RefreshController restaurantRefreshController = RefreshController();
  RefreshController restaurantRefreshController2 = RefreshController();
  RefreshController savedRestaurantRefreshController = RefreshController();

  @override
  void dispose() {
    restaurantRefreshController.dispose();
    super.dispose();
  }

  void clearStateVariables() {
    state = state.copyWith(totalPagesPosts: 0);
    state = state.copyWith(currentPageForPosts: 1);
    state = state.copyWith(postPerRestaurantList: []);
    AppLog.log('state.totalPagesPosts ------>> ${state.totalPagesPosts}');
    AppLog.log(
        'state.currentPageForPosts ------>> ${state.currentPageForPosts}');
    AppLog.log(
        'state.postPerRestaurantList ------>> ${state.postPerRestaurantList}');
  }

  Future<void> loadMoreRestaurants(BuildContext context) async {
    AppLog.log('state.currentPage: ------->> ${state.currentPage}');
    if (state.currentPage >= state.totalPages) {
      showToastMessage('No more restaurants');
      restaurantRefreshController.loadComplete();
      return;
    }

    await getRestaurants(isLoadMore: true);
    restaurantRefreshController.loadComplete();
  }

  Future<void> getRestaurants({
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
        '${AppUrls.baseUrl}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final reastaurantListResponseModel =
            RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList =
            reastaurantListResponseModel.restaurantList;

        if (isLoadMore) {
          state = state.copyWith(
            isLoading: false,
            restaurantList: [
              ...state.restaurantList ?? [],
              ...restaurantList ?? []
            ],
            totalPages: reastaurantListResponseModel.pages ?? 0,
            totalNumberOfRestaurants: reastaurantListResponseModel.total ?? 0,
          );
          return;
        }

        state = state.copyWith(
          isLoading: false,
          restaurantList: [...restaurantList ?? []],
          totalPages: reastaurantListResponseModel.pages ?? 0,
          totalNumberOfRestaurants: reastaurantListResponseModel.total ?? 0,
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
        '${AppUrls.baseUrl}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final reastaurantListResponseModel =
            RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList =
            reastaurantListResponseModel.restaurantList;

        state = state.copyWith(
            isLoading: false,
            homeRestaurantList: restaurantList,
            totalNumberOfRestaurants: reastaurantListResponseModel.total ?? 0
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

  String? get userId => _hiveDataBase.box.get(AppPreferenceKeys.userId);
  String? get getLatitude => _hiveDataBase.box.get(AppPreferenceKeys.latitude);
  String? get getLongitude =>
      _hiveDataBase.box.get(AppPreferenceKeys.longitude);

  Future<void> getPostListRelatedToRestaurant(
      VoidCallback voidCallback, String restaurantId) async {
    state = state.copyWith(isLoading: true);
    try {
      var (response, dioException) = await _networkApiService
          .postApiRequestWithToken(
              url: '${AppUrls.baseUrl}${AppUrls.getPostFeed}',
              body: {
            "lat": getLatitude,
            "lng": getLongitude,
            'restaurant_id': restaurantId, //"668d35376a30ef22a21e2f06"
            'user_id': userId
          });
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

  Future<void> loadMorePosts(BuildContext context, String? restaurantId) async {
    AppLog.log(
        'state.currentPageForPosts: ------->> ${state.currentPageForPosts}');
    if (state.currentPageForPosts >= state.totalPagesPosts) {
      showToastMessage('No more posts');
      restaurantRefreshController2.loadComplete();
      return;
    }

    await getPosts(
        context: context, restaurantId: restaurantId, isLoadMore: true);
    restaurantRefreshController2.loadComplete();
  }

  Future<void> getPosts(
      {required BuildContext context,
      bool isLoadMore = false,
      required String? restaurantId}) async {
    AppLog.log(
        'state.currentPageForPosts ======== ${state.currentPageForPosts}');
    try {
      state = state.copyWith(isLoadingForPosts: !isLoadMore);

      if (isLoadMore) {
        state =
            state.copyWith(currentPageForPosts: state.currentPageForPosts + 1);
      }

      final data = {
        "serach_keyword": "",
        "perpage": 5,
        "page": state.currentPageForPosts,
        "lat": _hiveDataBase.box.get(AppPreferenceKeys.latitude),
        "lng": _hiveDataBase.box.get(AppPreferenceKeys.longitude),
        "restaurant_id": restaurantId,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.postListPerRestaurant}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('response ---->> $response');
        final postlistPerRestaurantResponseModel =
            PostlistPerRestaurantResponseModel.fromJson(response.data!);

        final List<Post>? postList =
            postlistPerRestaurantResponseModel.postList;

        state = state.copyWith(
          isLoadingForPosts: false,
          postPerRestaurantList: [
            ...state.postPerRestaurantList ?? [],
            ...postList ?? []
          ],
          totalPagesPosts: postlistPerRestaurantResponseModel.pages ?? 0,
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingForPosts: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get posts');

      state = state.copyWith(isLoadingForPosts: false);
    }
  }

  Future<void> saveRestaurant(String restaurantID) async {
    AppLog.log('restaurantID------------->>>> $restaurantID');
    try {
      state = state.copyWith(isLoadingSaveRestaurant: true);

      final data = {
        "restaurant_id": restaurantID,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.saveRestaurant}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('response ----->> $response');

        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        await getSavedRestaurants();

        state = state.copyWith(isLoadingSaveRestaurant: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingSaveRestaurant: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to save/unsave restaurant');

      state = state.copyWith(isLoadingSaveRestaurant: false);
    }
  }

  Future<void> restaurantDetails(String restaurantId) async {
    AppLog.log('restaurantID------------->>>> $restaurantId');
    try {
      state = state.copyWith(isLoadingForRestaurantDetails: true);

      final data = {
        "restaurant_id": restaurantId,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.restaurnatDetails}',
        data: data,
      );
      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('restaurant details----->> $response');

        AppLog.log('response.data ======== ${response.data}');

        reastaurantDetials =
            RestaurantDetailsModel.fromJson(response.data ?? {});

        // AppLog.log(
        //     'Restaurant-details variable ------->>>${reastaurantDetials.toString()}');

        // final message = response.data?['message'] as String?;
        // showToastMessage(message ?? '');

        state = state.copyWith(isLoadingForRestaurantDetails: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingForRestaurantDetails: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurant details');

      state = state.copyWith(isLoadingForRestaurantDetails: false);
    }
  }

  Future<void> loadMoreSavedRestaurants() async {
    if (state.currentPageForSavedRestaurantList >=
        state.totalPagesForSavedRestaurantList) {
      showToastMessage('No more restaurants');
      savedRestaurantRefreshController.loadComplete();
      return;
    }

    await getSavedRestaurants(isLoadMore: true);
    AppLog.log('more saved restaurants are called');
    savedRestaurantRefreshController.loadComplete();
  }

  Future<void> getSavedRestaurants({bool isLoadMore = false}) async {
    try {
      state = state.copyWith(isLoadingSaveRestaurantList: !isLoadMore);

      if (isLoadMore) {
        state = state.copyWith(
            currentPageForSavedRestaurantList:
                state.currentPageForSavedRestaurantList + 1);
      }

      final data = {
        "search": "",
        "perpage": 10,
        "page": state.currentPageForSavedRestaurantList,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDataBase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.getSavedRestaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('RESPONSE:------------ $response');
        final savedRestaurantsResponseModel =
            SavedRestaurantsResponseModel.fromJson(response.data!);

        final List<SavedRestaurant>? savedRestaurantList =
            savedRestaurantsResponseModel.savedRestaurantList;

        if (isLoadMore) {
          state = state.copyWith(
            isLoadingSaveRestaurantList: false,
            savedRestaurantList: [
              ...state.savedRestaurantList ?? [],
              ...savedRestaurantList ?? [],
            ],
            totalPagesForSavedRestaurantList:
                savedRestaurantsResponseModel.pages ?? 0,
          );

          return;
        }

        state = state.copyWith(
          isLoadingSaveRestaurantList: false,
          savedRestaurantList: [
            ...savedRestaurantList ?? [],
          ],
          totalPagesForSavedRestaurantList:
              savedRestaurantsResponseModel.pages ?? 0,
        );
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoadingSaveRestaurantList: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to get restaurants');

      state = state.copyWith(isLoadingSaveRestaurantList: false);
    }
  }

  void sliderValueUpdate(double value) {
    state = state.copyWith(sliderValue: value);
    AppLog.log('state.sliderValue -------->> ${state.sliderValue}');
  }

  void clearStateSliderValue() {
    state = state.copyWith(sliderValue: 0);
  }
}
