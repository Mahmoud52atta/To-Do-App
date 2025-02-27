class AddTaskModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final String priority;
  final DateTime? dueDate;
  final String? imageUrl; // إضافة خاصية الصورة

  AddTaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.priority,
    required this.dueDate,
    required this.imageUrl, // إضافة الصورة
  });

  factory AddTaskModel.fromJson(Map<String, dynamic> json) {
    return AddTaskModel(
      id: json['_id'],
      title: json['title'],
      description: json['desc'],
      isCompleted: json['isCompleted'],
      priority: json['priority'],
      dueDate: DateTime.parse(json['dueDate']),
      imageUrl: json['image'], // إضافة الصورة
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'desc': description,
      'isCompleted': isCompleted,
      'priority': priority,
      'dueDate': dueDate?.toIso8601String(),
      'image': imageUrl, // إضافة الصورة
    };
  }
}
