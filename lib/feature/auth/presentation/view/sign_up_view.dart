import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/api_services.dart';
import 'package:to_do_app/feature/auth/presentation/mange/auth/auth_cubit.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(ApiService()),
        child: const SignUpViewBody(),
      ),
    );
  }
}
