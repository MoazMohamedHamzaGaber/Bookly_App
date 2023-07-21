import 'package:dio/dio.dart';

class ApiService
{
  static late Dio dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://www.googleapis.com/books/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static  Future<Response> get({
  required String url,
    dynamic query,
})async
  {
    return await dio.get(
        url,
      queryParameters: query,
    );
  }

  static  Future<Response> post({
    required String url,
    dynamic data,
  })async
  {
    return await dio.post(
      url,
      data: data,
    );
  }
}