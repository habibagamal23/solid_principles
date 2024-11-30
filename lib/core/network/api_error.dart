import 'package:dio/dio.dart';

class ApiError {
  final String message;

  ApiError(this.message);

  factory ApiError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.badResponse:
        return ApiError('Response error: ${dioError.response?.statusCode}');
      case DioExceptionType.connectionTimeout:
        return ApiError('Connection timeout');
      case DioExceptionType.receiveTimeout:
        return ApiError('Receive timeout');
      case DioExceptionType.sendTimeout:
        return ApiError('Send timeout');
      default:
        return ApiError('Unknown error occurred');
    }
  }

}
