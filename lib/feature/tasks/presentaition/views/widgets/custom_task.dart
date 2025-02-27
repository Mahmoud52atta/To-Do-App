import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/assets/assets.dart';
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';
import 'package:to_do_app/feature/tasks/data/task_model/task_model.dart';

class CustomTask extends StatelessWidget {
  const CustomTask({
    super.key,
    required this.addTaskModel,
  });
  // final TaskModel task;
  final TaskModel addTaskModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        addTaskModel.image != null
            ? Image.network(
                addTaskModel.image!,
                width: 64,
                height: 64,
              )
            : Image.asset(
                Assets.iconTask,
                width: 64,
                height: 64,
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    addTaskModel.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                    // height: 40,
                    // width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFFE4F2)),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        addTaskModel.desc!,
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  Assets.point3,
                  width: 30,
                  height: 30,
                )
              ],
            ),
            const SizedBox(
                width: 270,
                child: Text(overflow: TextOverflow.ellipsis, 'desreptin')),
            Row(
              children: [
                Image.asset(
                  Assets.flag,
                  width: 15,
                  height: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  addTaskModel.priority!,
                  style: const TextStyle(color: Color(0xff5F33E1)),
                ),
                const SizedBox(
                  width: 125,
                ),
                Text(addTaskModel.createdAt as String)
              ],
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
