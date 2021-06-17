import 'package:NursElp/screens/bedroom/Bedroom.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:NursElp/screens/moves/Arriving.dart';

class BedroomNav extends StatefulWidget {
  final String groupId;
  final String bedroomId;

  final bool isPresent;
  final String bedroomNumber;
  final bool sexe;
  final bool contagious;
  final String doctor;
  final String arriving;
  final String leaving;
  final String side;
  final List surveillances;
  final List bedroomTasks;
  final List moves;
  final String notes;
  final int sector;

  const BedroomNav({
    Key key,
    this.groupId,
    this.bedroomId,
    this.isPresent,
    this.bedroomNumber,
    this.sexe,
    this.contagious,
    this.doctor,
    this.arriving,
    this.leaving,
    this.side,
    this.surveillances,
    this.bedroomTasks,
    this.moves,
    this.notes,
    this.sector,
  }) : super(key: key);
  @override
  _BedroomNavState createState() => _BedroomNavState();
}

class _BedroomNavState extends State<BedroomNav> {
  int _currentIndex = 0;
  PageController _pageController;
  String bedroomNumber = '';
  String bedroomId = '';
  String side = '';
  String doctor = '';
  String notes = '';
  String groupId = '';
  String arriving = '';
  String leaving = '';

  bool sexe = false;
  bool isContagious = true;
  bool isPresent = true;

  List surveillances;
  List bedroomTasks;
  List moves;

  int sector = 1;

  @override
  void initState() {
    bedroomNumber = widget.bedroomNumber;
    bedroomId = widget.bedroomId;
    side = widget.side;
    doctor = widget.doctor;
    notes = widget.notes;
    groupId = widget.groupId;
    arriving = widget.arriving;
    leaving = widget.leaving;
    sexe = widget.sexe;
    isContagious = widget.contagious;
    surveillances = widget.surveillances;
    bedroomTasks = widget.bedroomTasks;
    moves = widget.moves;
    sector = widget.sector;
    isPresent = widget.isPresent;

    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            BedroomPage(
              groupId: groupId,
              bedroomId: bedroomId,
              isPresent: isPresent,
              leaving: leaving,
              arriving: arriving,
              doctor: doctor,
              bedroomNumber: bedroomNumber,
              sexe: sexe,
              contagious: isContagious,
              notes: notes,
              sector: sector,
              side: side,
              surveillances: surveillances,
              bedroomTasks: bedroomTasks,
              moves: moves,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            ArrivingPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.hotel_rounded),
            title: Text('Chambre'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.airplay),
            title: const Text('Surveillances'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.article),
            title: Text('Tâches'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.airport_shuttle),
            title: Text('Déplacements'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
