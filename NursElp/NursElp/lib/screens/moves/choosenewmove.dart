import 'package:flutter/material.dart';
import 'package:NursElp/screens/moves/absence.dart';
import 'package:NursElp/screens/moves/arriving.dart';
import 'package:NursElp/screens/moves/bloc.dart';
import 'package:NursElp/screens/moves/leaving.dart';
import 'package:NursElp/widgets.dart';

class ChooseNewMovePage extends StatefulWidget {
  @override
  _ChooseNewMovePageState createState() => _ChooseNewMovePageState();
}

class _ChooseNewMovePageState extends State<ChooseNewMovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nouveau déplacement',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuCardWidget(
              title: 'Entrée',
              navigator: ArrivingPage(),
            ),
            MenuCardWidget(
              title: 'Sortie',
              navigator: LeavingPage(),
            ),
            MenuCardWidget(
              title: 'Bloc',
              navigator: BlocPage(),
            ),
            MenuCardWidget(
              title: 'Absence',
              navigator: AbsencePage(),
            ),
          ],
        ),
      ),
    );
  }
}
