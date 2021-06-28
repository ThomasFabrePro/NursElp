class Task {
  final String taskId;
  final String title;
  final String description;
  final String bedroomId;
  final String groupId;
  Task({
    this.taskId,
    this.bedroomId,
    this.groupId,
    this.title,
    this.description,
  });

  Task.fromJson(Map<String, dynamic> data)
      : taskId = data['taskId'],
        title = data['title'],
        bedroomId = data['bedroomId'],
        groupId = data['groupId'],
        description = data['description'];

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'title': title,
        'description': description,
        'bedroomId': bedroomId,
        'groupId': groupId,
      };
}
