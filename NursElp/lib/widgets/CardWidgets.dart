import 'package:NursElp/screens/moves/Absence.dart';
import 'package:NursElp/screens/moves/Bloc.dart';
import 'package:NursElp/screens/moves/Leaving.dart';
import 'package:NursElp/screens/moves/arriving.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
  TaskCardWidget({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
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
            color: Colors.red[300],
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Sans nom',
            style: TextStyle(
              color: Colors.red[900],
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 15.0,
            ),
            child: Text(
              description ?? 'Sans description',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
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
        // border: Border.all(
        //   color: Colors.redAccent,
        //   width: 1,
        // ),
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
                'Sortie : $leaving' ?? 'Pas de sortie pr??vue',
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
                            'Pr??sent',
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
                'D??placement : ${widget.moveType}',
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

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  TodoWidget({this.text, @required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
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
              color: isDone ? Colors.red[900] : Colors.transparent,
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
          Flexible(
            child: Text(
              text ?? 'Empty Todo',
              style: TextStyle(
                color: isDone ? Colors.red[900] : Colors.grey,
                fontSize: 16.0,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
              ),
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

  MenuCardWidget({this.navigator, this.title});
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
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
