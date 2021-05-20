import 'package:NursElp/screens/groupmenu.dart';
import 'package:NursElp/screens/guests/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.redAccent,
        dividerColor: Colors.redAccent,
        focusColor: Colors.redAccent,
      ),
      home: AuthPage(),
    );
  }
}
