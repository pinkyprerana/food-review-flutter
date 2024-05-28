// ignore_for_file: parameter_assignments, empty_catches

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/infrastructure/hive_database.dart';
import 'package:for_the_table/splash/application/splash_state.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier(this._dio, this._hiveDatabase) : super(const SplashState());

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  // Future<void> getProfile({
  //   required Function(ProfileModel) onSuccess,
  //   required VoidCallback onFailed,
  // }) async {
  //   try {
  //     var headers = {
  //       'Accept': '*/*',
  //       'Content-Type': 'application/json',
  //       'x-access-token': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
  //     };

  //     _dio.options.headers.addAll(headers);

  //     final response = await _dio.get('/user/profile');

  //     if (response.statusCode == 200) {
  //       final profileResponse = ProfileModel.fromJson(response.data["data"]);
  //       onSuccess(profileResponse);
  //     } else {
  //       onFailed();
  //     }
  //   } on DioException catch (e) {
  //     onFailed();

  //     final error = DioExceptions.fromDioError(e).message;
  //     await showToastMessage(error);
  //   }
  // }
}
