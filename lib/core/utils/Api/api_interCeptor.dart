import 'package:dio/dio.dart';
import 'package:to_do_app/cashe/helper_cache.dart';
import 'package:to_do_app/core/utils/Api/end_point,apikey.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    String accessToken = CacheHelper().getData(key: ApiKey.accessToken);
    String refreshToken = CacheHelper().getData(key: ApiKey.refreshToken);
    print('refreshToken = $refreshToken');

    print('accesToken = $accessToken');
    options.headers[ApiKey.accessToken] =
        'Bearer ${CacheHelper().getData(key: ApiKey.accessToken)}';
    options.headers[ApiKey.refreshToken] = 'Bearer $refreshToken';
  }
}
