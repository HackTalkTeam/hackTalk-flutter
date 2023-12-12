import 'package:dio/dio.dart';

abstract class DioHelper {
  Future<Response> getDio(String url,
      {Map<String, dynamic>? query, String lang = 'en', String? token});

  Future<Response> postDio(String url,
      {Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token});
}

class DioHelperImp implements DioHelper {
  final Dio dio;
  DioHelperImp({required this.dio});

  @override
  Future<Response> getDio(String url,
      {Map<String, dynamic>? query, String lang = 'en', String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------

  @override
  Future<Response> postDio(String url,
      {Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.post(url, queryParameters: query, data: data);
  }
}
