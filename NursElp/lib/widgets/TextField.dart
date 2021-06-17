import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;

  const MyTextField({Key key, this.hintText}) : super(key: key);
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[200],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
