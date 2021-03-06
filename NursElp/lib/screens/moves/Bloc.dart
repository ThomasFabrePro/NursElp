import 'package:flutter/material.dart';

class BlocPage extends StatefulWidget {
  final String bedroomId;

  const BlocPage({Key key, this.bedroomId}) : super(key: key);
  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bloc',
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
