import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hack_talk/core/utils/app_strings.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'cache_helper.dart';

class DioHelper {
  DioHelper._();
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://063c-197-43-155-173.ngrok-free.app/api/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
    }
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': lang,
      'Authorization':
          'Bearer ${CacheHelper.getData(key: AppStrings.token) ?? ''}',
    };
    return await dio.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> deleteData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': lang,
      'Authorization':
          'Bearer ${CacheHelper.getData(key: AppStrings.token) ?? ''}',
    };
    return dio.delete(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': lang,
      'Authorization':
          'Bearer ${CacheHelper.getData(key: AppStrings.token) ?? ''}',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'en'}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'lang': lang,
      'Authorization':
          'Bearer ${CacheHelper.getData(key: AppStrings.token) ?? ''}',
    };
    return dio.put(url, queryParameters: query, data: data);
  }
}
