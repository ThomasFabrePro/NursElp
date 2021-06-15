import 'package:NursElp/screens/services/BedroomService.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BedroomPage extends StatefulWidget {
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  String bedroomNumber = '';
  final double labelFontSize = 18.0;
  String side = ''; //savoir si porte, fenetre, seul
  String doctor = '';
  String notes = '';
  bool isMale = false;
  bool isContagious = true;
  bool isPresent = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chambre $bedroomNumber"),
          centerTitle: true,
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
                                onChanged: (value) =>
                                    setState(() => bedroomNumber = value),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
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
                                    top: 0,
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
                                if (isPresent) {
                                  isPresent = false;
                                } else
                                  isPresent = true;
                              });
                              print(isPresent);
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              margin: EdgeInsets.only(
                                //left: 10.0,
                                right: 20,
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
                            'sexe',
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (!isMale) {
                                  isMale = true;
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
                                  }
                                  print(isContagious);
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
                                    }
                                    print(isContagious);
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
                        //Entree
                        padding: EdgeInsets.only(
                          top: 15,
                          left: 24,
                          right: 24,
                        ),
                        child: LabelAndTextField(
                          labelText: "Date d'entrée",
                          textFieldHint: '20/05',
                          keyboardInputType: TextInputType.datetime,
                        )),
                    Padding(
                      //Sortie
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                        right: 24,
                      ),
                      child: LabelAndTextField(
                        labelText: 'Sortie prévue',
                        textFieldHint: '21/05',
                        keyboardInputType: TextInputType.datetime,
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
                                keyboardType: TextInputType.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                onSubmitted: (value) => setState(() {
                                  doctor = value;
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
                            child: TextField(
                              onSubmitted: (value) => (setState(
                                () {
                                  notes = value;
                                  print(notes);
                                },
                              )),
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.yellow[100],
                              ),
                            ),
                          ),
                          AddBedroom(1, isPresent, bedroomNumber, isMale,
                              isContagious, doctor, null, null, null, notes, 1)
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
