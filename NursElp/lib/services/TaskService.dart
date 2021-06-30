import 'package:NursElp/models/TaskModel.dart';
import 'package:NursElp/screens/tasks/taskpage.dart';
import 'package:NursElp/services/BedroomService.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskService {
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<String> addTask(
    String bedroomId,
    String groupId,
  ) {
    String taskId;
    String key = UniqueKey().toString();

    tasks.add({
      'taskId': key,
      'groupId': groupId,
      'title': '',
      'description': '',
      'bedroomId': bedroomId,
    });
    return tasks.where('taskId', isEqualTo: key).get().then((querySnapshot) {
      taskId = querySnapshot.docs.single.id;
      querySnapshot.docs.single.reference.update({
        'taskId': taskId,
      });
      return taskId;
    });
  }

  void updateTask(
    String taskId,
    String field,
    var value,
  ) {
    DocumentReference task =
        FirebaseFirestore.instance.collection('tasks').doc(taskId);
    task.update({field: value});
  }

  void deleteTask(String taskId) {
    DocumentReference task =
        FirebaseFirestore.instance.collection('tasks').doc(taskId);
    task.delete();
  }
}

class GetBedroomTasks extends StatefulWidget {
  final String groupId;
  final String bedroomId;

  const GetBedroomTasks({Key key, this.groupId, this.bedroomId})
      : super(key: key);

  @override
  _GetBedroomTasksState createState() => _GetBedroomTasksState();
}

class _GetBedroomTasksState extends State<GetBedroomTasks> {
  String groupId = '';
  String bedroomId = '';
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
    bedroomId = widget.bedroomId;
  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: tasks
          .where('groupId', isEqualTo: groupId)
          .where('bedroomId', isEqualTo: bedroomId)
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('erreur');
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Icon(Icons.autorenew),
          );
        }

        return ListView(
          children: snapshot.data.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document?.data() as Map<String, dynamic>;
              return TaskCardWidget(
                  title: Task.fromJson(data).title,
                  description: Task.fromJson(data).description,
                  navigator: TaskPage(
                    task: Task.fromJson(data),
                  ));
            },
          ).toList(),
        );
      },
    );
  }
}

class GetTasks extends StatelessWidget {
  final String groupId;
  const GetTasks({Key key, this.groupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return StreamBuilder<QuerySnapshot>(
      stream: tasks
          .where('groupId', isEqualTo: groupId)
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('erreur');
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Icon(Icons.autorenew),
          );
        }

        return ListView(
          children: snapshot.data.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document?.data() as Map<String, dynamic>;
              return TaskCardWidget(
                  title: Task.fromJson(data).title,
                  description: Task.fromJson(data).description,
                  navigator: TaskPage(
                    task: Task.fromJson(data),
                  ));
            },
          ).toList(),
        );
      },
    );
  }
}

class TaskAddButton extends StatefulWidget {
  final String bedroomId;
  final String groupId;
  const TaskAddButton({Key key, this.bedroomId, this.groupId})
      : super(key: key);

  @override
  _TaskAddButtonState createState() => _TaskAddButtonState();
}

class _TaskAddButtonState extends State<TaskAddButton> {
  TaskService taskService = TaskService();
  BedroomService bedroomService = BedroomService();
  String bedroomId = '';
  String groupId = '';
  String taskId = '';
  List<String> bedroomList = ['Aucune'];
  DocumentReference task;

  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
    bedroomId = widget.bedroomId;
  }

  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24.0,
      right: 0.0,
      child: GestureDetector(
        onTap: () async {
          taskId = await taskService.addTask(bedroomId, groupId);

          task = FirebaseFirestore.instance.collection('tasks').doc(taskId);
          task.get().then((document) {
            Map<String, dynamic> data =
                document?.data() as Map<String, dynamic>;
            return Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskPage(
                  task: Task.fromJson(data),
                ),
              ),
            );
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
    );
  }
}

class TaskDropDownButton extends StatefulWidget {
  final String groupId;
  const TaskDropDownButton({Key key, this.groupId}) : super(key: key);

  @override
  _TaskDropDownButtonState createState() => _TaskDropDownButtonState();
}

class _TaskDropDownButtonState extends State<TaskDropDownButton> {
  String groupId = '';
  String dropdownValue = 'aucune';
  List<String> bedroomList;
  String bedroomNumber = '';
  BedroomService bedroomService = BedroomService();
  bool bedroomTest;
  CollectionReference bedrooms =
      FirebaseFirestore.instance.collection('bedrooms');
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        //TODO tester avec le futurebuilder
        stream: bedrooms.where('groupId', isEqualTo: groupId).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('erreur');
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Icon(Icons.autorenew),
            );
          }

          return DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue.toString();
              });
            },
            items: bedroomList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        });
  }
}
