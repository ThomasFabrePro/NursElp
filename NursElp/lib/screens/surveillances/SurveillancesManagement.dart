import 'package:NursElp/services/BedroomService.dart';
import 'package:NursElp/services/SurveillanceService.dart';
import 'package:flutter/material.dart';

class SurveillancesManagementPage extends StatefulWidget {
  final String groupId;
  final String bedroomId;
  final int bedroomNumber;
  const SurveillancesManagementPage({
    Key key,
    this.groupId,
    this.bedroomId,
    this.bedroomNumber,
  }) : super(key: key);
  @override
  _SurveillancesManagementPageState createState() =>
      _SurveillancesManagementPageState();
}

class _SurveillancesManagementPageState
    extends State<SurveillancesManagementPage> {
  String groupId = '';
  String bedroomId = '';
  int bedroomNumber = 0;
  BedroomService bedroomService = BedroomService();
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
    bedroomId = widget.bedroomId;
    bedroomNumber = widget.bedroomNumber;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Surveillances $bedroomNumber',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.deepOrange[400]],
                begin: Alignment(1, 0),
                end: Alignment(-1, 0),
              ),
            ),
          ),
          centerTitle: true,
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
                          'Vous devez fournir un numéro de chambre valide'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              );
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10,
          ),
          color: Colors.grey[100],
          child: Stack(
            children: [
              GetBedroomSurveillances(
                groupId: groupId,
                bedroomId: bedroomId,
                bedroomNumber: bedroomNumber,
              ), //transformer en GetBedroomSurveillances car page propre à la chambre
              SurveillanceAddButton(
                bedroomId: bedroomId,
                groupId: groupId,
                bedroomNumber: bedroomNumber,
              )
              // Positioned(
              //   //Bouton ajouter
              //   bottom: 24.0,
              //   right: 24.0,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => SurveillancePage()),
              //       );
              //     },
              //     child: Container(
              //       width: 60.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [Colors.redAccent, Colors.red[300]],
              //           begin: Alignment(0.0, -1.0),
              //           end: Alignment(0.0, 1.0),
              //         ),
              //         borderRadius: BorderRadius.circular(45.0),
              //       ),
              //       child: Image(
              //         image: AssetImage(
              //           'assets/images/add_icon.png',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
