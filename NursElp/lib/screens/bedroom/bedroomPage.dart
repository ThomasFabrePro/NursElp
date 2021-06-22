import 'package:NursElp/models/BedroomModel.dart';
import 'package:NursElp/services/BedroomService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BedroomPage extends StatefulWidget {
  final Bedroom bedroom;
  final Function(int) onBedroomNumberChanged;
  final int bedroomNumber;

  const BedroomPage({
    Key key,
    this.bedroom,
    this.onBedroomNumberChanged,
    this.bedroomNumber,
  }) : super(key: key);
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  final double labelFontSize = 18.0;
  Function(int) onBedroomNumberChanged;

  int date = DateTime.now().day;
  BedroomService bedroomService = BedroomService();
  Bedroom bedroom;

  int bedroomNumber = 0;
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

  bool checkBedroom;
  bool checkBedroom2;

  List surveillances;
  List bedroomTasks;
  List moves;

  int sector = 1;
  int number = 0;

  @override
  void initState() {
    onBedroomNumberChanged = widget.onBedroomNumberChanged;

    bedroom = widget.bedroom;
    bedroomId = widget.bedroom.bedroomId;
    side = widget.bedroom.side;
    notes = widget.bedroom.notes;
    doctor = widget.bedroom.doctor;
    groupId = widget.bedroom.groupId;
    arriving = widget.bedroom.arriving;
    leaving = widget.bedroom.leaving;
    isMale = widget.bedroom.sexe;
    isContagious = widget.bedroom.contagious;
    isPresent = widget.bedroom.isPresent;
    surveillances = widget.bedroom.surveillances;
    bedroomTasks = widget.bedroom.bedroomTasks;
    moves = widget.bedroom.moves;
    bedroomNumber = widget.bedroomNumber;

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chambre $bedroomNumber"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.deepOrange[400]],
                begin: Alignment(1, 0),
                end: Alignment(-1, 0),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete_outline_rounded, size: 35),
                onPressed: () {
                  bedroomService.deleteBedroom(bedroomId);
                  Navigator.pop(context);
                })
          ],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  if (bedroomNumber != 0) {
                    Navigator.pop(context);
                  } else {
                    final snackBar = SnackBar(
                      content: Text(
                        'Vous devez fournir un numéro de chambre valide',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            },
          ),
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
                        top: 25,
                        left: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Numéro',
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 8,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: TextEditingController(
                                    text: bedroomNumber.toString(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  enableSuggestions: false,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  onSubmitted: (value) async {
                                    number = int.parse(value);

                                    checkBedroom =
                                        await bedroomService.checkBedroomNumber(
                                            number, groupId, bedroomId);
                                    if (checkBedroom &&
                                        value != '' &&
                                        value != bedroomNumber.toString()) {
                                      setState(() {
                                        bedroomNumber = number;
                                        bedroomService.updateBedroom(
                                            bedroomId, number, 'bedroomNumber');
                                        onBedroomNumberChanged(number);
                                      });
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text(
                                          'Ce numéro de chambre existe déjà !',
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
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
                                    : Colors.redAccent,
                                borderRadius: BorderRadius.circular(45.0),
                                border: Border.all(
                                  color: Colors.black45,
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
                        top: 25,
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
                          top: 25,
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
                        top: 25,
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
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 8,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: TextEditingController(
                                    text: arriving,
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                  onSubmitted: (value) {
                                    if (value != arriving) {
                                      arriving = value.toString();
                                      bedroomService.updateBedroom(
                                          bedroomId, arriving, 'arriving');
                                    }
                                  },
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      //Médecin
                      padding: EdgeInsets.only(
                        top: 25,
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
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 7,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
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
                                  onSubmitted: (value) {
                                    if (value != leaving) {
                                      leaving = value.toString();
                                      bedroomService.updateBedroom(
                                          bedroomId, leaving, 'leaving');
                                    }
                                  },
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      //Médecin
                      padding: EdgeInsets.only(
                        top: 25,
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
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
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
                              style: TextStyle(
                                fontSize: 18,
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
