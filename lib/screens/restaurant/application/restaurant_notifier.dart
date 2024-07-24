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
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/screens/restaurant/application/restaurant_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../post_feed/domain/postFeed_model.dart';

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  RestaurantNotifier(this._dio, this._hiveDataBase, this._networkApiService)
      : super(const RestaurantState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;
  final NetworkApiService _networkApiService;

  int totalNumberOfRestaurants = 0;
  Restaurant? reastaurantDetials;

  RefreshController restaurantRefreshController = RefreshController();
  RefreshController restaurantRefreshController2 = RefreshController();

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
    if (state.currentPage > state.totalPages) {
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
              url: '${AppUrls.BASE_URL}${AppUrls.getPostFeed}',
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
        '${AppUrls.BASE_URL}${AppUrls.postListPerRestaurant}',
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
      state = state.copyWith(isLoading: true);

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
        '${AppUrls.BASE_URL}${AppUrls.saveRestaurant}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('response ----->> $response');

        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      } else {
        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

        state = state.copyWith(isLoading: false);
      }
    } on DioException catch (e) {
      final error = DioExceptions.fromDioError(e).message;
      showToastMessage(error, errorMessage: 'Failed to save/unsave restaurant');

      state = state.copyWith(isLoading: false);
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
        '${AppUrls.BASE_URL}${AppUrls.restaurnatDetails}',
        data: data,
      );
      if (response.statusCode == 200 && response.data != null) {
        AppLog.log('restaurant details----->> $response');

        AppLog.log('response.data ======== ${response.data}');

        // reastaurantDetials = Restaurant.fromJson(response.data ?? {});

        // AppLog.log(
        //     'Restaurant-details variable ------->>>${reastaurantDetials.toString()}');

        final message = response.data?['message'] as String?;
        showToastMessage(message ?? '');

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
}
