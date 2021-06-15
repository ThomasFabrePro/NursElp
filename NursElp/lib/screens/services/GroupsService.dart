import 'dart:math';

import 'package:NursElp/screens/bedroom/bedroom.dart';
import 'package:NursElp/screens/dashboard/Home.dart';
import 'package:NursElp/screens/group/groupmenu.dart';
import 'package:NursElp/screens/services/UserService.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class GroupService {
  String currentGroupId = '7AbGe6aQJIOYSsq3QYEZ';

  String setCurrentGroupId(String groupId) {
    currentGroupId = groupId;
  }

  int generateCode() {
    Random rng = new Random();
    String codeGenerated = '';
    int nextInt;
    int codeLength = 4;
    int finalCode;
    for (var i = 0; i < codeLength; i++) {
      nextInt = rng.nextInt(9);
      codeGenerated += nextInt.toString();
    }
    finalCode = int.parse(codeGenerated);
    //TODO ajout vérifier code != de celui d'un autre groupe
    return finalCode;
  }
}

class GetGroupCode extends StatelessWidget {
  final String groupId;

  GetGroupCode(this.groupId);

  @override
  Widget build(BuildContext context) {
    //CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference groups =
        FirebaseFirestore.instance.collection('groups');
    return FutureBuilder(
        future: groups.doc(groupId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data.data() as Map<String, dynamic>;
            return Text("Group Code: ${data['groupCode']}");
          }

          return Text("loading");
        });
  }
}

class JoinGroup extends StatelessWidget {
  final String groupName;
  final String groupPassword;
  final int groupCode;
  JoinGroup(
    this.groupName,
    this.groupPassword,
    this.groupCode,
  );

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called groups that references the firestore collection
    CollectionReference groups =
        FirebaseFirestore.instance.collection('groups');
    UserService userService = UserService();
    String groupId;
    String dbGroupName;
    String dbGroupPassword;
    var data;
    String userId = userService.getUserId();
    DocumentReference user =
        FirebaseFirestore.instance.collection('users').doc(userId);

    void joinGroup() {
      // Call the user's CollectionReference to add a new user

      try {
        groups
            .where('groupCode', isEqualTo: groupCode)
            .where('groupName', isEqualTo: groupName)
            .where('groupPassword', isEqualTo: groupPassword)
            .get()
            .then(
          (querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              querySnapshot.docs.single.reference.update({
                'groupMember': FieldValue.arrayUnion([userId]),
              });
              groupId = querySnapshot.docs.single.id;

              querySnapshot.docs.single.reference.update({'groupId': groupId});
              user.update({
                'groupsId': FieldValue.arrayUnion([groupId])
              });
              Navigator.pop(context);
            }

            if (querySnapshot.docs.isEmpty) {
              print('erreur');
              //TODO ajouter le bandeau en bas d'écran pour dire à user que ce groupe n'existe pas
            }
          },
        );
      } catch (e) {
        print(e);
        print("ce groupe n'existe pas");
      }
    }

    return TextButton(
      onPressed: () {
        joinGroup();
      },
      style: TextButton.styleFrom(backgroundColor: Colors.white),
      child: Text(
        "Rejoindre ce groupe",
        style: TextStyle(
          color: Colors.red[400],
          fontSize: 20,
        ),
      ),
    );
  }
}

class CreateGroup extends StatelessWidget {
  final String groupName;
  final String groupPassword;
  final int numberMember;

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
    UserService userService = UserService();
    GroupService groupService = GroupService();
    int code;
    String uid = userService.getUserId();
    Future<void> createGroup() {
      code = groupService.generateCode();
      // Call the user's CollectionReference to add a new user
      return groups
          .add({
            'groupName': groupName ?? 'No group name yet', // John Doe
            'groupPassword': groupPassword, // Stokes and Sons
            'numberMember': numberMember ?? 4,
            'groupCode': code,
            'groupMember': [
              uid,
            ],
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

class GetGroups extends StatelessWidget {
  GetGroups();

  @override
  Widget build(BuildContext context) {
    CollectionReference groups =
        FirebaseFirestore.instance.collection('groups');

    UserService userService = UserService();
    String userId = userService.getUserId();
    // groups
    //     .where('groupMember', arrayContains: userId)
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     return Text(doc["groupName"]);
    //   });
    // });
    return StreamBuilder<QuerySnapshot>(
        stream: groups.where('groupMember', arrayContains: userId).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return MenuCardWidget(
                title: data['groupName'],
                navigator: GroupMenu(),
              );
            }).toList(),
          );
        });
  }
}
