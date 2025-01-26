import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';
import 'package:to_do_app/feature/tasks/data/todo_servise.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  void getList({required int page}) {
    emit(TaskLoading());
    try {
      ToDoServise().getList(page: page);
      emit(TaskSuccess());
    } catch (e) {
      emit(
        TaskFailuer(errorMessage: e.toString()),
      );
    }
  }
}
