import 'package:NursElp/screens/guests/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Pour etre sur que tout est initialisé
  await Firebase.initializeApp(); //Pour connecter l'appli aux services google
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
