import 'package:dio/dio.dart';

class NetworkError {
  final String message;

  NetworkError(this.message);

  factory NetworkError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.badResponse:
        return NetworkError('Response error: ${dioError.response?.statusCode}');
      case DioExceptionType.connectionTimeout:
        return NetworkError('Connection timeout');
      case DioExceptionType.receiveTimeout:
        return NetworkError('Receive timeout');
      case DioExceptionType.sendTimeout:
        return NetworkError('Send timeout');
      default:
        return NetworkError('Unknown error occurred');
    }
  }
}
