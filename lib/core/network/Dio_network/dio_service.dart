import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_consumer.dart';

class DioService implements ApiConsumer {
  final Dio _dio;

  DioService(this._dio);

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future post(String path, {Map<String, dynamic>? data}) async {
    return _dio.post(path, data: data);
  }
}
