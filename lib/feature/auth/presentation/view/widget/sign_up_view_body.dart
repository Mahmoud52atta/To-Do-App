import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/assets.dart';
import 'package:to_do_app/feature/auth/presentation/view/widget/register_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          Assets.registerLogo,
          height: MediaQuery.of(context).size.height * 1 / 4,
        ),
        const RegisterSection(),
      ],
    );
  }
}
