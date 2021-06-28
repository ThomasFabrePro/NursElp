import 'package:NursElp/services/TaskService.dart';
import 'package:NursElp/services/TodoService.dart';
import 'package:flutter/material.dart';
import 'package:NursElp/models/TaskModel.dart';
import 'package:NursElp/models/TodoModel.dart';

import '../../widgets/CardWidgets.dart';

class TaskPage extends StatefulWidget {
  final Task task;

  TaskPage({this.task});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TaskService taskService = TaskService();
  TodoService todoService = TodoService();

  String taskTitle = "";
  String taskId = '';
  String taskDescription = "";
  String groupId = '';
  String bedroomId = '';
  String todoTitle = '';

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;

  @override
  void initState() {
    if (widget.task != null) {
      //   //Set visibility to true
      //   _contentVisible = true;
      bedroomId = widget.task.bedroomId;
      groupId = widget.task.groupId;
      taskDescription = widget.task.description;
      taskTitle = widget.task.title;
      taskId = widget.task.taskId;
    }
    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _todoFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    _todoFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            taskTitle != '' ? taskTitle : 'Nouvelle tâche',
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  if (taskTitle != '') {
                    Navigator.pop(context);
                  } else {
                    final snackBar = SnackBar(
                      content: Text('Vous devez donner un nom à cette tâche'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            },
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: TextEditingController(text: taskTitle),
                      style: TextStyle(fontSize: 24),
                      onSubmitted: (value) {
                        if (value != '' &&
                            value != null &&
                            value != taskTitle) {
                          taskTitle = value;
                          taskService.updateTask(taskId, 'title', taskTitle);
                        } else
                          setState(() {});
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Titre',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Description',
                    ),
                    // SizedBox(height: 10),
                    TextField(
                      controller: TextEditingController(
                        text: taskDescription ?? null,
                      ),
                      maxLines: null,
                      onSubmitted: (value) {
                        if (value != taskDescription) {
                          taskDescription = value;
                          taskService.updateTask(
                              taskId, 'description', taskDescription);
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                        hintText: 'Entrez une description',
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: GetTodos(
                        taskId: taskId,
                      ),
                    ),
                    TextField(
                        focusNode: _todoFocus,
                        controller: TextEditingController()
                          ..text = '', //Remet le champ blanc apres avoir validé
                        onSubmitted: (value) async {
                          //Check for empty field
                          if (value != "") {
                            //Check if the task is null

                            setState(() {
                              todoTitle = value;
                              todoService.addTodo(taskId, todoTitle);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter todo item..',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
