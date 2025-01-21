import 'package:flutter/material.dart';
import 'package:to_do_app/constant.dart';

class DropDownFieldPriority extends StatelessWidget {
  const DropDownFieldPriority({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      enableFeedback: true,
      // icon: Image.asset(Assets.flag),
      items: const [
        DropdownMenuItem(
            value: 'High Priority',
            child: Text(
              ' High Priority',
              style: TextStyle(color: kPrimaryColor),
            )),
        DropdownMenuItem(
            value: 'Medium Priority',
            child: Text('Medium Priority',
                style: TextStyle(color: kPrimaryColor))),
        DropdownMenuItem(
            value: 'Low Priority',
            child:
                Text('Low Priority', style: TextStyle(color: kPrimaryColor))),
      ],
      onChanged: (value) {
        // التعامل مع اختيار الأولوية
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
