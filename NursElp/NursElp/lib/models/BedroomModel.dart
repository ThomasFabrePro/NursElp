//import 'dart:ffi';

class Bedroom {
  final int id;
  final bool isHere;
  final int roomNumber;
  final bool sexe;
  //quel type pour les dates d'entrée/sortie ?
  final bool contagious;
  final String doctor;
  final List surveillances;
  final List bedroomTasks;
  final List moves;
  final String notes;
  final int sector;

  Bedroom(
      {this.id,
      this.sexe,
      this.roomNumber,
      this.isHere,
      this.contagious,
      this.doctor,
      this.surveillances,
      this.bedroomTasks,
      this.moves,
      this.notes,
      this.sector});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isHere': isHere,
      'roomNumber': roomNumber,
      'sexe': sexe,
      'contagious': contagious,
      'doctor': doctor,
      'surveillances': surveillances,
      'bedroomTasks': bedroomTasks,
      'moves': moves,
      'notes': notes,
      'sector': sector,
    };
  }
}
