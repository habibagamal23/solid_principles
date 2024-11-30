import 'package:dio/dio.dart';
import 'package:solid_p/core/network/Api_constant.dart';
import 'package:solid_p/core/network/apiConsumer.dart';

import '../error/expentions.dart';
import 'api_error.dart';

class DioService implements ApiConsumer {
  final Dio dio;

  DioService({required this.dio}) ;

  @override
  Future get(String url, {Map<String, dynamic>? querParmeter}) async {
    try {
      final response = await dio.get(url, queryParameters: querParmeter);
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(String url, Map<String, dynamic>? data,
      {Map<String, dynamic>? querParmeter}) async {
    try {
      final res =
          await dio.post(url, data: data, queryParameters: querParmeter);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
