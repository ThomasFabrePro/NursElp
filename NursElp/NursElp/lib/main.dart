import 'package:NursElp/screens/guests/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.grey[100],
        primaryColor: Colors.redAccent,
        dividerColor: Colors.redAccent,
        focusColor: Colors.red[900],
      ),
      home: AuthPage(),
    );
  }
}
