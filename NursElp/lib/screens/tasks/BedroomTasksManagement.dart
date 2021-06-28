import 'package:NursElp/services/BedroomService.dart';
import 'package:NursElp/services/SurveillanceService.dart';
import 'package:NursElp/services/TaskService.dart';
import 'package:flutter/material.dart';

class BedroomTasksManagementPage extends StatefulWidget {
  final String groupId;
  final String bedroomId;
  final int bedroomNumber;
  const BedroomTasksManagementPage({
    Key key,
    this.groupId,
    this.bedroomId,
    this.bedroomNumber,
  }) : super(key: key);
  @override
  _BedroomTasksManagementPageState createState() =>
      _BedroomTasksManagementPageState();
}

class _BedroomTasksManagementPageState
    extends State<BedroomTasksManagementPage> {
  String groupId = '';
  String bedroomId = '';
  int bedroomNumber = 0;
  BedroomService bedroomService = BedroomService();
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
    bedroomId = widget.bedroomId;
    bedroomNumber = widget.bedroomNumber;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Liste des tâches $bedroomNumber',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.deepOrange[400]],
                begin: Alignment(1, 0),
                end: Alignment(-1, 0),
              ),
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  if (bedroomNumber != 0) {
                    Navigator.pop(context);
                  } else {
                    final snackBar = SnackBar(
                      content: Text(
                          'Vous devez fournir un numéro de chambre valide'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10,
          ),
          color: Colors.grey[100],
          child: Stack(
            children: [
              GetBedroomTasks(
                groupId: groupId,
                bedroomId: bedroomId,
              ), //transformer en GetBedroomSurveillances car page propre à la chambre
              TaskAddButton(
                bedroomId: bedroomId,
                groupId: groupId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
