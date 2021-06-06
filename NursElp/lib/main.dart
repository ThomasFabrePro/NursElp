import 'package:NursElp/screens/dashboard/Home.dart';
import 'package:NursElp/screens/guests/AccountCreation.dart';
import 'package:NursElp/screens/guests/auth.dart';
//import 'package:NursElp/screens/guests/Auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:NursElp/screens/services/UserService.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Pour etre sur que tout est initialisé
  await Firebase.initializeApp(); //Pour connecter l'appli aux services google
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.grey[100],
        primaryColor: Colors.redAccent,
        dividerColor: Colors.redAccent,
        focusColor: Colors.red[900],
        buttonColor: Colors.redAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            elevation: 2,
            shadowColor: Colors.redAccent,
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: StreamBuilder(
        stream: userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomeScreen();
            }
            return AuthPage();
          }
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('loading...'),
              ),
            ),
          );
        },
      ),
    );
  }
}
