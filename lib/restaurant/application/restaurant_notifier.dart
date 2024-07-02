import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/restaurant/application/restaurant_state.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  RestaurantNotifier(
    this._dio,
    this._hiveDataBase,
  ) : super(const RestaurantState());

  final HiveDatabase _hiveDataBase;
  final Dio _dio;

  RefreshController restaurantRefreshController = RefreshController();

  @override
  void dispose() {
    restaurantRefreshController.dispose();
    super.dispose();
  }

  Future<void> getRestaurants({required BuildContext context}) async {
    try {
      state = state.copyWith(isLoading: true);

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

        state =
            state.copyWith(isLoading: false, restaurantList: restaurantList);
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
}
