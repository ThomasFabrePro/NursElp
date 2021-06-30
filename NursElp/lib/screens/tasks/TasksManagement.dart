import 'package:NursElp/services/TaskService.dart';
import 'package:flutter/material.dart';

class TasksManagementPage extends StatefulWidget {
  final groupId;
  const TasksManagementPage({Key key, this.groupId}) : super(key: key);

  @override
  _TasksManagementPageState createState() => _TasksManagementPageState();
}

class _TasksManagementPageState extends State<TasksManagementPage> {
  String groupId = '';
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Liste des tâches',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
              GetTasks(
                groupId: groupId,
              ),
              TaskAddButton(
                bedroomId: null,
                groupId: groupId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
