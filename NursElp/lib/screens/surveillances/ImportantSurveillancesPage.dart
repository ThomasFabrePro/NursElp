import 'package:NursElp/models/SurveillancesModel.dart';
import 'package:NursElp/services/SurveillanceService.dart';
import 'package:flutter/material.dart';

class ImportantSurveillancePage extends StatefulWidget {
  const ImportantSurveillancePage();

  @override
  _ImportantSurveillancePageState createState() =>
      _ImportantSurveillancePageState();
}

class _ImportantSurveillancePageState extends State<ImportantSurveillancePage> {
  bool important = true;
  String title = '';
  SurveillanceService surveillanceService = SurveillanceService();
  String surveillanceId = '';
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(title == '' ? 'Nouvelle surveillance' : 'Surveillance '),
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
                surveillanceService.deleteSurveillance(surveillanceId);
                Navigator.pop(context);
              })
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                if (title != '' && title != null) {
                  Navigator.pop(context);
                } else {
                  final snackBar = SnackBar(
                    content: Text(
                      'Vous devez préciser un titre',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(18),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: TextEditingController(text: title),
                    style: TextStyle(fontSize: 24),
                    onSubmitted: (value) {
                      if (value != '' && value != null && value != title) {
                        title = value;
                        surveillanceService.updateSurveillance(
                            surveillanceId, 'title', title);
                      } else
                        setState(() {});
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Titre',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'Important ?',
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!important) {
                              important = true;
                              surveillanceService.updateSurveillance(
                                  surveillanceId, 'important', important);
                            }
                          });
                        },
                        child: Container(
                          //CheckBox
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.only(
                            left: 60.0,
                          ),
                          decoration: BoxDecoration(
                            color: important
                                ? Colors.red[600]
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.0),
                            border: important
                                ? null
                                : Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                          ),
                          child: important
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
                              color: important ? Colors.red[600] : Colors.grey,
                              fontSize: 16.0,
                              fontWeight:
                                  important ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (important) {
                                important = !important;
                                surveillanceService.updateSurveillance(
                                    surveillanceId, 'important', important);
                              }
                            },
                          );
                        },
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          margin: EdgeInsets.only(
                            left: 50.0,
                          ),
                          decoration: BoxDecoration(
                            color: !important
                                ? Colors.red[600]
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.0),
                            border: !important
                                ? null
                                : Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                          ),
                          child: !important
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
                              color: !important ? Colors.red[600] : Colors.grey,
                              fontSize: 16.0,
                              fontWeight: !important
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text('Description'),
                  TextField(
                    controller: TextEditingController(
                      text: '',
                    ),
                    maxLines: null,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      enabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      hintText: 'Entrez une description',
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
