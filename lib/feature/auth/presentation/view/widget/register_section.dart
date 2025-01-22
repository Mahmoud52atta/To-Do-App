import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/widget/custom_button.dart';
import 'package:to_do_app/core/widget/custom_dropdown.dart';
import 'package:to_do_app/core/widget/custom_text_form_field.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _isPasswordVisible = false;
  String? name, phoneNumber, yearsOfExperience, address, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formKey,
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
              hintText: 'Name...',
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                return 'enter your name';
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
                phoneNumber = value;
              },
              validator: (value) {
                return 'enter phone number';
              },
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              hintText: 'Years of experience',
              onChanged: (value) {
                yearsOfExperience = value;
              },
              validator: (value) {
                return 'enter Years of experience';
              },
            ),
            const SizedBox(height: 15),
            const CustomDropdown(items: [
              'Entry Level',
              'Mid Level',
              'Senior Level',
              'Manager',
            ]),
            const SizedBox(height: 15),
            CustomTextFormField(
              hintText: 'Address',
              onChanged: (value) {
                address = value;
              },
              validator: (value) {
                return 'enter your address';
              },
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
              hintText: 'password..',
              obscureText: !_isPasswordVisible,
              suffixIcon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                return 'enter your password';
              },
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: 'Sign Up',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have any account? '),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
             const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
