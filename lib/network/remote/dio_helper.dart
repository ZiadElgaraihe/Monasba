import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.1.12:2000/api/v1/auth/",
        receiveDataWhenStatusError: true,
        // headers:
      ),
    );
  }

  Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
  }) async {
    return await //a added
        dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String? url,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url!,
      data: data,
    );
  }
}
