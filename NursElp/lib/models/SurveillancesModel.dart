class Surveillances {
  final String groupId;
  final String surveillanceId;
  final String notes;
  final String bedroomId;
  final String title;
  final String description;
  final bool isDone;
  final bool important;

  final int bedroomNumber;
  //quel type pour la récurrence et le rappel?
  Surveillances({
    this.description,
    this.bedroomNumber,
    this.groupId,
    this.surveillanceId,
    this.bedroomId,
    this.title,
    this.isDone,
    this.important,
    this.notes,
  });

  Surveillances.fromJson(Map<String, dynamic> data)
      : groupId = data['groupId'],
        surveillanceId = data['surveillanceId'],
        bedroomId = data['bedroomId'],
        title = data['title'],
        isDone = data['isDone'],
        important = data['important'],
        notes = data['notes'],
        bedroomNumber = data['bedroomNumber'],
        description = data['description'];

  Map<String, dynamic> toJson() => {
        'surveillanceId': surveillanceId,
        'groupId': groupId,
        'title': title,
        'isDone': isDone,
        'bedroomId': bedroomId,
        'important': important,
        'note': notes,
        'bedroomNumber': bedroomNumber,
        'description': description,
      };
}
