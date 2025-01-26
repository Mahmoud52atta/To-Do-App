import 'package:to_do_app/core/utils/sevices_help.dart';
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';

class ToDoServise {
  final String baseUrl = 'https://todo.iraqsapp.com';
  Future<List<dynamic>> getList({required int page}) async {
    List<dynamic> data = await Api().get(url: '$baseUrl/todos$page');
    return data;
  }

  Future<List<dynamic>> getOne() async {
    List<dynamic> data =
        await Api().get(url: '$baseUrl/todos/6640dc5e1971e94d3c98d84d');
    return data;
  }

  Future<TaskModel> addTask(TaskModel taskModel) async {
    Map<String, dynamic> data = await Api().post(
      url: '$baseUrl/todos',
      body: taskModel,
    );
    return TaskModel.fromJson(data);
  }
}
