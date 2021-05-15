import 'package:NursElp/screens/bedroom.dart';
import 'package:NursElp/screens/bedroommanagement.dart';
import 'package:NursElp/screens/taskspage.dart';
import 'package:flutter/material.dart';

class Groupmenu extends StatefulWidget {
  @override
  _GroupmenuState createState() => _GroupmenuState();
}

class _GroupmenuState extends State<Groupmenu> {
  double boxMenuHeight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Service Onco',
              style: TextStyle(
                fontSize: 25,
              )),
          centerTitle: true,
          backgroundColor: Colors.red[300],
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings, size: 35), onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
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
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Diclaimer !\n"
                    "Aucune réelle information liée au secret professionnel n'est destinée à être renseignée sur cette application",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 18,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BedroomManagementPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text(
                      'Gestion des chambres ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Taskspage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text(
                      'Liste des tâches',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BedroomPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text(
                      'Surveillances importantes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BedroomPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text(
                      'Déplacements',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BedroomPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text(
                      'Bloc notes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BedroomPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text('Historique des tâches',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Container(
                //Item
                width: double.infinity,
                height: boxMenuHeight,
                margin: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[300],
                ),
                //color: Colors.red[300],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BedroomPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    child: Text('Annuaire interne',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
