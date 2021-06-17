import 'package:NursElp/screens/bedroom/bedroom.dart';
import 'package:NursElp/screens/bedroom/bedroomnav.dart';
import 'package:NursElp/screens/group/groupmenu.dart';
import 'package:NursElp/screens/services/GroupsService.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BedroomService {
  GroupService groupService = GroupService();
  CollectionReference bedrooms =
      FirebaseFirestore.instance.collection('bedrooms');
  addBedroom(
    String groupId,
  ) {
    String bedroomCodeId = groupService.generateCode(4).toString();
    String bedroomId;
    bedrooms.add({
      'groupId': groupId,
      'isPresent': true,
      'bedroomNumber': '000',
      'sexe': false,
      'contagious': false,
      'doctor': '',
      'arriving': '',
      'leaving': '',
      'side': '',
      'bedroomId': bedroomCodeId,
      'surveillances': null,
      'bedroomTasks': null,
      'moves': null,
      'notes': '',
      'sector': 1,
    });

    bedrooms
        .where('bedroomId', isEqualTo: bedroomCodeId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      bedroomId = querySnapshot.docs.single.id;
      querySnapshot.docs.single.reference.update({'bedroomId': bedroomId});
    });
  }

  updateBedroom(
    String bedroomId,
    var value,
    String field,
  ) {
    DocumentReference doc =
        FirebaseFirestore.instance.collection('bedrooms').doc(bedroomId);
    doc.update({field: value});
  }

  deleteBedroom(String bedroomId) {
    DocumentReference bedroom =
        FirebaseFirestore.instance.collection('bedrooms').doc(bedroomId);
    bedroom.delete();
  }
}

class GetBedrooms extends StatefulWidget {
  final String groupId;
  GetBedrooms(this.groupId);

  @override
  _GetBedroomsState createState() => _GetBedroomsState();
}

class _GetBedroomsState extends State<GetBedrooms> {
  @override
  Widget build(BuildContext context) {
    CollectionReference bedrooms =
        FirebaseFirestore.instance.collection('bedrooms');

    return StreamBuilder<QuerySnapshot>(
      stream: bedrooms
          .where('groupId', isEqualTo: widget.groupId)
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('erreur');
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Icon(Icons.autorenew),
          );
        }

        return ListView(
          children: snapshot.data.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document?.data() as Map<String, dynamic>;
              return BedroomCardWidget(
                bedroomNumber: data['bedroomNumber'] ?? '000',
                isPresent: data['isPresent'],
                leaving: data['leaving'],
                navigator: BedroomNav(
                  groupId: widget.groupId,
                  bedroomId: data['bedroomId'],
                  isPresent: data['isPresent'],
                  leaving: data['leaving'],
                  arriving: data['arriving'],
                  doctor: data['doctor'],
                  bedroomNumber: data['bedroomNumber'],
                  sexe: data['sexe'],
                  contagious: data['contagious'],
                  notes: data['notes'],
                  sector: data['sector'],
                  side: data['side'],
                  surveillances: data['surveillances'] ??
                      null, //peut etre tout mettre entre crochet si ca marche pas
                  bedroomTasks: data['bedroomTasks'] ?? null,
                  moves: data['moves'] ?? null,
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
