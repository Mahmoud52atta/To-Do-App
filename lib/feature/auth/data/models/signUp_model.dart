import 'package:to_do_app/core/utils/Api/end_point,apikey.dart';

class SignUpModel {
  final String id;
  final String accessToken;
  final String refreshToken;
  final String disPlayName;

  SignUpModel(
      {required this.id,
      required this.accessToken,
      required this.disPlayName,
      required this.refreshToken});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        id: jsonData[ApiKey.id].toString(),
        disPlayName: jsonData[ApiKey.displayName],
        accessToken: jsonData[ApiKey.accessToken].toString(),
        refreshToken: jsonData[ApiKey.refreshToken].toString());
  }
}
