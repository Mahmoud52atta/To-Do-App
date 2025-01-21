import 'package:flutter/material.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/home_tasks_appar.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/home_tasks_body.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              HomeTasksAppar(),
              SizedBox(
                height: 50,
              ),
              HomeTasksBody()
            ],
          ),
        ),
      ),
    );
  }
}
