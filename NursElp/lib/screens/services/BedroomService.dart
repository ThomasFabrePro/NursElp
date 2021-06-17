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
    String notes,
    String doctor,
    String arriving,
    String leaving,
    String side,
    String bedroomNumber,
    bool sexe,
    bool contagious,
    bool isPresent,
    List surveillances,
    List bedroomTasks,
    List moves,
    int sector,
  ) {
    String bedroomCodeId = groupService.generateCode(4).toString();
    String bedroomId;
    bedrooms.add({
      'groupId': groupId,
      'isPresent': isPresent ?? true,
      'bedroomNumber': bedroomNumber ?? '000',
      'sexe': sexe ?? false,
      'contagious': contagious ?? false,
      'doctor': doctor ?? '',
      'arriving': arriving ?? '',
      'leaving': leaving ?? '',
      'side': '' ?? '',
      'bedroomId': bedroomCodeId,
      'surveillances': surveillances ?? null,
      'bedroomTasks': bedroomTasks ?? null,
      'moves': moves ?? null,
      'notes': notes ?? '',
      'sector': sector ?? 1,
    });

    bedrooms
        .where('bedroomId', isEqualTo: bedroomCodeId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      bedroomId = querySnapshot.docs.single.id;
      if (bedroomCodeId.toString() != bedroomId) {
        querySnapshot.docs.single.reference.update({'bedroomId': bedroomId});
      }
    });
  }
  //TODO faire une fonction qui récupère une donnée (prend en parametre le nom de la donnée demandée)

  deleteBedroom(String bedroomId) {
    CollectionReference bedrooms =
        FirebaseFirestore.instance.collection('bedrooms');
    bedrooms.doc(bedroomId).delete();
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
      stream: bedrooms.where('groupId', isEqualTo: widget.groupId).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('erreur');
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(
            children: snapshot.data.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document?.data() as Map<String, dynamic>;
                return BedroomCardWidget(
                  bedroomNumber: data['bedroomNumber'] ?? '000',
                  isPresent: data['isPresent'] ?? '',
                  leaving: data['leaving'] ?? '',
                  navigator: BedroomNav(
                    groupId: widget.groupId,
                    bedroomId: data['bedroomId'] ?? '',
                    isPresent: data['isPresent'] ?? true,
                    leaving: data['leaving'] ?? '',
                    arriving: data['arriving'] ?? '',
                    doctor: data['doctor'] ?? '',
                    bedroomNumber: data['bedroomNumber'] ?? '',
                    sexe: data['sexe'] ?? true,
                    contagious: data['contagious'] ?? false,
                    notes: data['notes'] ?? '',
                    sector: data['sector'] ?? 1,
                    side: data['side'] ?? '',
                    surveillances: data['surveillances'] ??
                        null, //peut etre tout mettre entre crochet si ca marche pas
                    bedroomTasks: data['bedroomTasks'] ?? null,
                    moves: data['moves'] ?? null,
                  ),
                );
              },
            ).toList(),
          );
        }
        return Text('aucune chambre');
      },
    );
  }
}
