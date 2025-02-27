import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/core/utils/routers/app_routers.dart';
import 'package:to_do_app/core/utils/assets/assets.dart';
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';
import 'package:to_do_app/feature/tasks/data/todo_servise.dart';
import 'package:to_do_app/feature/tasks/presentaition/manage/add_task/add_task_cubit.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/add_task_appbar.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/custom_add_img.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/custom_date_picker.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/drob_down_priority.dart';
import 'package:to_do_app/feature/tasks/presentaition/views/widgets/text_form_field.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  final TextEditingController titleContrller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<String?> selectedPriority =
      ValueNotifier<String?>('Low Priority'); // القيمة الافتراضية
  final ValueNotifier<String?>? selectedImagePath =
      ValueNotifier<String?>(null);
  String? _selectedImageUrl;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(ToDoServise()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  Center(
                    child: CustomAddImage(
                      onImagePicked: (imageUrl) {
                        _selectedImageUrl = imageUrl;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // حقل عنوان المهمة
                  const Text('Task title'),
                  const SizedBox(height: 8),
                  //
                  TextFormFieldTitle_desc(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    controller: titleContrller,
                    hintText: 'Enter title here...',
                    maxLine: 1,
                  ),
                  const SizedBox(height: 20),

                  // حقل وصف المهمة
                  const Text('Task Description'),
                  const SizedBox(height: 8),
                  TextFormFieldTitle_desc(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    controller: descriptionController,
                    hintText: 'Enter Describtion here...',
                    maxLine: 4,
                  ),
                  const SizedBox(height: 20),

                  // اختيار الأولوية
                  const Text('Priority'),
                  const SizedBox(height: 8),
                  DropDownFieldPriority(
                    selectedPriority: selectedPriority,
                  ),
                  const SizedBox(height: 20),

                  // اختيار تاريخ
                  const Text('Due date'),
                  const SizedBox(height: 8),
                  CustomDatePicker(onDatePicked: (date) {
                    _selectedDate = date;
                  }),
                  // TextFormField(
                  //   readOnly: true,
                  //   decoration: InputDecoration(
                  //       hintText: 'choose due date...',
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       suffixIcon: Image.asset(
                  //         scale: 3.5,
                  //         Assets.calenderImage,
                  //         width: 10,
                  //         height: 10,
                  //       )),
                  //   onTap: () {
                  //     // وظيفة فتح التقويم
                  //     showDatePicker(
                  //       context: context,
                  //       initialDate: DateTime.now(),
                  //       firstDate: DateTime.now(),
                  //       lastDate: DateTime(2100),
                  //     );
                  //   },
                  // ),
                  const SizedBox(height: 70),

                  // زر إضافة المهمة
                  Center(
                    child: BlocConsumer<AddTaskCubit, AddTaskState>(
                      listener: (context, state) {
                        if (state is AddTaskSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Task added successfully!')),
                          );
                          GoRouter.of(context).push(AppRouters.kHomeTasks);
                        } else if (state is AddTaskFailuer) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AddTaskLooding) {
                          return const CircularProgressIndicator();
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final addTaskModel = AddTaskModel(
                                  id: '',
                                  title: titleContrller.text,
                                  description: descriptionController.text,
                                  isCompleted: false,
                                  priority: selectedPriority.toString(),
                                  dueDate: _selectedDate,
                                  imageUrl: _selectedImageUrl);
                              //   context
                              //       .read<AddTaskCubit>()
                              //       .addTask(addTaskModel);
                              // }
                              //
                              //وظيفة إضافة المهمة
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 120),
                            backgroundColor: kPrimaryColor,
                          ),
                          child: const Text(
                            'Add task',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
