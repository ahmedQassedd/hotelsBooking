import 'package:dio/dio.dart';
import 'package:hotels_booking/core/util/network/remote/end_points.dart';

class DioHelper {
  static Dio? dio;

  DioHelper._internal(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static final DioHelper _instance = DioHelper._internal();


  factory DioHelper (){
    return _instance ;
  }




  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'token': token,
    };

    return await dio!.get(endPoint, queryParameters: query);
  }




  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'token': token ,
    };

    return await dio!.post(endPoint, queryParameters: query, data: data);
  }


  static Future<Response> postDataWithImage({
    required String endPoint,
    Map<String, dynamic>? query,
    required FormData data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'multipart/form-data',
      'token': token ,
    };

    return await dio!.post(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'token': token
    };

    return await dio!.put(endPoint, queryParameters: query, data: data);
  }



}
