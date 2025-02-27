part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  // final String accesstoken;
  // final String refreshToken;
}

class SignInFailure extends AuthState {
  final String errormessage;

  SignInFailure({required this.errormessage});
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  // final String accesstoken;
  // final String refreshToken;
}

class SignUpFailure extends AuthState {
  final String errormessage;

  SignUpFailure({required this.errormessage});
}
