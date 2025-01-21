import 'package:flutter/material.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/assets.dart';

class CustomAddImage extends StatelessWidget {
  const CustomAddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // وظيفة اختيار الصورة
      },
      icon: Image.asset(
        Assets.addimage,
        width: 25,
        height: 25,
      ),
      label: const Text(
        'Add Img',
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.w500, fontSize: 20),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 120),
        side: const BorderSide(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
