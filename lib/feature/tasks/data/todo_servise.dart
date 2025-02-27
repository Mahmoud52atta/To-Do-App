class ToDoServise {
  final String baseUrl = 'https://todo.iraqsapp.com';
  // Future<AddTaskModel> getList({required int page}) async {
  //   List<Map<String, dynamic>> data =
  //       await Api().get(url: '$baseUrl/todos$page');
  //   return AddTaskModel.fromJson(data as Map<String, dynamic>);
  // }

  // Future<List<dynamic>> getOne() async {
  //   List<dynamic> data =
  //       await Api().get(url: '$baseUrl/todos/6640dc5e1971e94d3c98d84d');
  //   return data;
  // }

  // Future<AddTaskModel> addTask(AddTaskModel taskModel) async {
  //   // إرسال البيانات عبر الـ API
  //   var response = await Api().post(
  //       token: 'access_token',
  //       url: '$baseUrl/todos',
  //       body: jsonEncode(taskModel) // تأكد من إرسال البيانات في شكل JSON
  //       );
  //   print('Response: $response');

  //   // تحويل البيانات التي تم إرجاعها إلى Map<String, dynamic>
  //   if (response != null) {
  //     Map<String, dynamic> data = response as Map<String, dynamic>;

  //     // تحويل الـ Map إلى نموذج AddTaskModel
  //     return AddTaskModel.fromJson(data);
  //   } else {
  //     throw Exception("Failed to add task");
  //   }
  // }

  // Future<List<TaskModel>> getList({required int page}) async {
  //   http.Response response =
  //       await http.get(Uri.parse('$baseUrl/todos${page = 2}'), headers: {
  //     HttpHeaders.authorizationHeader:
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQ5ZmIyZWVmMGJmOTNkZDAwNzExYmEiLCJpYXQiOjE3Mzk3OTM5NzQsImV4cCI6MTczOTc5NDU3NH0.fL1TiKxHAyux5Bp4UnzDrPRoT6haLg93NgsvkasFcnA eyJhbGciOiJIUzI1NiJ9.e30.Df3nAFzT7HUCgGGRU24OCCIIFnwUPBWakRLUQaAqu10'
  //   });
  //   List<dynamic> data = jsonDecode(response.body);
  //   List<TaskModel> taskList = [];
  //   for (int i = 0; i < data.length; i++) {
  //     taskList.add(
  //       TaskModel.fromJson(data[i]),
  //     );
  //   }
  //   return taskList;
  // }
}
