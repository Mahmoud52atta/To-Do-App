part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String token;         
  final String refreshToken;

  AuthSuccess(this.token, this.refreshToken);  
}

final class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure(this.errMessage);
}
