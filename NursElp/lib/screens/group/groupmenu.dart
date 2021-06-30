import 'package:NursElp/screens/bedroom/BedroomsManagement.dart';
import 'package:NursElp/screens/group/GroupSettings.dart';
import 'package:NursElp/screens/surveillances/ImportantSurveillancesManagementPage.dart';
import 'package:NursElp/screens/tasks/TasksManagement.dart';
import 'package:flutter/material.dart';
import '../bedroom/bedroomPage.dart';
import '../moves/movesmanagement.dart';
import '../../widgets/CardWidgets.dart';

class GroupMenu extends StatefulWidget {
  final String groupName;
  final String groupId;

  GroupMenu({
    Key key,
    this.groupName,
    this.groupId,
  }) : super(key: key);
  @override
  _GroupMenuState createState() => _GroupMenuState();
}

class _GroupMenuState extends State<GroupMenu> {
  double boxMenuHeight = 65;
  String title = '';
  String groupId = '';

  @override
  void initState() {
    title = widget.groupName;
    groupId = widget.groupId;
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(title,
                style: TextStyle(
                  fontSize: 25,
                )),
            //leading: Container(), //désactiver fleche de retour
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.deepOrange[400]],
                  begin: Alignment(1, 0),
                  end: Alignment(-1, 0),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.red[400],
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.settings, size: 35),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupSettingsPage(),
                      ),
                    );
                  })
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
                        "Disclaimer !\n"
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
                    icon: Icon(
                      Icons.hotel_rounded,
                      color: Colors.white,
                    ),
                    navigator: BedroomManagementPage(
                      groupId: groupId,
                    ),
                  ),
                  MenuCardWidget(
                    title: 'Liste des tâches',
                    icon: Icon(
                      Icons.article,
                      color: Colors.white,
                    ),
                    navigator: TasksManagementPage(
                      groupId: groupId,
                    ),
                  ),
                  MenuCardWidget(
                    title: 'Surveillances importantes',
                    icon: Icon(
                      Icons.airplay,
                      color: Colors.white,
                    ),
                    navigator: ImportantSurveillancesManagementPage(
                      groupId: groupId,
                    ),
                  ),
                  // MenuCardWidget(
                  //   title: 'Déplacements',
                  // icon: Icon(
                  //     Icons.airport_shuttle,
                  //     color: Colors.white,
                  //   ),
                  //   navigator: MovesManagementPage(),
                  // ),
                  // MenuCardWidget(
                  //   title: 'Bloc Notes',
                  //   navigator: BedroomPage(),
                  // ),
                  // MenuCardWidget(
                  //   title: 'Historique des tâches',
                  //   navigator: BedroomPage(),
                  // ),
                  // MenuCardWidget(
                  //   title: 'Annuaire interne',
                  //   navigator: BedroomPage(),
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
