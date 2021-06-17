import 'package:NursElp/database_helper.dart';
import 'package:NursElp/screens/bedroom/BedroomNav.dart';
import 'package:NursElp/screens/bedroom/bedroom.dart';
import 'package:NursElp/screens/services/BedroomService.dart';
import 'package:flutter/material.dart';

class BedroomManagementPage extends StatefulWidget {
  final String groupId;

  BedroomManagementPage({
    Key key,
    this.groupId,
  }) : super(key: key);
  @override
  _BedroomManagementPageState createState() => _BedroomManagementPageState();
}

class _BedroomManagementPageState extends State<BedroomManagementPage> {
  BedroomService bedroomService = BedroomService();
  String groupId = '';

  @override
  void initState() {
    groupId = widget.groupId;
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Gestion des chambres',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GetBedrooms(
                      groupId,
                    ),
                  ),
                ],
              ),
              Positioned(
                //Bouton ajouter
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bedroomService.addBedroom(groupId);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
