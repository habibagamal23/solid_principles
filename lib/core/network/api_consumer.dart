// for open closed and insterface segengtion
abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {Map<String, dynamic>? data});
}