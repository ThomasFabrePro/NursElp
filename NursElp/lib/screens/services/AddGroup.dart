import 'dart:math';

import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class AddUser extends StatelessWidget {
//   final String fullName;
//   final String company;
//   final int age;

//   AddUser(this.fullName, this.company, this.age);

//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'full_name': fullName ?? '', // John Doe
//             'company': company ?? '', // Stokes and Sons
//             'age': age ?? 0 // 42
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }

class CodeGenerator extends StatelessWidget {
  const CodeGenerator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String generateCode() {
      Random rng = new Random();
      String code = '';
      int nextInt;
      int codeLength = 10;
      for (var i = 0; i < codeLength; i++) {
        nextInt = rng.nextInt(9);
        code += nextInt.toString();
      } //TODO ajout vérifier code != de celui d'un autre groupe
      print(code);
      return code;
    }

    return TextButton(
      onPressed: generateCode,
      child: Text(
        "Generate code",
      ),
    );
  }
}
