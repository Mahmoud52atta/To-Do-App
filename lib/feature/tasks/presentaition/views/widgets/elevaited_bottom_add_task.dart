import 'package:flutter/material.dart';
import 'package:to_do_app/constant.dart';

class ElevatedBottomAddTask extends StatelessWidget {
  const ElevatedBottomAddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // وظيفة إضافة المهمة
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 120),
        backgroundColor: kPrimaryColor,
      ),
      child: const Text(
        'Add task',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
