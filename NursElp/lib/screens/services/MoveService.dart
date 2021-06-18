import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoveService {}

class GetMoves extends StatefulWidget {
  final String groupId;
  const GetMoves({Key key, this.groupId}) : super(key: key);

  @override
  _GetMovesState createState() => _GetMovesState();
}

class _GetMovesState extends State<GetMoves> {
  @override
  Widget build(BuildContext context) {
    CollectionReference moves = FirebaseFirestore.instance.collection('moves');

    return StreamBuilder<QuerySnapshot>(
      stream: moves
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
              return MoveCardWidget(
                bedroomNumber: data['bedroomNumber'] ?? '000',
                moveType: data['moveType'],
              );
            },
          ).toList(),
        );
      },
    );
  }
}
