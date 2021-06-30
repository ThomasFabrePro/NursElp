import 'package:NursElp/models/TodoModel.dart';
import 'package:NursElp/screens/moves/Absence.dart';
import 'package:NursElp/screens/moves/Bloc.dart';
import 'package:NursElp/screens/moves/Leaving.dart';
import 'package:NursElp/screens/moves/arriving.dart';
import 'package:NursElp/services/TodoService.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final Widget navigator;
  final bool displayBedroomNumber;
  final int bedroomNumber;
  TaskCardWidget(
      {this.title,
      this.description,
      this.navigator,
      this.displayBedroomNumber,
      this.bedroomNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.deepOrange[400]],
          begin: Alignment(1, 0),
          end: Alignment(-1, 0),
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigator));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title ?? 'Sans nom',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bedroomNumber != null && bedroomNumber != 0
                ? Text(
                    bedroomNumber.toString(),
                    style: TextStyle(color: Colors.white),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class BedroomCardWidget extends StatelessWidget {
  final int bedroomNumber;
  final String leaving;
  final bool isPresent;
  final Widget navigator;
  BedroomCardWidget(
      {this.bedroomNumber, this.leaving, this.isPresent, this.navigator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigator),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    bedroomNumber.toString() ?? 0.toString(),
                    style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 25.0,
                  height: 25.0,
                  margin: EdgeInsets.only(
                    left: 230.0,
                  ),
                  decoration: BoxDecoration(
                    color: isPresent
                        ? Colors.lightGreenAccent[400]
                        : Colors.redAccent,
                    borderRadius: BorderRadius.circular(45.0),
                    border: Border.all(
                      color: Colors.black45,
                      width: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                'Sortie : $leaving' ?? 'Pas de sortie prévue',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurveillanceCardWidget extends StatelessWidget {
  final int bedroomNumber;
  final String title;
  final bool important;
  final String description;
  final Widget navigator;
  SurveillanceCardWidget(
      {this.bedroomNumber,
      this.title,
      this.navigator,
      this.important,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        // border: Border.all(
        //   color: Colors.white,
        //   width: 1,
        // ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigator),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title == '' || title == null ? 'Pas de titre' : title,
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          description ?? 'Pas de description',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                important
                    ? Icon(
                        Icons.warning,
                        size: 37,
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImportantSurveillanceCardWidget extends StatefulWidget {
  final int bedroomNumber;
  final String title;
  final String description;
  final bool isPresent;
  final Widget navigator;
  ImportantSurveillanceCardWidget({
    this.bedroomNumber,
    this.title,
    this.navigator,
    this.description,
    this.isPresent,
  });

  @override
  _ImportantSurveillanceCardWidgetState createState() =>
      _ImportantSurveillanceCardWidgetState();
}

class _ImportantSurveillanceCardWidgetState
    extends State<ImportantSurveillanceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
        color: widget.isPresent ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 8,
            blurRadius: 15,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.navigator),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title == '' || widget.title == null
                            ? 'Pas de titre'
                            : widget.title,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          widget.description ?? 'Pas de description',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(widget.bedroomNumber.toString()),
                    widget.isPresent
                        ? Text(
                            'Présent',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        : Text(
                            'Absent',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MoveCardWidget extends StatefulWidget {
  final int bedroomNumber;
  final String moveType;
  final Widget navigator;
  MoveCardWidget({
    this.bedroomNumber,
    this.moveType,
    this.navigator,
  });

  @override
  _MoveCardWidgetState createState() => _MoveCardWidgetState();
}

class _MoveCardWidgetState extends State<MoveCardWidget> {
  String moveType = '';
  @override
  void initState() {
    moveType = widget.moveType;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 24.0,
      ),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.redAccent,
            width: 1,
          )),
      child: InkWell(
        onTap: () {
          switch (moveType) {
            case 'arriving':
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArrivingPage()),
                );
                break;
              }
            case 'leaving':
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeavingPage()),
                );
                break;
              }
            case 'bloc':
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlocPage()),
                );
                break;
              }
            case 'absence':
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AbsencePage()),
                );
                break;
              }
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.bedroomNumber.toString() ?? '',
                    style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5.0,
              ),
              child: Text(
                'Déplacement : ${widget.moveType}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoWidget extends StatefulWidget {
  final Todo todo;
  TodoWidget({this.todo});

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  TodoService todoService = TodoService();
  String title = '';
  String taskId = '';
  String todoId = '';
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    taskId = widget.todo.taskId;
    todoId = widget.todo.todoId;
    isDone = widget.todo.isDone;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isDone = !isDone;
                todoService.updateTodo(todoId, 'isDone', isDone);
              });
            },
            child: Container(
              width: 30.0,
              height: 30.0,
              margin: EdgeInsets.only(
                right: 12.0,
              ),
              decoration: BoxDecoration(
                gradient: isDone
                    ? LinearGradient(
                        colors: [Colors.redAccent, Colors.deepOrange[400]],
                        begin: Alignment(1, 0),
                        end: Alignment(-1, 0),
                      )
                    : LinearGradient(
                        colors: [Colors.transparent, Colors.transparent],
                        begin: Alignment(1, 0),
                        end: Alignment(-1, 0),
                      ),
                borderRadius: BorderRadius.circular(6.0),
                border: isDone
                    ? null
                    : Border.all(
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
          ),
          Flexible(
            child: TextField(
              controller: TextEditingController(text: title ?? 'Todo sans nom'),
              onSubmitted: (value) {
                if (value != '') {
                  setState(() {
                    title = value;
                  });
                  todoService.updateTodo(todoId, 'title', value);
                }
              },
              style: TextStyle(
                color: isDone ? Colors.redAccent : Colors.grey[600],
                fontSize: 19.0,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
              ),
              decoration: InputDecoration.collapsed(hintText: 'New todo'),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCardWidget extends StatelessWidget {
  final double boxMenuHeight = 65;
  final Widget navigator;
  final String title;
  final Icon icon;
  MenuCardWidget({this.navigator, this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      //Item
      width: double.infinity,
      height: boxMenuHeight,
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.deepOrange[400]],
          begin: Alignment(1, 0),
          end: Alignment(-1, 0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigator),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null ? Container() : icon,
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
