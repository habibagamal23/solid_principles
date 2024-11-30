
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// single res
class DioFcatory {
  static Dio getDio() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      responseBody: true,
      requestBody: true,
      error: true,
      request: true,
    ));
    return dio;
  }
}
