part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

// ignore: must_be_immutable
final class TaskSuccess extends TaskState {
  List<TaskModel>? tasks;
}

final class TaskFailuer extends TaskState {
  final String errorMessage;

  TaskFailuer({required this.errorMessage});
}
