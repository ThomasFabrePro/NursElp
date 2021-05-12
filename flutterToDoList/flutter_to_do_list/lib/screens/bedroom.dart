import 'package:flutter/material.dart';
//import 'package:flutter_to_do_list/database_helper.dart';

class BedroomPage extends StatefulWidget {
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  int bedroomNumber = 210;
  String side = ''; //savoir si porte, fenetre, seul

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[100],
          width: double.infinity,
          // padding: EdgeInsets.symmetric(
          //   horizontal: 1.0,
          // ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0.0,
                    ),
                    child: Container(
                      color: Colors.red[300],
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(
                                  context); //fait retourner à la page précédente
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/arrow_back_white_icon.png',
                                width: 30,
                              ),
                            ),
                          ),
                          Padding(
                            //Header
                            padding: EdgeInsets.only(
                              left: 80.0,
                            ),
                            child: Text(
                              'Chambre 202',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Chambre',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 90.0,
                              height: 40.0,
                              margin: EdgeInsets.only(
                                left: 10.0,
                              ),
                              // decoration: BoxDecoration(
                              //   color: Colors.green[900],
                              //   borderRadius: BorderRadius.circular(280),
                              // ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '$bedroomNumber',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[100],
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
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
