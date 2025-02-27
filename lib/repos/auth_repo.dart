import 'package:either_dart/either.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/cashe/helper_cache.dart';
import 'package:to_do_app/core/utils/Api/api_consumer.dart';
import 'package:to_do_app/core/utils/Api/end_point,apikey.dart';
import 'package:to_do_app/core/utils/errors/exptions.dart';
import 'package:to_do_app/feature/auth/data/models/signIn_model.dart';
import 'package:to_do_app/feature/auth/data/models/signUp_model.dart';

class AuthRepo {
  final ApiConsumer apiConsumer;

  AuthRepo({required this.apiConsumer});

  Future<Either<String, SigninModel>> signin(
      {required String phone, required String pasword}) async {
    try {
      final response = await apiConsumer.post(EndPoint.signIn,
          data: {ApiKey.phone: phone, ApiKey.password: pasword});
      final signInModel = SigninModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(ApiKey.accessToken);
      CacheHelper()
          .saveData(key: ApiKey.accessToken, value: signInModel.accessToken);
      CacheHelper()
          .saveData(key: ApiKey.refreshToken, value: signInModel.refreshToken);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(signInModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, SignUpModel>> signUp(
      {required String phone,
      required String password,
      required String disPlayName,
      required int? experienceYears,
      required String adress,
      required String? level}) async {
    try {
      final response = await apiConsumer.post(EndPoint.signUp, data: {
        ApiKey.phone: phone,
        ApiKey.password: password,
        ApiKey.displayName: disPlayName,
        ApiKey.experienceYears: experienceYears,
        ApiKey.address: adress
      });
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
