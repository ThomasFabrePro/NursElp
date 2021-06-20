class Surveillances {
  final String groupId;
  final String surveillanceId;
  final int bedroomNumber;
  final String bedroomId;
  final String title;
  final bool isDone;
  final bool important;
  final String notes;
  //quel type pour la récurrence et le rappel?
  Surveillances(this.bedroomNumber,
      {this.groupId,
      this.surveillanceId,
      this.bedroomId,
      this.title,
      this.isDone,
      this.important,
      this.notes});

  Surveillances.fromJson(Map<String, dynamic> data)
      : groupId = data['groupId'],
        surveillanceId = data['surveillanceId'],
        bedroomId = data['bedroomId'],
        title = data['title'],
        isDone = data['isDone'],
        important = data['important'],
        notes = data['notes'],
        bedroomNumber = data['bedroomNumber'];

  Map<String, dynamic> toJson() => {
        'surveillanceId': surveillanceId,
        'groupId': groupId,
        'title': title,
        'isDone': isDone,
        'bedroomId': bedroomId,
        'important': important,
        'note': notes,
      };
}
