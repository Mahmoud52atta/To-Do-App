import 'package:flutter/material.dart';
import 'package:to_do_app/constant.dart';

class DropDownFieldPriority extends StatelessWidget {
  const DropDownFieldPriority({
    super.key,
    required this.selectedPriority,
  });
  final ValueNotifier<String?> selectedPriority;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedPriority,
        builder: (context, value, _) {
          return DropdownButtonFormField<String>(
            hint: const Text('Select Priority'),

            enableFeedback: true,
            value: value,
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
                  child: Text('Low Priority',
                      style: TextStyle(color: kPrimaryColor))),
            ],
            onChanged: (value) {
              selectedPriority.value = value;
              // التعامل مع اختيار الأولوية
            },
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        });
  }
}
