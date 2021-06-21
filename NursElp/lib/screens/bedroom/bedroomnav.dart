import 'package:NursElp/models/BedroomModel.dart';
import 'package:NursElp/screens/bedroom/BedroomPage.dart';
import 'package:NursElp/screens/moves/movesmanagement.dart';
import 'package:NursElp/screens/surveillances/ImportantSurveillancesManagementPage.dart';
import 'package:NursElp/screens/surveillances/SurveillancesManagement.dart';
import 'package:NursElp/screens/tasks/TasksManagement.dart';
import 'package:NursElp/services/BedroomService.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BedroomNav extends StatefulWidget {
  final Bedroom bedroom;

  const BedroomNav({
    Key key,
    this.bedroom,
  }) : super(key: key);
  @override
  _BedroomNavState createState() => _BedroomNavState();
}

class _BedroomNavState extends State<BedroomNav> {
  int _currentIndex = 0;
  BedroomService bedroomService = BedroomService();
  Bedroom bedroom;
  PageController _pageController;
  int bedroomNumber = 0;

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

  bool checkBedroom;

  List surveillances;
  List bedroomTasks;
  List moves;

  int sector = 1;

  @override
  void initState() {
    bedroom = widget.bedroom;
    bedroomNumber = widget.bedroom.bedroomNumber;
    bedroomId = widget.bedroom.bedroomId;
    side = widget.bedroom.side;
    doctor = widget.bedroom.doctor;
    notes = widget.bedroom.notes;
    groupId = widget.bedroom.groupId;
    arriving = widget.bedroom.arriving;
    leaving = widget.bedroom.leaving;
    sexe = widget.bedroom.sexe;
    isContagious = widget.bedroom.contagious;
    surveillances = widget.bedroom.surveillances;
    bedroomTasks = widget.bedroom.bedroomTasks;
    moves = widget.bedroom.moves;
    sector = widget.bedroom.sector;
    isPresent = widget.bedroom.isPresent;

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
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                bedroomNumber = bedroomNumber;
              });
            },
            children: <Widget>[
              BedroomPage(
                  bedroom: bedroom,
                  onBedroomNumberChanged: (int value) {
                    setState(() => bedroomNumber =
                        value); //pour transmettre aux autres pages le changement de numéro de chambre
                  }),
              SurveillancesManagementPage(
                groupId: groupId,
                bedroomId: bedroomId,
                bedroomNumber: bedroomNumber,
              ),
              TasksManagementPage(),
              MovesManagementPage(),
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
              icon: Icon(Icons.airplay),
              title: Text('Surv.'),
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
              title: Text('Déplace.'),
              activeColor: Colors.redAccent,
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
