import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/Api/dio_consumer.dart';
import 'package:to_do_app/feature/auth/presentation/mange/auth/auth_cubit.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/sign_up_view_body.dart';
import 'package:to_do_app/repos/auth_repo.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            AuthCubit(AuthRepo(apiConsumer: DioConsumer(dio: Dio()))),
        child: const SignUpViewBody(),
      ),
    );
  }
}
