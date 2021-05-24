import 'package:NursElp/screens/guests/Auth.dart';
import 'package:NursElp/screens/services/UserService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await userService.logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                  (route) => false);
            },
            child: Text('SE DECONNECTER'),
          ),
        ),
      ),
    );
  }
}
