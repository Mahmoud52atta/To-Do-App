import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_app/feature/tasks/data/add_task_model.dart';

class TaskRepository {
  final String baseUrl;

  TaskRepository(this.baseUrl);

  // جلب قائمة المهام
  Future<List<TaskModel>> getTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/todos?page=1'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => TaskModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  // إضافة مهمة جديدة
  Future<TaskModel> addTask(TaskModel task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
    if (response.statusCode == 201) {
      return TaskModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add task');
    }
  }
}
