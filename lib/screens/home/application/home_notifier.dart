import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/app_urls.dart';
import 'package:for_the_table/core/infrastructure/dio_exceptions.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/core/utils/toast.dart';
import 'package:for_the_table/model/restaurant/restaurantlist_response_model.dart';
import 'package:for_the_table/screens/home/application/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this._dio, this._hiveDatabase) : super(const HomeState());

  // ignore: unused_field
  final Dio _dio;
  // ignore: unused_field
  final HiveDatabase _hiveDatabase;

  Future<void> fetchRestaurants() async {
    try {
      state = state.copyWith(isLoading: true);

      final data = {
        "perpage": 4,
        "page": 1,
      };

      final headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'token': _hiveDatabase.box.get(AppPreferenceKeys.token),
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<Map<String, dynamic>>(
        '${AppUrls.baseUrl}${AppUrls.restaurantList}',
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        final reastaurantListResponseModel = RestaurantlistResponseModel.fromJson(response.data!);

        final List<Restaurant>? restaurantList = reastaurantListResponseModel.restaurantList;

        state = state.copyWith(
          isLoading: false,
          restaurantList: restaurantList,
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
}
