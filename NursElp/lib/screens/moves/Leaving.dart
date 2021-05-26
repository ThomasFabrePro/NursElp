import 'package:flutter/material.dart';

class LeavingPage extends StatefulWidget {
  @override
  _LeavingPageState createState() => _LeavingPageState();
}

class _LeavingPageState extends State<LeavingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sortie',
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
