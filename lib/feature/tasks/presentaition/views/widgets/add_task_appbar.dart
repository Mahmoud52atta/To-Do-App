import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/utils/assets.dart';

class AddTaskAppBar extends StatelessWidget {
  const AddTaskAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Image.asset(
            Assets.arowLeft,
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Add new task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
