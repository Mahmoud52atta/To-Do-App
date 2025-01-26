import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/assets.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/login_section.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(Assets.art),
        const LoginSection(),
      ],
    );
  }
}
