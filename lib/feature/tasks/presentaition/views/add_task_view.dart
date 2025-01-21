import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/assets.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/add_task_appbar.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/custom_add_img.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/drob_down_priority.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/elevaited_bottom_add_task.dart';
import 'package:tasky_app/feature/tasks/presentaition/views/widgets/text_form_field.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const AddTaskAppBar(),
              const SizedBox(
                height: 35,
              ),
              const Center(
                child: CustomAddImage(),
              ),
              const SizedBox(height: 20),

              // حقل عنوان المهمة
              const Text('Task title'),
              const SizedBox(height: 8),
              //
              const TextFormFieldTitle_desc(
                hintText: 'Enter title here...',
                maxLine: 1,
              ),
              const SizedBox(height: 20),

              // حقل وصف المهمة
              const Text('Task Description'),
              const SizedBox(height: 8),
              const TextFormFieldTitle_desc(
                hintText: 'Enter Describtion here...',
                maxLine: 4,
              ),
              const SizedBox(height: 20),

              // اختيار الأولوية
              const Text('Priority'),
              const SizedBox(height: 8),
              const DropDownFieldPriority(),
              const SizedBox(height: 20),

              // اختيار تاريخ
              const Text('Due date'),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'choose due date...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Image.asset(
                      scale: 3.5,
                      Assets.calenderImage,
                      width: 10,
                      height: 10,
                    )),
                onTap: () {
                  // وظيفة فتح التقويم
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                },
              ),
              const SizedBox(height: 70),

              // زر إضافة المهمة
              const Center(
                child: ElevatedBottomAddTask(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
