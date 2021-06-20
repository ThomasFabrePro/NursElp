//import 'dart:ffi';

class Bedroom {
  final String groupId;
  final String bedroomId;
  final String notes;
  final String doctor;
  final String arriving;
  final String leaving;
  final String side;
  final String bedroomNumber;

  final bool isPresent;
  final bool sexe;
  final bool contagious;

  final List surveillances;
  final List bedroomTasks;
  final List moves;

  final int sector;

  Bedroom({
    this.sexe,
    this.groupId,
    this.bedroomId,
    this.arriving,
    this.leaving,
    this.side,
    this.bedroomNumber,
    this.isPresent,
    this.contagious,
    this.doctor,
    this.surveillances,
    this.bedroomTasks,
    this.moves,
    this.notes,
    this.sector,
  });

  Bedroom.fromJson(Map<String, dynamic> data)
      : groupId = data['groupId'],
        bedroomId = data['bedroomId'],
        isPresent = data['isPresent'],
        leaving = data['leaving'],
        arriving = data['arriving'],
        doctor = data['doctor'],
        bedroomNumber = data['bedroomNumber'],
        sexe = data['sexe'],
        contagious = data['contagious'],
        notes = data['notes'],
        sector = data['sector'],
        side = data['side'],
        surveillances = data['surveillances'] ?? null,
        bedroomTasks = data['bedroomTasks'] ?? null,
        moves = data['moves'] ?? null;

  Map<String, dynamic> tpJson() => {
        'groupId': groupId,
        'isPresent': isPresent,
        'bedroomNumber': bedroomNumber,
        'arriving': arriving,
        'leaving': leaving,
        'bedroomId': bedroomId,
        'sexe': sexe,
        'contagious': contagious,
        'doctor': doctor,
        'surveillances': surveillances,
        'bedroomTasks': bedroomTasks,
        'moves': moves,
        'notes': notes,
        'sector': sector,
        'side': side,
      };
}
