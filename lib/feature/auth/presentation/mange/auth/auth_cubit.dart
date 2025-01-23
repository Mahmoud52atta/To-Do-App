import 'package:bloc/bloc.dart';
import 'package:to_do_app/core/utils/api_services.dart';
import 'package:to_do_app/feature/auth/data/model/auth_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.apiService) : super(AuthInitial());
  final ApiService apiService;

  Future<void> login(String phone, String password) async {
    emit(AuthLoading());
    try {
      final response = await apiService.login(phone, password);
      final token = response['access_token'];
      final refreshToken = response['refresh_token'];

      emit(AuthSuccess(token, refreshToken));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(AuthModel authModel) async {
    emit(AuthLoading());
    try {
      final response = await apiService.register(authModel);
      final token = response['access_token'];
      // تأكد من إرجاع القيمة هنا
      final refreshToken = response['refresh_token'];

      emit(AuthSuccess(token, refreshToken));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
