import 'package:bloc/bloc.dart';
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';
import 'package:to_do_app/feature/tasks/data/todo_servise.dart';

part 'add_tas_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.toDoServise) : super(AddTasInitial());
  final ToDoServise toDoServise;
  void addTask(TaskModel taskModel) {
    emit(AddTaskLooding());
    try {
      toDoServise.addTask(taskModel);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(
        AddTaskFailuer(e.toString()),
      );
    }
  }
}
