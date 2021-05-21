import 'package:flutter/material.dart';
import 'package:NursElp/screens/moves/choosenewmove.dart';

class MovesManagementPage extends StatefulWidget {
  @override
  _MovesManagementPageState createState() => _MovesManagementPageState();
}

class _MovesManagementPageState extends State<MovesManagementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Déplacements',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[300],
          actions: <Widget>[
            IconButton(icon: Icon(Icons.filter_alt, size: 35), onPressed: () {})
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              //Bouton ajouter
              bottom: 24.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseNewMovePage()),
                  );
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red[900], Colors.red[300]],
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                  child: Image(
                    image: AssetImage(
                      'assets/images/add_icon.png',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
