import 'package:to_do_app/core/utils/Api/end_point,apikey.dart';

class ErrorModel {
  final String message;
  final String errore;
  final int stutusCode;

  ErrorModel(
      {required this.message, required this.errore, required this.stutusCode});

  factory ErrorModel.formJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
        message: jsonData[ApiKey.message],
        errore: jsonData[ApiKey.error],
        stutusCode: jsonData[ApiKey.statusCode]);
  }
}
