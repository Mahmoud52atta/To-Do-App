import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/routers/app_routers.dart';
import 'package:to_do_app/core/widget/custom_button.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';
import 'package:to_do_app/feature/auth/presentation/mange/auth/auth_cubit.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _isPasswordVisible = false;

  String? phoneNumber;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('login Successful')),
          );
          // GoRouter.of(context).go(AppRouters.kHomeTasks);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errormessage)),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: context.read<AuthCubit>().signInFormKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: context.read<AuthCubit>().signInPhone,
                  hintText: '123 456-7890',
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.flag),
                      SizedBox(width: 5),
                      Text("+20"),
                    ],
                  ),
                  onChanged: (value) {
                    // value = phoneNumber!;
                    phoneNumber = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter your number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: context.read<AuthCubit>().signInPassword,
                  hintText: 'password..',
                  obscureText: !_isPasswordVisible,
                  suffixIcon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onTapSuffixIcon: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  onChanged: (value) {
                    // value = password;
                    password = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'enter password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 24),
                state is SignInLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        title: 'Sign In',
                        onTap: () {
                          if (context
                              .read<AuthCubit>()
                              .signInFormKey
                              .currentState!
                              .validate()) {
                            context.read<AuthCubit>().signIn();
                            context
                                .read<AuthCubit>()
                                .signInFormKey
                                .currentState!
                                .save();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                          // context.read<AuthCubit>().login(phoneNumber!, password!);
                        },
                      ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have any account?'),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouters.kSignUpView);
                      },
                      child: const Text(
                        'Sign Up here',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
