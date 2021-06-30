import 'package:NursElp/services/BedroomService.dart';
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
  String newId = '';
  String todoTitle = '';

  int bedroomNumber = 0;
  int number = 0;

  bool checkBedroom = false;

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;

  BedroomService bedroomService = BedroomService();

  @override
  void initState() {
    bedroomId = widget.task.bedroomId;
    groupId = widget.task.groupId;
    taskDescription = widget.task.description;
    taskTitle = widget.task.title;
    taskId = widget.task.taskId;
    bedroomNumber = widget.task.bedroomNumber;

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
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete_outline_rounded, size: 35),
                onPressed: () {
                  taskService.deleteTask(taskId);
                  Navigator.pop(context);
                })
          ],
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
                    Row(
                      children: [
                        Text(
                          'Chambre',
                        ),
                        Flexible(
                          child: Container(
                            width: 120.0,
                            height: 40.0,
                            margin: EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 8,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                  text: bedroomNumber.toString(), //A tester
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                enableSuggestions: false,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                onSubmitted: (value) async {
                                  number = int.parse(value);

                                  checkBedroom =
                                      await bedroomService.checkBedroomNumber(
                                          number, groupId, bedroomId);
                                  if (number == 0) {
                                    taskService.updateTask(
                                        taskId, 'bedroomNumber', number);
                                    taskService.updateTask(
                                        taskId, 'bedroomId', '');
                                    return;
                                  } else if (!checkBedroom &&
                                      number != bedroomNumber) {
                                    setState(() {
                                      bedroomNumber = number;
                                    });
                                    newId = await bedroomService.getBedroomId(
                                        bedroomNumber, groupId);
                                    taskService.updateTask(
                                        taskId, 'bedroomId', newId);
                                    taskService.updateTask(
                                        taskId, 'bedroomNumber', bedroomNumber);
                                  } else {
                                    setState(() {
                                      value = bedroomNumber.toString();
                                    }); //TODO snackbar pour quand c'est le meme numéro qu'avant
                                    final snackBar = SnackBar(
                                      content: Text(
                                        "La chambre $number n'existe pas",
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[200],
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.redAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    bottom: 0.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.contact_support, color: Colors.redAccent),
                        Expanded(
                          child: Text(
                            'Entrez 0 pour ne choisir aucune chambre',
                            maxLines: 3,
                            style: TextStyle(fontSize: 11.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
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
                        labelStyle: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 21.0,
                        ),
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
                            width: 1,
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
