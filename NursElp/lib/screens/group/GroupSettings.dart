import 'package:flutter/material.dart';

class GroupSettingsPage extends StatefulWidget {
  @override
  _GroupSettingsPageState createState() => _GroupSettingsPageState();
}

class _GroupSettingsPageState extends State<GroupSettingsPage> {
  int nbrSectors = 0;
  int nbrMembers = 1;
  List members = ["Keven", "Solveig", "Camel"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Option de groupe',
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nombre de secteurs :     $nbrSectors',
                  ),
                  //SizedBox(width: 40),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (nbrSectors > 0) {
                            nbrSectors--;
                          }
                        });
                      },
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                  //SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        nbrSectors++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nombre de membre :     $nbrMembers',
                  ),
                  //SizedBox(width: 40),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (nbrMembers > 1) {
                            nbrMembers--;
                          }
                        });
                      },
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                  //SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        nbrMembers++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Membres :  ',
                  ),
                  for (String member in members)
                    Text(
                      "$member, ",
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
