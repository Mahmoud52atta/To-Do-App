import 'package:to_do_app/core/utils/Api/end_point,apikey.dart';

class SigninModel {
  final String id;
  final String accessToken;
  final String refreshToken;

  SigninModel(
      {required this.id,
      required this.accessToken,
      required this.refreshToken});

  factory SigninModel.fromJson(Map<String, dynamic> jsonData) {
    return SigninModel(
        id: jsonData[ApiKey.id].toString(),
        accessToken: jsonData[ApiKey.accessToken].toString(),
        refreshToken: jsonData[ApiKey.refreshToken].toString());
  }
}
