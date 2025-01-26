import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/tasks/presentaition/manage/cubit/task_cubit.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/home_tasks_appar.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/home_tasks_body.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HomeTasksAppBar(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => TaskCubit(),
                child: const HomeTasksBody(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
