import 'package:flutter/material.dart';
import 'package:NursElp/screens/tasks/TaskPage.dart';
import 'package:NursElp/widgets/CardWidgets.dart';

import '../../database_helper.dart';

class TasksManagementPage extends StatefulWidget {
  @override
  _TasksManagementPageState createState() => _TasksManagementPageState();
}

class _TasksManagementPageState extends State<TasksManagementPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Liste des tâches'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.deepOrange[400]],
                begin: Alignment(1, 0),
                end: Alignment(-1, 0),
              ),
            ),
          ),
        ),
        body: Container(
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
                                          builder: (context) => Taskpage(
                                            task: snapshot.data[index],
                                          ),
                                        )).then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: TaskCardWidget(
                                    title: snapshot.data[index].title,
                                    description:
                                        snapshot.data[index].description,
                                  ),
                                );
                              }),
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
                        colors: [Colors.redAccent, Colors.deepOrange[400]],
                        begin: Alignment(1, 0),
                        end: Alignment(-1, 0),
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
