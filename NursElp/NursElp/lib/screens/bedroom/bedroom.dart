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
    return Scaffold(
      appBar: AppBar(
        title: Text("Chambre $bedroomNumber"),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                            style: TextStyle(
                              fontSize: labelFontSize,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 90.0,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                onSubmitted: (value) {
                                  bedroomNumber = value;
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: labelFontSize,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '$bedroomNumber',
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 48.0,
                            ),
                            child: Text(
                              'Présent ?',
                              style: TextStyle(
                                fontSize: labelFontSize,
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
                            },
                            child: Container(
                              width: 25.0,
                              height: 25.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
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
                            'Sexe :',
                            style: TextStyle(
                              fontSize: labelFontSize,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!isMale) {
                                isMale = true;
                                setState(() {});
                              }
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
                                    ? Colors.red[900]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: isMale
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
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                'Homme',
                                style: TextStyle(
                                  color: isMale ? Colors.red[900] : Colors.grey,
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
                              if (isMale) {
                                isMale = false;
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(
                                left: 40.0,
                              ),
                              decoration: BoxDecoration(
                                color: !isMale
                                    ? Colors.red[900]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: !isMale
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
                                      !isMale ? Colors.red[900] : Colors.grey,
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
                            'Contagieux :',
                            style: TextStyle(
                              fontSize: labelFontSize,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!isContagious) {
                                isContagious = true;
                                setState(() {});
                              }
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
                                    ? Colors.red[900]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: isContagious
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
                                      ? Colors.red[900]
                                      : Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: isContagious
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (isContagious) {
                                isContagious = false;
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              margin: EdgeInsets.only(
                                left: 40.0,
                              ),
                              decoration: BoxDecoration(
                                color: !isContagious
                                    ? Colors.red[900]
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: !isContagious
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
                                      ? Colors.red[900]
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
                      ),
                    ),
                    Padding(
                      //Entree
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Date d'entrée :",
                            style: TextStyle(
                              fontSize: labelFontSize,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '20 Mai',
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
                      ),
                    ),
                    Padding(
                      //Sortie
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Sortie prévue :',
                            style: TextStyle(
                              fontSize: labelFontSize,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '25 Mai',
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
                          Text(
                            'Médecin :',
                            style: TextStyle(
                              fontSize: labelFontSize,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Hadajdj',
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
