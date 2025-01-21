import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/app_routers.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/all_category_tasks.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/custom_task.dart';

class HomeTasksBody extends StatelessWidget {
  const HomeTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        const Row(
          children: [
            Text(
              'My Tasks',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const AllCategoryTasks(),
        // const SizedBox(
        //   height: 20,
        // ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouters.kDetailsView);
                    },
                    child: CustomTask()),
              );
            },
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kSecondColor,
                      borderRadius: BorderRadius.circular(35)),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.qr_code),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouters.kAddTaskView);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  backgroundColor: kPrimaryColor,
                  child: const Icon(
                    size: 30,
                    weight: .6,
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
