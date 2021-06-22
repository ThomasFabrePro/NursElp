import 'package:NursElp/services/BedroomService.dart';
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
              BedroomAddButton(
                groupId: groupId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
