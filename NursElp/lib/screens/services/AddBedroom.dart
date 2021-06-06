import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBedroom extends StatelessWidget {
  final int groupId;
  final bool isHere;
  final String roomNumber;
  final bool sexe;
  //quel type pour les dates d'entrée/sortie ?
  final bool contagious;
  final String doctor;
  final List surveillances;
  final List bedroomTasks;
  final List moves;
  final String notes;
  final int sector;

  AddBedroom(
      this.groupId,
      this.isHere,
      this.roomNumber,
      this.sexe,
      this.contagious,
      this.doctor,
      this.surveillances,
      this.bedroomTasks,
      this.moves,
      this.notes,
      this.sector);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference bedrooms =
        FirebaseFirestore.instance.collection('bedrooms');

    Future<void> addBedroom() {
      // Call the bedrooms's CollectionReference to add a new bedroom
      return bedrooms
          .add({
            'groupId': groupId,
            'isHere': isHere,
            'roomNumber': roomNumber,
            'sexe': sexe,
            'contagious': contagious,
            'doctor': doctor,
            'surveillances': surveillances,
            'bedroomTasks': bedroomTasks,
            'moves': moves,
            'notes': notes,
            'sector': sector, // 42
          })
          .then((value) => {print(value.id)})
          .catchError((error) => print("Failed to add bedroom: $error"));
    }

    return TextButton(
      onPressed: addBedroom,
      child: Text(
        "Add User",
      ),
    );
  }
}
