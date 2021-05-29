import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BedroomPage extends StatefulWidget {
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  String bedroomNumber = '210';
  final double labelFontSize = 18.0;
  String side = ''; //savoir si porte, fenetre, seul
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
                          Expanded(
                            child: LabelAndTextField(
                              labelText: 'Chambre',
                              textFieldHint: '200',
                              keyboardInputType: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 70.0,
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
                              if (isPresent) {
                                isPresent = false;
                              } else
                                isPresent = true;

                              setState(() {});
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
                      child: DoubleCheckBox(
                        label: 'Sexe',
                        labelOption1: 'femme',
                        labelOption2: 'homme',
                        valueToSwitch: isMale,
                      ),
                    ),
                    Padding(
                      //Contagieux
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                      ),
                      child: DoubleCheckBox(
                        label: 'Contagieux',
                        labelOption1: 'oui',
                        labelOption2: 'non',
                        valueToSwitch: isContagious,
                      ),
                    ),
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
                        child: LabelAndTextField(
                          labelText: 'Médecin',
                          textFieldHint: 'Nom du médecin',
                        )),
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
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.yellow[100],
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     color: Colors.red,
                                //     width: 5,
                                //   ),
                                // ),
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
