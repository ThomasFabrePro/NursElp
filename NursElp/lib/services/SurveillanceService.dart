import 'package:NursElp/models/SurveillancesModel.dart';
import 'package:NursElp/screens/surveillances/SurveillancePage.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SurveillanceService {
  CollectionReference surveillances =
      FirebaseFirestore.instance.collection('surveillances');

  Future<String> addSurveillance(
    String bedroomId,
    String groupId,
    int bedroomNumber,
  ) async {
    String surveillanceId;
    String key = UniqueKey().toString();

    surveillances.add({
      'surveillanceId': key,
      'groupId': groupId,
      'title': 'No title yet',
      'isDone': false,
      'bedroomId': bedroomId,
      'important': false,
      'note': 'No notes yet',
      'bedroomNumber': bedroomNumber
    });

    return surveillances
        .where('surveillanceId', isEqualTo: key)
        .get()
        .then((QuerySnapshot querySnapshot) {
      surveillanceId = querySnapshot.docs.single.id;
      querySnapshot.docs.single.reference.update({
        'surveillanceId': surveillanceId,
      });
      return surveillanceId;
    });
  }
}

class GetSurveillances extends StatefulWidget {
  final String groupId;
  const GetSurveillances({Key key, this.groupId}) : super(key: key);

  @override
  _GetSurveillancesState createState() => _GetSurveillancesState();
}

class _GetSurveillancesState extends State<GetSurveillances> {
  @override
  Widget build(BuildContext context) {
    CollectionReference surveillances =
        FirebaseFirestore.instance.collection('surveillances');

    return StreamBuilder<QuerySnapshot>(
      stream: surveillances
          .where('groupId', isEqualTo: widget.groupId)
          .where('important', isEqualTo: true)
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
              return SurveillanceCardWidget(
                  bedroomNumber: Surveillances.fromJson(data).bedroomNumber,
                  title: Surveillances.fromJson(data).title,
                  important: Surveillances.fromJson(data).important,
                  navigator: SurveillancePage(
                    surveillances: Surveillances.fromJson(data),
                  ));
            },
          ).toList(),
        );
      },
    );
  }
}

class GetBedroomSurveillances extends StatefulWidget {
  final String groupId;
  final String bedroomId;
  const GetBedroomSurveillances({Key key, this.groupId, this.bedroomId})
      : super(key: key);

  @override
  _GetBedroomSurveillancesState createState() =>
      _GetBedroomSurveillancesState();
}

class _GetBedroomSurveillancesState extends State<GetBedroomSurveillances> {
  String groupId;
  String bedroomId;
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
    bedroomId = widget.bedroomId;
  }

  Widget build(BuildContext context) {
    CollectionReference surveillances =
        FirebaseFirestore.instance.collection('surveillances');

    return StreamBuilder<QuerySnapshot>(
      stream: surveillances
          .where('groupId', isEqualTo: groupId)
          .where('bedroomId', isEqualTo: bedroomId)
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
              return SurveillanceCardWidget(
                  bedroomNumber: Surveillances.fromJson(data).bedroomNumber,
                  title: Surveillances.fromJson(data).title,
                  important: Surveillances.fromJson(data).important,
                  navigator: SurveillancePage(
                    surveillances: Surveillances.fromJson(data),
                  ));
            },
          ).toList(),
        );
      },
    );
  }
}

class SurveillanceAddButton extends StatefulWidget {
  final String groupId;
  final String bedroomId;
  final int bedroomNumber;
  const SurveillanceAddButton({
    Key key,
    this.groupId,
    this.bedroomId,
    this.bedroomNumber,
  }) : super(key: key);

  @override
  _SurveillanceAddButtonState createState() => _SurveillanceAddButtonState();
}

class _SurveillanceAddButtonState extends State<SurveillanceAddButton> {
  SurveillanceService surveillanceService = SurveillanceService();

  int bedroomNumber = 0;
  String groupId = '';
  String bedroomId = '';
  String surveillanceId = '';
  DocumentReference surveillance;

  @override
  void initState() {
    groupId = widget.groupId;
    bedroomId = widget.bedroomId;
    bedroomNumber = widget.bedroomNumber;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24.0,
      right: 0.0,
      child: GestureDetector(
        onTap: () async {
          surveillanceId = await surveillanceService.addSurveillance(
              bedroomId, groupId, bedroomNumber);
          surveillance = FirebaseFirestore.instance
              .collection('surveillances')
              .doc(surveillanceId);
          surveillance.get().then((document) {
            Map<String, dynamic> data =
                document?.data() as Map<String, dynamic>;
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SurveillancePage(
                  surveillances: Surveillances.fromJson(data),
                ),
              ),
            );
          });
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
