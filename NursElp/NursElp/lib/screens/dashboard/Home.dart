import 'package:NursElp/screens/GroupCreation.dart';
import 'package:NursElp/screens/guests/Auth.dart';
import 'package:NursElp/screens/services/UserService.dart';
import 'package:NursElp/widgets.dart';
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
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings, size: 35), onPressed: () {})
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
                    child: Icon(
                      Icons.add,
                      size: 80,
                    ),
                  ),

                  //TODO bouton déco à récup
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     await userService.logout();
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => AuthPage()),
                  //         (route) => false);
                  //   },
                  //   child: Text('SE DECONNECTER'),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MenuCardWidget(
                      title: 'Bloc',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Nat',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Cardio',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Onco',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Pneumo',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Réa',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Psy',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Gastro',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'Uro',
                      navigator: AuthPage(),
                    ),
                    MenuCardWidget(
                      title: 'EHPAD',
                      navigator: AuthPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
