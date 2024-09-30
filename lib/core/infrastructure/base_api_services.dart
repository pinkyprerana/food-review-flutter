abstract class BaseApiServices {
  Future<dynamic> getApiRequest({required String url});
  Future<dynamic> getApiRequestWithToken({required String url});
  Future<dynamic> postApiRequest({required String url, required Object? body});
  Future<dynamic> postApiRequestWithToken({required String url, Object? body});
  Future<dynamic> deleteApiRequestWithToken(
      {required String url, Object? body});
}
