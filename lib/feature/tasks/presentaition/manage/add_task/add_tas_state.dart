part of 'add_task_cubit.dart';

sealed class AddTaskState {}

final class AddTasInitial extends AddTaskState {}

final class AddTaskLooding extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {}

final class AddTaskFailuer extends AddTaskState {
  final String errorMessage;

  AddTaskFailuer(this.errorMessage);
}
