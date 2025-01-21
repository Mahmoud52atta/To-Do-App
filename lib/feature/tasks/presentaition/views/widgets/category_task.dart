import 'package:flutter/material.dart';
import 'package:tasky_app/constant.dart';

class ItemCategoryTask extends StatelessWidget {
  const ItemCategoryTask({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 40,
        // width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
