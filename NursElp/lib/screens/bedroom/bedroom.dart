import 'package:NursElp/screens/services/BedroomService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BedroomPage extends StatefulWidget {
  final String groupId;
  final String bedroomId;
  final String notes;
  final String doctor;
  final String arriving;
  final String leaving;
  final String side;
  final String bedroomNumber;

  final bool isPresent;
  final bool sexe;
  final bool contagious;

  final List surveillances;
  final List bedroomTasks;
  final List moves;

  final int sector;

  const BedroomPage(
      {Key key,
      this.bedroomId,
      this.groupId,
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
      this.sector})
      : super(key: key);
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  final double labelFontSize = 18.0;
  int date = DateTime.now().day;
  BedroomService bedroomService = BedroomService();
  String bedroomNumber = '';
  String bedroomId = '';
  String side = ''; //TODO ajouter pour savoir si porte, fenetre, seul
  String doctor = '';
  String notes = '';
  String groupId = '';
  String arriving = '';
  String leaving = '';

  bool isMale = false;
  bool isContagious = true;
  bool isPresent = false;

  List surveillances;
  List bedroomTasks;
  List moves;

  int sector = 1;

  @override
  void initState() {
    bedroomId = widget.bedroomId;
    side = widget.side;
    notes = widget.notes;
    doctor = widget.doctor;
    groupId = widget.groupId;
    arriving = widget.arriving;
    leaving = widget.leaving;
    isMale = widget.sexe;
    isContagious = widget.contagious;
    isPresent = widget.isPresent;
    surveillances = widget.surveillances;
    bedroomTasks = widget.bedroomTasks;
    moves = widget.moves;
    bedroomNumber = widget.bedroomNumber;

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chambre $bedroomNumber"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete_outline_rounded, size: 35),
                onPressed: () {
                  bedroomService.deleteBedroom(bedroomId);
                  Navigator.pop(context);
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      //Chambre
                      padding: EdgeInsets.only(
                        top: 12,
                        left: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Chambre',
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                  text: bedroomNumber,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                onSubmitted: (value) => setState(() {
                                  bedroomNumber = value;
                                  bedroomService.updateBedroom(bedroomId,
                                      bedroomNumber, 'bedroomNumber');
                                }),
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                'Présent ?',
                                style: TextStyle(
                                  fontSize: labelFontSize,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPresent = !isPresent;
                                bedroomService.updateBedroom(
                                    bedroomId, isPresent, 'isPresent');
                              });
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              margin: EdgeInsets.only(
                                //left: 10.0,
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                color: isPresent == true
                                    ? Colors.lightGreenAccent[400]
                                    : Colors.redAccent[400],
                                borderRadius: BorderRadius.circular(45.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      //Sexe
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Sexe',
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!isMale) {
                                  isMale = true;
                                  bedroomService.updateBedroom(
                                      bedroomId, isMale, 'sexe');
                                }
                              });
                            },
                            child: Container(
                              //CheckBox
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(
                                left: 40.0,
                              ),
                              decoration: BoxDecoration(
                                color: isMale
                                    ? Colors.red[600]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: isMale
                                    ? null
                                    : Border.all(
                                        color: Colors.grey,
                                        width: 1.5,
                                      ),
                              ),
                              child: isMale
                                  ? Image(
                                      image: AssetImage(
                                        'assets/images/check_icon.png',
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                'Homme',
                                style: TextStyle(
                                  color: isMale ? Colors.red[600] : Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: isMale
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (isMale) {
                                    isMale = !isMale;
                                    bedroomService.updateBedroom(
                                        bedroomId, isMale, 'sexe');
                                  }
                                },
                              );
                            },
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(
                                left: 40.0,
                              ),
                              decoration: BoxDecoration(
                                color: !isMale
                                    ? Colors.red[600]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: !isMale
                                    ? null
                                    : Border.all(
                                        color: Colors.grey,
                                        width: 1.5,
                                      ),
                              ),
                              child: !isMale
                                  ? Image(
                                      image: AssetImage(
                                        'assets/images/check_icon.png',
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                'Femme',
                                style: TextStyle(
                                  color:
                                      !isMale ? Colors.red[600] : Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: !isMale
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        //Contagieux
                        padding: EdgeInsets.only(
                          top: 15,
                          left: 24,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Contagieux',
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!isContagious) {
                                    isContagious = true;
                                    bedroomService.updateBedroom(
                                        bedroomId, isContagious, 'contagious');
                                  }
                                });
                              },
                              child: Container(
                                //CheckBox
                                width: 20.0,
                                height: 20.0,
                                margin: EdgeInsets.only(
                                  left: 40.0,
                                ),
                                decoration: BoxDecoration(
                                  color: isContagious
                                      ? Colors.red[600]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: isContagious
                                      ? null
                                      : Border.all(
                                          color: Colors.grey,
                                          width: 1.5,
                                        ),
                                ),
                                child: isContagious
                                    ? Image(
                                        image: AssetImage(
                                          'assets/images/check_icon.png',
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Text(
                                  'Oui',
                                  style: TextStyle(
                                    color: isContagious
                                        ? Colors.red[600]
                                        : Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: isContagious
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    if (isContagious) {
                                      isContagious = !isContagious;
                                      bedroomService.updateBedroom(bedroomId,
                                          isContagious, 'contagious');
                                    }
                                  },
                                );
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                margin: EdgeInsets.only(
                                  left: 40.0,
                                ),
                                decoration: BoxDecoration(
                                  color: !isContagious
                                      ? Colors.red[600]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: !isContagious
                                      ? null
                                      : Border.all(
                                          color: Colors.grey,
                                          width: 1.5,
                                        ),
                                ),
                                child: !isContagious
                                    ? Image(
                                        image: AssetImage(
                                          'assets/images/check_icon.png',
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Text(
                                  'Non',
                                  style: TextStyle(
                                    color: !isContagious
                                        ? Colors.red[600]
                                        : Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: !isContagious
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      //Médecin
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        children: [
                          Text("Date d'entrée"),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                  text: arriving != ''
                                      ? arriving
                                      : date.toString(),
                                ),
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                onSubmitted: (value) => setState(() {
                                  arriving = value.toString();
                                  bedroomService.updateBedroom(
                                      bedroomId, arriving, 'arriving');
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '20/01',
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
                        ],
                      ),
                    ),
                    Padding(
                      //Médecin
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        children: [
                          Text("Sortie prévue"),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                  text: leaving,
                                ),
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                onSubmitted: (value) => setState(() {
                                  leaving = value.toString();
                                  bedroomService.updateBedroom(
                                      bedroomId, leaving, 'leaving');
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '08/03',
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
                        ],
                      ),
                    ),
                    Padding(
                      //Médecin
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        children: [
                          Text('Médecin'),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                controller: TextEditingController(
                                  text: doctor,
                                ),
                                keyboardType: TextInputType.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                onSubmitted: (value) => setState(() {
                                  doctor = value;
                                  bedroomService.updateBedroom(
                                      bedroomId, doctor, 'doctor');
                                }),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Nom',
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        height: 15,
                        thickness: 3,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notes',
                            style: TextStyle(fontSize: labelFontSize),
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            child: TextField(
                              controller: TextEditingController(
                                text: notes,
                              ),
                              onSubmitted: (value) => (setState(
                                () {
                                  notes = value;
                                  bedroomService.updateBedroom(
                                      bedroomId, notes, 'notes');
                                },
                              )),
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.yellow[100],
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.redAccent)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
