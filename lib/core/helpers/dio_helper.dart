import 'package:dio/dio.dart';

class DioHelper {
  DioHelper._();
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: '',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
        Map<String, dynamic>? query,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token == null ? '' : token,
    };
    return await dio.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> deleteData(
      {required String url,
        Map<String, dynamic>? query,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token == null ? '' : token,
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
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token == null ? '' : token,
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang = 'en',
        String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token == null ? '' : token,
    };
    return dio.put(url, queryParameters: query, data: data);
  }
}
