import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('not authorized need to refresh${response.statusCode}');
    } else if (response.statusCode == 402) {
      throw Exception(' refresh failed${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Postman-Token': '<calculated when request is sent>'
    };
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('not authorized need to refresh${response.body}');
    } else if (response.statusCode == 402) {
      throw Exception(' refresh failed${response.statusCode}');
    }
    // return  jsonDecode(response.body);
  }
}
