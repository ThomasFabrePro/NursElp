import 'package:NursElp/screens/guests/auth.dart';
import 'package:NursElp/services/SurveillanceService.dart';
import 'package:NursElp/screens/surveillances/SurveillancePage.dart';
import 'package:flutter/material.dart';

class SurveillancesManagementPage extends StatefulWidget {
  const SurveillancesManagementPage({
    Key key,
  }) : super(key: key);
  @override
  _SurveillancesManagementPageState createState() =>
      _SurveillancesManagementPageState();
}

class _SurveillancesManagementPageState
    extends State<SurveillancesManagementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Surveillances',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
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
              GetSurveillances(groupId: '7AbGe6aQJIOYSsq3QYEZ'),
              Positioned(
                //Bouton ajouter
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuthPage()),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.red[300]],
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        'assets/images/add_icon.png',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}