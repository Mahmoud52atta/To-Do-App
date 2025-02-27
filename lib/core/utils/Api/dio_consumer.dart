import 'package:dio/dio.dart';
import 'package:to_do_app/core/utils/Api/api_consumer.dart';
import 'package:to_do_app/core/utils/Api/api_interCeptor.dart';
import 'package:to_do_app/core/utils/Api/end_point,apikey.dart';
import 'package:to_do_app/core/utils/errors/exptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? quryParaMeter}) async {
    try {
      final response =
          await dio.delete(path, data: data, queryParameters: quryParaMeter);
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future get(String path,
      {dynamic data, Map<String, dynamic>? quryParaMeter}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: quryParaMeter);
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? quryParaMeter}) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: quryParaMeter);
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? quryParaMeter}) async {
    try {
      final response =
          await dio.put(path, data: data, queryParameters: quryParaMeter);
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }
}
