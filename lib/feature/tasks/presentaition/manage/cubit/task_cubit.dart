import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';
import 'package:to_do_app/feature/tasks/data/task_model/task_model.dart';
import 'package:to_do_app/feature/tasks/data/todo_servise.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  // void getList({required int page}) async {
  //   emit(TaskLoading());
  //   try {
  //     List<Map<String, dynamic>> tasksData = (await ToDoServise()
  //         .getList(page: page)) as List<Map<String, dynamic>>;
  //     List<AddTaskModel> tasks =
  //         tasksData.map((taskData) => AddTaskModel.fromJson(taskData)).toList();
  //     emit(TaskSuccess(tasks: tasks));
  //   } catch (e) {
  //     emit(
  //       TaskFailuer(errorMessage: e.toString()),
  //     );
  //   }
  // }

  // void getList({required int page}) async {
  //   emit(TaskLoading());
  //   try {
  //     List<TaskModel> tasks = await ToDoServise().getList(page: page);
  //     emit(TaskSuccess(tasks: tasks));
  //   } catch (e) {
  //     TaskFailuer(errorMessage: e.toString());
  //   }
  // }
}
