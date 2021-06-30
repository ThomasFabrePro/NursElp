import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String todoId;
  final String taskId;
  final String title;
  final bool isDone;
  final int createdAt;

  Todo({
    this.todoId,
    this.taskId,
    this.title,
    this.isDone,
    this.createdAt,
  });

  Todo.fromJson(Map<String, dynamic> data)
      : todoId = data['todoId'],
        taskId = data['taskId'],
        title = data['title'],
        isDone = data['isDone'],
        createdAt = data['createdAt'];

  Map<String, dynamic> toJson() => {
        'todoId': todoId,
        'title': title,
        'isDone': isDone,
        'taskId': taskId,
        'createdAt': createdAt,
      };
}
