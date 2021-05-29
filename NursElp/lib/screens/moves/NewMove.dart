import 'package:flutter/material.dart';
import 'package:NursElp/screens/moves/Absence.dart';
import 'package:NursElp/screens/moves/Arriving.dart';
import 'package:NursElp/screens/moves/Bloc.dart';
import 'package:NursElp/screens/moves/Leaving.dart';
import 'package:NursElp/widgets/CardWidgets.dart';

class ChooseNewMovePage extends StatefulWidget {
  @override
  _ChooseNewMovePageState createState() => _ChooseNewMovePageState();
}

class _ChooseNewMovePageState extends State<ChooseNewMovePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Nouveau déplacement',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
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
      ),
    );
  }
}
