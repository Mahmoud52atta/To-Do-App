import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/api_services.dart';
import 'package:to_do_app/feature/auth/data/model/auth_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.apiService) : super(AuthInitial());
  final ApiService apiService;

   Future<void> login(String phone, String password) async {
    emit(AuthLoading());
    try {
      final result = await apiService.login(phone, password);
      emit(AuthSuccess(result['token'], result['refreshToken']));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(AuthModel authModel) async {
    emit(AuthLoading());
    try {
      await apiService.register(authModel);
      emit(AuthSuccess('token','refreshToken'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
