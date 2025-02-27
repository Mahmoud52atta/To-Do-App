import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  GlobalKey<FormState> signInFormKey = GlobalKey();
//Sign in email
  TextEditingController signInPhone = TextEditingController();
//Sign in password
  TextEditingController signInPassword = TextEditingController();
//Profile Pic
  XFile? profilePic;
//Sign up name
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpName = TextEditingController();
//Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
//Sign up email
  TextEditingController signUpExperienceYears = TextEditingController();
//Sign up password
  TextEditingController signUpPassword = TextEditingController();
//Sign up confirm password
  TextEditingController signUpAddress = TextEditingController();
  String? signUpLevel;
  int? experienceYears;

  AuthCubit(this.repo) : super(AuthInitial());
  // final ApiService apiService;
  final AuthRepo repo;

  Future<void> signIn() async {
    emit(SignInLoading());

    final response = await repo.signin(
        pasword: signInPhone.text, phone: signInPassword.text);
    response.fold(
      (errMessage) => emit(SignInFailure(errormessage: errMessage)),
      (signInModel) => emit(SignInSuccess()),
    );
  }

  Future<void> signUp() async {
    final response = await repo.signUp(
        phone: signUpPhoneNumber.text,
        password: signUpPassword.text,
        disPlayName: signUpName.text,
        experienceYears: int.parse(signUpExperienceYears.text),
        adress: signUpAddress.text,
        level: signUpLevel);
    response.fold(
      (erroreMesage) => emit(SignUpFailure(errormessage: erroreMesage)),
      (signUpModel) => emit(SignUpSuccess()),
    );
  }
}
