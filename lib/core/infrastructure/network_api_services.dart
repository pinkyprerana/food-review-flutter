import 'package:dio/dio.dart';

import '../utils/app_log.dart';
import 'base_api_services.dart';
import 'hive_database.dart';

class NetworkApiService implements BaseApiServices {
  NetworkApiService(
    this._dio,
    this._hiveDatabase,
  ) : super();

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  @override
  Future<(dynamic, DioException?)> getApiRequest(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return (response, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }

  @override
  Future<(dynamic, DioException?)> getApiRequestWithToken(
      {required String url}) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${_hiveDatabase.box.get(AppPreferenceKeys.token)}',
        'x-access-token': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
      };
      AppLog.log(_hiveDatabase.box.get(AppPreferenceKeys.token));
      _dio.options.headers.addAll(headers);
      final returnResponse = await _dio.get(url);
      return (returnResponse, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      AppLog.log(e.toString());

      return (null, null);
    }
  }

  @override
  Future<(dynamic, DioException?)> postApiRequest({
    required String url,
    required Object? body,
  }) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post(
        url,
        data: body,
      );

      return (response, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }

  // @override
  // Future<(dynamic, DioException?)> shopifyPostApiRequest({
  //   required String url,
  //   required Object? body,
  // }) async {
  //   try {
  //     var headers = {
  //       'Accept': '*/*',
  //       'Content-Type': 'application/json',
  //       'Access-Key': 'jH@k\$8L&2p!sZ#9y', // Add your Access-Key here
  //     };

  //     _dio.options.headers.addAll(headers);

  //     final response = await _dio.post(
  //       url,
  //       data: body,
  //     );

  //     return (response, null);
  //   } on DioException catch (e) {
  //     return (null, e);
  //   } catch (e) {
  //     return (null, null);
  //   }
  // }

  @override
  Future<(dynamic, DioException?)> postApiRequestWithToken({
    required String url,
    Object? body,
  }) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${_hiveDatabase.box.get(AppPreferenceKeys.token)}',
        'x-access-token': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
      };

      _dio.options.headers.addAll(headers);
      final returnResponse = await _dio.post(url, data: body);

      return (returnResponse, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }

  @override
  Future<(dynamic, DioException?)> deleteApiRequestWithToken(
      {required String url, Object? body}) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Authorization':
            'Bearer ${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
      };

      _dio.options.headers.addAll(headers);
      final returnResponse = await _dio.delete(
        url,
        data: body,
      );

      return (returnResponse, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }
}
