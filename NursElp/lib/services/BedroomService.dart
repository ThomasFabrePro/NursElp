import 'package:NursElp/models/BedroomModel.dart';
import 'package:NursElp/screens/bedroom/bedroomnav.dart';
import 'package:NursElp/services/GroupsService.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BedroomService {
  GroupService groupService = GroupService();
  CollectionReference bedrooms =
      FirebaseFirestore.instance.collection('bedrooms');

  Future<String> addBedroom(
    String groupId,
  ) async {
    String bedroomCodeId = groupService.generateCode(4).toString();
    String bedroomId;
    final String day = DateTime.now().day.toString();
    final String month = DateTime.now().month.toString();
    bedrooms.add({
      'groupId': groupId,
      'isPresent': true,
      'bedroomNumber': '000',
      'sexe': false,
      'contagious': false,
      'doctor': '',
      'arriving': '$day/$month',
      'leaving': '',
      'side': '',
      'bedroomId': bedroomCodeId,
      'surveillances': null,
      'bedroomTasks': null,
      'moves': null,
      'notes': '',
      'sector': 1,
    });

    return bedrooms
        .where('bedroomId', isEqualTo: bedroomCodeId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      bedroomId = querySnapshot.docs.single.id;
      querySnapshot.docs.single.reference.update({'bedroomId': bedroomId});
      return bedroomId;
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

  Future<bool> checkBedroomNumber(
    String bedroomNumber,
    String groupId,
    String bedroomId,
  ) async {
    //Future<bool> exists;
    bool result;
    // DocumentReference bedroom =
    //     FirebaseFirestore.instance.collection('bedrooms').doc(bedroomId);
    return bedrooms
        .where('bedroomNumber', isEqualTo: bedroomNumber)
        .where('groupId', isEqualTo: groupId)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        print('Unique bedroom number');
        result = true;
      } else {
        print('bedroom number already exists');
        result = false;
      }

      return result;
    });
  }
}

class GetBedrooms extends StatefulWidget {
  final String groupId;
  GetBedrooms(this.groupId);

  @override
  _GetBedroomsState createState() => _GetBedroomsState();
}

class _GetBedroomsState extends State<GetBedrooms> {
  CollectionReference bedrooms =
      FirebaseFirestore.instance.collection('bedrooms');
  @override
  Widget build(BuildContext context) {
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
                bedroomNumber: Bedroom.fromJson(data).bedroomNumber,
                isPresent: Bedroom.fromJson(data).isPresent,
                leaving: Bedroom.fromJson(data).leaving,
                navigator: BedroomNav(
                  bedroom: Bedroom.fromJson(data),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class AddBedroomButton extends StatefulWidget {
  final groupId;
  const AddBedroomButton({Key key, this.groupId}) : super(key: key);

  @override
  _AddBedroomButtonState createState() => _AddBedroomButtonState();
}

class _AddBedroomButtonState extends State<AddBedroomButton> {
  BedroomService bedroomService = BedroomService();
  String groupId;
  String bedroomId = '';
  DocumentReference bedroom;
  CollectionReference bedrooms =
      FirebaseFirestore.instance.collection('bedrooms');
  @override
  void initState() {
    groupId = widget.groupId;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24.0,
      right: 0.0,
      child: GestureDetector(
        onTap: () async {
          bedroomId = await bedroomService.addBedroom(groupId);
          bedroom =
              FirebaseFirestore.instance.collection('bedrooms').doc(bedroomId);
          bedroom.get().then((document) {
            Map<String, dynamic> data =
                document?.data() as Map<String, dynamic>;
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BedroomNav(
                  bedroom: Bedroom.fromJson(data),
                ),
              ),
            );
          });
          // bedrooms
          //     .where('bedroomId', isEqualTo: bedroomId)
          //     .get()
          //     .then((document)  {
          //   Map<String, dynamic> data =
          //       document.docs.single.data() as Map<String, dynamic>;
          // });
        },
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.redAccent, Colors.red[300]],
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
            ),
            borderRadius: BorderRadius.circular(45.0),
          ),
          child: Image(
            image: AssetImage(
              'assets/images/add_icon.png',
            ),
          ),
        ),
      ),
    );
  }
}
