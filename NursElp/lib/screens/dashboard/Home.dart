import 'package:NursElp/screens/group/GroupCreation.dart';
import 'package:NursElp/screens/guests/AccountSettings.dart';
import 'package:NursElp/services/GroupsService.dart';
import 'package:NursElp/services/UserService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService userService = UserService();
  GroupService groupService = GroupService();
  UserCredential userCredential;
  //String userId = userCredential.user.uid;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Services"),
          centerTitle: true,
          leading: Container(),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings, size: 35),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountSettingsPage()),
                  );
                })
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupCreationPage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.red[300]],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mes groupes',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Divider(
                height: 15,
                thickness: 3,
                indent: 40,
                endIndent: 40,
                color: Colors.red,
              ),
            ),
            Expanded(child: GetGroups())
          ],
        ),
      ),
    );
  }
}
