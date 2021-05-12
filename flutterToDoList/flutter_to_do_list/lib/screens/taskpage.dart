import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/database_helper.dart';
import 'package:flutter_to_do_list/models/task.dart';
import 'package:flutter_to_do_list/models/todo.dart';

import '../widgets.dart';

class Taskpage extends StatefulWidget {
  final Task task;

  Taskpage({@required this.task});
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  String _taskTitle = "";
  int _taskId = 0;
  String _taskDescription = "";

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;

  bool _contentVisible = false;

  @override
  void initState() {
    if (widget.task != null) {
      //Set visibility to true
      _contentVisible = true;

      _taskDescription = widget.task.description;
      _taskTitle = widget.task.title;
      _taskId = widget.task.id;
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(
                                context); //fait retourner à la page précédente
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage(
                                'assets/images/arrow_back_icon.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _titleFocus,
                            onSubmitted: (value) async {
                              //Check for empty field
                              if (value != "") {
                                //Check if the task is null
                                if (widget.task == null) {
                                  //DatabaseHelper _dbHelper = DatabaseHelper();

                                  Task _newTask = Task(
                                    title: value,
                                  );
                                  _taskId =
                                      await _dbHelper.insertTask(_newTask);
                                  setState(() {
                                    _contentVisible = true;
                                    _taskTitle = value;
                                  });
                                  print("New Task Id: $_taskId");
                                } else {
                                  await _dbHelper.updateTaskTitle(
                                      _taskId, value);
                                  print("task updated");
                                }

                                _descriptionFocus
                                    .requestFocus(); //focusNode pour renvoyer l'utilisateur vers
                                //le champ description quand il valide le titre
                              }
                            },
                            controller: TextEditingController()
                              ..text = _taskTitle,
                            decoration: InputDecoration(
                              hintText: 'Nom de la tâche ...',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _contentVisible,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Expanded(
                        child: TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: null,
                          focusNode: _descriptionFocus,
                          onSubmitted: (value) {
                            if (value != "") {
                              if (_taskId != 0) {
                                _dbHelper.updateTaskDescription(_taskId, value);
                              }
                            }
                            _todoFocus.requestFocus();
                          },
                          controller: TextEditingController()
                            ..text = _taskDescription,
                          decoration: InputDecoration(
                            hintText: 'Entrez une description',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _contentVisible,
                    child: FutureBuilder(
                        initialData: [],
                        future: _dbHelper.getTodo(_taskId),
                        builder: (context, snapshot) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    //Switch the todo completion state
                                  },
                                  child: TodoWidget(
                                    text: snapshot.data[index].title,
                                    isDone: true,
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                  ),
                  Visibility(
                    visible: _contentVisible,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            margin: EdgeInsets.only(
                              right: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            child: Image(
                              image: AssetImage(
                                'assets/images/check_icon.png',
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              focusNode: _todoFocus,
                              onSubmitted: (value) async {
                                //Check for empty field
                                if (value != "") {
                                  //Check if the task is null
                                  if (widget.task != null) {
                                    Todo _newTodo = Todo(
                                      title: value,
                                      isDone: 0,
                                      taskId: widget.task.id,
                                    );

                                    await _dbHelper.insertTodo(_newTodo);
                                    setState(() {});
                                    print("Todo Created");
                                    print(_newTodo.title);
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter todo item..',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Visibility(
                visible: _contentVisible,
                child: Positioned(
                  bottom: 24.0,
                  right: 24.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Taskpage(task: null)),
                      );
                    },
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.indigo[900], Colors.indigo[300]],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: Image(
                        image: AssetImage(
                          'assets/images/trash_icon.png',
                        ),
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
