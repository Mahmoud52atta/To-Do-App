abstract class ApiConsumer {
  Future<dynamic> post(String path,
      {Map<String, dynamic> data, Map<String, dynamic>? quryParaMeter});
  Future<dynamic> get(String path,
      {Map<String, dynamic> data, Map<String, dynamic>? quryParaMeter});
  Future<dynamic> put(String path,
      {Map<String, dynamic> data, Map<String, dynamic>? quryParaMeter});
  Future<dynamic> delete(String path,
      {Map<String, dynamic> data, Map<String, dynamic>? quryParaMeter});
}
