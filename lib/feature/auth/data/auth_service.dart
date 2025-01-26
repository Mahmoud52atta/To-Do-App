import 'dart:convert';

import 'package:to_do_app/core/utils/sevices_help.dart';
import 'package:to_do_app/feature/auth/data/model/auth_model.dart';

class AuthServise {
  //
  final String baseUrl = 'https://todo.iraqsapp.com';

  // PostRegesterService(AuthModel authmodel);
  Future<AuthModel> regester(AuthModel authModel) async {
    Map<String, dynamic>? data = await Api().post(
      url: '$baseUrl/auth/register',
      body: jsonEncode(authModel.toJson()),

      //
    );
    print('API Response: $data');
    return AuthModel.fromJson(data);
  }

  Future<Map<String, dynamic>?> login(
      {required String? phone, required String? password}) async {
    Map<String, dynamic>? data = await Api().post(
      url: '$baseUrl/auth/login',
      body: jsonEncode({'phone': phone, 'password': password}),
    );
    return data;
  }

  Future<Map<String, dynamic>> logOut({required String token}) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/auth/logout',
      body: jsonEncode({'token': token}),
    );
    return data;
  }

  Future<Map<String, dynamic>> profile() async {
    Map<String, dynamic> data = await Api().get(url: '$baseUrl/auth/profile');
    return data;
  }
}
