import 'package:flutter/material.dart';

class TextFormFieldTitle_desc extends StatelessWidget {
  const TextFormFieldTitle_desc({
    super.key,
    required this.hintText,
    required this.maxLine,
    this.controller,
    this.validator,
  });
  final String hintText;
  final int maxLine;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      maxLines: maxLine, // مساحة أكبر للكتابة
    );
  }
}
