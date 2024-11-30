abstract class ApiConsumer {
  Future<dynamic> get(String url, {Map<String, dynamic> ? querParmeter});
  Future<dynamic> post(String url, Map<String, dynamic>? data,
      {Map<String, dynamic>? querParmeter});
}
