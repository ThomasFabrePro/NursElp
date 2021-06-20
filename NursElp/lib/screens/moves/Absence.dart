import 'package:flutter/material.dart';

class AbsencePage extends StatefulWidget {
  final String bedroomId;

  const AbsencePage({Key key, this.bedroomId}) : super(key: key);
  @override
  _AbsencePageState createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Absence',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[300],
        ),
      ),
    );
  }
}
