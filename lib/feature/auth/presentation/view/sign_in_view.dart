import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/api_services.dart';
import 'package:to_do_app/feature/auth/data/auth_service.dart';
import 'package:to_do_app/feature/auth/presentation/mange/auth/auth_cubit.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(AuthServise()),
        child: const SignInViewBody(),
      ),
    );
  }
}
