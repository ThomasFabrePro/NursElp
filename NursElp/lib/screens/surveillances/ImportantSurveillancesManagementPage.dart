import 'package:NursElp/screens/guests/auth.dart';
import 'package:NursElp/screens/surveillances/ImportantSurveillancesPage.dart';
import 'package:NursElp/services/SurveillanceService.dart';
import 'package:flutter/material.dart';

class ImportantSurveillancesManagementPage extends StatefulWidget {
  final String groupId;
  const ImportantSurveillancesManagementPage({
    Key key,
    this.groupId,
  }) : super(key: key);
  @override
  _ImportantSurveillancesManagementPageState createState() =>
      _ImportantSurveillancesManagementPageState();
}

class _ImportantSurveillancesManagementPageState
    extends State<ImportantSurveillancesManagementPage> {
  String groupId = '';
  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Surveillances Importantes',
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
              GetImportantSurveillances(groupId: groupId),
              Positioned(
                //Bouton ajouter
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportantSurveillancePage()),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.deepOrange[400]],
                        begin: Alignment(1, 0),
                        end: Alignment(-1, 0),
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
