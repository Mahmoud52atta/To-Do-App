import 'package:bloc/bloc.dart';
import 'package:to_do_app/core/utils/api_services.dart';
import 'package:to_do_app/feature/auth/data/model/auth_model.dart';
import 'package:to_do_app/feature/auth/data/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.postRegesterService,
  ) : super(AuthInitial());
  // final ApiService apiService;
  final AuthServise postRegesterService;

  Future<void> login(String phone, String password) async {
    emit(AuthLoading());
    try {
      postRegesterService.login(phone: phone, password: password);
      // final token = response['access_token'];
      // final refreshToken = response['refresh_token'];

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(AuthModel authModel) async {
    emit(AuthLoading());

    // final response =await postRegesterService.regester(phone:phone , password: password, disableName: disableName, experiance: experiance, address: address, level: level, token: token);
    try {
      postRegesterService.regester(authModel);
      // final token = response['access_token'];
      // // تأكد من إرجاع القيمة هنا
      // final refreshToken = response['refresh_token'];

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logOut(String token) async {
    emit(AuthLoading());

    // final response =await postRegesterService.regester(phone:phone , password: password, disableName: disableName, experiance: experiance, address: address, level: level, token: token);
    try {
      postRegesterService.logOut(token: token);
      // final token = response['access_token'];
      // // تأكد من إرجاع القيمة هنا
      // final refreshToken = response['refresh_token'];

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> profile() async {
    emit(AuthLoading());

    // final response =await postRegesterService.regester(phone:phone , password: password, disableName: disableName, experiance: experiance, address: address, level: level, token: token);
    try {
      postRegesterService.profile();
      // final token = response['access_token'];
      // // تأكد من إرجاع القيمة هنا
      // final refreshToken = response['refresh_token'];

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
