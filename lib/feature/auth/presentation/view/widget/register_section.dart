import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/core/widget/custom_button.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';
import 'package:to_do_app/feature/auth/data/model/auth_model.dart';
import 'package:to_do_app/feature/auth/presentation/mange/auth/auth_cubit.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _isPasswordVisible = false;
  String? phone;
  dynamic password;
  String? disableName;
  String? experiance;
  dynamic address;
  String? level;
  String? token;
  // String? name, phoneNumber, yearsOfExperience, address, password, level;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration Successful')),
          );
          GoRouter.of(context).go(AppRouters.kHomeTasks);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: 'Name...',
                  onChanged: (value) {
                    disableName = value;
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Enter your name' : null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
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
                    phone = value;
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Enter phone number' : null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Years of experience',
                  onChanged: (value) {
                    experiance = value;
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Enter years of experience' : null;
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: level,
                  hint: const Text('Choose experience Level'),
                  items: [
                    'Entry Level',
                    'Mid Level',
                    'Senior Level',
                    'Manager',
                  ]
                      .map(
                        (level) => DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      level = value;
                    });
                  },
                  validator: (value) {
                    return value == null ? 'Choose experience level' : null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Address',
                  onChanged: (value) {
                    address = value;
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Enter your address' : null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Password...',
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
                    password = value;
                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Enter your password' : null;
                  },
                ),
                const SizedBox(height: 24),
                state is AuthLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        title: 'Sign Up',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            final authModel = AuthModel(
                              phone: phone!,
                              password: password!,
                              displayName: disableName!,
                              experienceYears: experiance!,
                              address: address!,
                              level: level!,
                            );
                            context.read<AuthCubit>().register(authModel);
                            // context.read<AuthCubit>().register(authModel);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                          // GoRouter.of(context).push(AppRouters.kHomeTasks);
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
