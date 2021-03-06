import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:flutter/material.dart';

class ArrivingPage extends StatefulWidget {
  final String bedroomId;

  const ArrivingPage({Key key, this.bedroomId}) : super(key: key);
  @override
  _ArrivingPageState createState() => _ArrivingPageState();
}

class _ArrivingPageState extends State<ArrivingPage> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  final double labelFontSize = 18;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Entrée',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    left: 24,
                  ),
                  child: Row(
                    children: [
                      Text('Chambre'),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '200',
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 24,
                  right: 24,
                ),
                child: Row(
                  children: [
                    Text(
                      "Date d'entrée",
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
                          controller:
                              TextEditingController() //préremplir le champ
                                ..text = '$day/$month',
                          onSubmitted: (value) {},
                          keyboardType: TextInputType.datetime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: labelFontSize,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            //hintText: '$day / $month',
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
