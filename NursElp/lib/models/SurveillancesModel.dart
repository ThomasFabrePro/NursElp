class Surveillances {
  final int id;
  final int bedroomId;
  final String title;
  final int isDone;
  final bool important;
  final String note;
  //quel type pour la récurrence et le rappel?
  Surveillances(
      {this.id,
      this.bedroomId,
      this.title,
      this.isDone,
      this.important,
      this.note});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'bedroomId': bedroomId,
      'important': important,
      'note': note,
    };
  }
}
