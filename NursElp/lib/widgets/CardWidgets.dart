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
  final String bedroomNumber;
  final String sortie;
  final bool isPresent;
  BedroomCardWidget({this.bedroomNumber, this.sortie, this.isPresent});

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
          border: Border.all(
            color: Colors.redAccent,
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bedroomNumber ?? 'Pas de numéro',
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
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
                      : Colors.redAccent[400],
                  borderRadius: BorderRadius.circular(45.0),
                  border: Border.all(
                    color: Colors.black,
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
              sortie ?? 'Pas de sortie prévue',
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
          colors: [Colors.redAccent, Colors.red[300]],
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 1.0),
        ),
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

//ignore: must_be_immutable
class LabelAndTextField extends StatefulWidget {
  LabelAndTextField(
      {Key key,
      this.labelText,
      this.textFieldHint,
      this.keyboardInputType,
      this.textFieldWidth,
      this.valueToSwitch});
  final String labelText;
  final String textFieldHint;
  final TextInputType keyboardInputType;
  final double textFieldWidth;
  String valueToSwitch;

  @override
  _LabelAndTextFieldState createState() => _LabelAndTextFieldState();
}

class _LabelAndTextFieldState extends State<LabelAndTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.labelText),
        Flexible(
          child: Container(
            width: widget.textFieldWidth,
            height: 40.0,
            margin: EdgeInsets.only(
              left: 10.0,
            ),
            child: TextField(
              keyboardType: widget.keyboardInputType,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
              onChanged: (value) => setState(() {
                widget.valueToSwitch = value;
                print(widget.valueToSwitch);
              }),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: widget.textFieldHint,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[200],
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
      ],
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