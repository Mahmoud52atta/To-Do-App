import 'package:flutter/material.dart';

class TextFormFieldTitle_desc extends StatelessWidget {
  const TextFormFieldTitle_desc({
    super.key,
    required this.hintText,
    required this.maxLine,
  });
  final String hintText;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      maxLines: maxLine, // مساحة أكبر للكتابة
    );
  }
}
