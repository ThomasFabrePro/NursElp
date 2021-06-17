import 'package:NursElp/screens/services/GroupsService.dart';
import 'package:flutter/material.dart';
import 'package:NursElp/screens/guests/auth.dart';
import 'package:NursElp/screens/services/UserService.dart';
import 'package:NursElp/widgets/CardWidgets.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Options du compte'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.yellow[300],
                    ),
                    onPressed: () {},
                    child: Text('MODE NUIT'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await userService.logout();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => AuthPage()),
                          (route) => false);
                    },
                    child: Text('ME DECONNECTER'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LabelAndTextField(
                labelText: 'Pseudo',
              ),
              SizedBox(
                height: 25,
              ),
              Text("Tâches par défaut à l'entrée"),
            ],
          ),
        ),
      ),
    );
  }
}
