import 'package:NursElp/models/SurveillancesModel.dart';
import 'package:NursElp/screens/surveillances/SurveillancePage.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SurveillanceService {}

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
