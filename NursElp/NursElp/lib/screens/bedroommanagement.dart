import 'package:nurselp/database_helper.dart';
import 'package:nurselp/screens/bedroomnav.dart';
import 'package:nurselp/screens/taskpage.dart';
import 'package:nurselp/widgets.dart';
import 'package:flutter/material.dart';

class BedroomManagementPage extends StatefulWidget {
  @override
  _BedroomManagementPageState createState() => _BedroomManagementPageState();
}

class _BedroomManagementPageState extends State<BedroomManagementPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestion des chambres',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10,
          ),
          color: Colors.grey[100],
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BedroomNav(),
                                      )).then((value) {
                                    setState(() {});
                                  });
                                },
                                child: BedroomCardWidget(
                                  bedroomNumber: '221',
                                  sortie: 'sortie le : 25 Mai',
                                  isPresent: true,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                //Bouton ajouter
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(
                                task: null,
                              )),
                    ).then((value) {
                      setState(() {});
                    });
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
      ),
    );
  }
}
