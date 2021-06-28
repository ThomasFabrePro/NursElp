class Todo {
  final String todoId;
  final String taskId;
  final String title;
  final bool isDone;

  Todo({
    this.todoId,
    this.taskId,
    this.title,
    this.isDone,
  });

  Todo.fromJson(Map<String, dynamic> data)
      : todoId = data['todoId'],
        taskId = data['taskId'],
        title = data['title'],
        isDone = data['isDone'];

  Map<String, dynamic> toJson() => {
        'todoId': todoId,
        'title': title,
        'isDone': isDone,
        'taskId': taskId,
      };
}
