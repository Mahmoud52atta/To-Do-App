part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  // final String token;
  // final String refreshToken;

  AuthSuccess();
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
