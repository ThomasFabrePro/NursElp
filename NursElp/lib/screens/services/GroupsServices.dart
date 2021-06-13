import 'dart:math';

import 'package:NursElp/screens/bedroom/bedroom.dart';
import 'package:NursElp/screens/tasks/taskpage.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key key}) : super(key: key);

  @override
  _AddGroupState createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('groups');

  @override
  Widget build(BuildContext context) {
    collectionReference.add('newgroup');
    return Container();
  }
}

class CreateGroup extends StatelessWidget {
  final String groupName;
  final String groupPassword;
  final int numberMember;
  int code;

  CreateGroup(
    this.groupName,
    this.groupPassword,
    this.numberMember,
  );

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference groups =
        FirebaseFirestore.instance.collection('groups');

    Future<void> createGroup() {
      code = generateCode();
      // Call the user's CollectionReference to add a new user
      return groups
          .add({
            'groupName': groupName ?? 'No group name yet', // John Doe
            'groupPassword': groupPassword, // Stokes and Sons
            'numberMember': numberMember ?? 4,
            'groupCode': code,
          })
          .then((value) => print("Group $groupName created"))
          .catchError((error) => print("Failed to create group: $error"));
    }

    return TextButton(
      onPressed: createGroup,
      style: TextButton.styleFrom(backgroundColor: Colors.white),
      child: Text(
        "Créer le groupe",
        style: TextStyle(
          color: Colors.red[400],
          fontSize: 20,
        ),
      ),
    );
  }
}

int generateCode() {
  Random rng = new Random();
  String codeGenerated = '';
  int nextInt;
  int codeLength = 15;
  int finalCode;
  for (var i = 0; i < codeLength; i++) {
    nextInt = rng.nextInt(9);
    codeGenerated += nextInt.toString();
  }
  finalCode = int.parse(codeGenerated);
  //TODO ajout vérifier code != de celui d'un autre groupe
  return finalCode;
}

class GetGroup extends StatelessWidget {
  final String documentId;

  GetGroup(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference groups =
        FirebaseFirestore.instance.collection('groups');

    return FutureBuilder<DocumentSnapshot>(
      future: groups.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          if (data['numberMember'] == 4) {
            return MenuCardWidget(
              title: data['groupName'],
              navigator: BedroomPage(),
            );
          }
        }
        return Container();
        //return Text("loading");
      },
    );
  }
}

class DisplayGroups extends StatefulWidget {
  const DisplayGroups({Key key}) : super(key: key);

  @override
  _DisplayGroupsState createState() => _DisplayGroupsState();
}

class _DisplayGroupsState extends State<DisplayGroups> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('groups').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.data) {
            return Text("Connecting....");
          }
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return Text(ds['groupName'] ?? 'default data');
              });
        });
  }
}
