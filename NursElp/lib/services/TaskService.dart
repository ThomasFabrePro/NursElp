import 'package:NursElp/models/TaskModel.dart';
import 'package:NursElp/screens/tasks/taskpage.dart';
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
    DocumentReference surveillance =
        FirebaseFirestore.instance.collection('tasks').doc(taskId);
    surveillance.update({field: value});
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
  String bedroomId = '';
  String groupId = '';
  String taskId = '';
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
          //bedroomNumber = widget.bedroomNumber;
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
