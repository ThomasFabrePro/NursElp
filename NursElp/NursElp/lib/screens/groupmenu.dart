import 'package:NursElp/screens/bedroom/bedroom.dart';
import 'package:NursElp/screens/bedroom/bedroommanagement.dart';
import 'package:NursElp/screens/bedroom/bedroomnav.dart';
import 'package:NursElp/screens/moves/movesmanagement.dart';
import 'package:NursElp/screens/tasks/taskspage.dart';
import 'package:flutter/material.dart';
import 'package:NursElp/widgets.dart';

class GroupMenu extends StatefulWidget {
  @override
  _GroupMenuState createState() => _GroupMenuState();
}

class _GroupMenuState extends State<GroupMenu> {
  double boxMenuHeight = 65;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Service Onco',
                style: TextStyle(
                  fontSize: 25,
                )),
            leading: Container(), //désactiver fleche de retour
            centerTitle: true,
            backgroundColor: Colors.red[400],
            actions: <Widget>[
              IconButton(icon: Icon(Icons.settings, size: 35), onPressed: () {})
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    //Disclaimer
                    margin: EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: 10,
                    ),
                    width: double.infinity,
                    height: 125,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Diclaimer !\n"
                        "Aucune réelle information liée au secret professionnel "
                        "n'est destinée à être renseignée sur cette application !",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  MenuCardWidget(
                    title: 'Gestion des chambres',
                    navigator: BedroomManagementPage(),
                  ),
                  MenuCardWidget(
                    title: 'Liste des tâches',
                    navigator: Taskspage(),
                  ),
                  MenuCardWidget(
                    title: 'Surveillances importantes',
                    navigator: BedroomNav(),
                  ),
                  MenuCardWidget(
                    title: 'Déplacements',
                    navigator: MovesManagementPage(),
                  ),
                  MenuCardWidget(
                    title: 'Bloc Notes',
                    navigator: BedroomPage(),
                  ),
                  MenuCardWidget(
                    title: 'Historique des tâches',
                    navigator: BedroomPage(),
                  ),
                  MenuCardWidget(
                    title: 'Annuaire interne',
                    navigator: BedroomPage(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
