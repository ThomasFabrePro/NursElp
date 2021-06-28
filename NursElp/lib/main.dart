import 'package:NursElp/screens/dashboard/Home.dart';
import 'package:NursElp/screens/guests/auth.dart';
import 'package:NursElp/screens/tasks/taskpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:NursElp/services/UserService.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Pour etre sur que tout est initialisé
  await Firebase.initializeApp(); //Pour connecter l'appli aux services google
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20),
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


//TODO implementer la notion de side pour les chambres
//TODO bouton quitter le groupe dans les settings du groupe


//TODO ajouter les notif (pour les surv par ex)
//TODO ajouter les examens dans les menus ?
