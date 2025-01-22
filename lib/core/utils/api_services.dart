import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_app/feature/auth/data/model/auth_model.dart';

class ApiService {
  final String baseUrl = 'https://todo.iraqsapp.com'; 

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phone': phone, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid credentials');
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  Future<void> register(AuthModel authModel) async {
    final url = Uri.parse('$baseUrl/auth/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(authModel.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid credentials');
    } else {
      throw Exception('Failed to register: ${response.statusCode}');
    }
  }
}
