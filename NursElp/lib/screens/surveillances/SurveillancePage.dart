import 'package:NursElp/models/SurveillancesModel.dart';
import 'package:flutter/material.dart';

class SurveillancePage extends StatefulWidget {
  final Surveillances surveillances;
  const SurveillancePage({@required this.surveillances});

  @override
  _SurveillancePageState createState() => _SurveillancePageState();
}

class _SurveillancePageState extends State<SurveillancePage> {
  String groupId = '';
  String surveillanceId = '';
  String bedroomId = '';
  String title = '';
  bool isDone = false;
  bool important = false;
  String notes = '';
  @override
  void initState() {
    if (widget.surveillances != null) {
      groupId = widget.surveillances.groupId;
      surveillanceId = widget.surveillances.surveillanceId;
      bedroomId = widget.surveillances.bedroomId;
      title = widget.surveillances.title;
      isDone = widget.surveillances.isDone;
      important = widget.surveillances.important;
      notes = widget.surveillances.notes;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Surveillances'),
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
                  Text(surveillanceId ?? 'raté'),
                  Text(bedroomId ?? 'raté'),
                  Text(title ?? 'raté'),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
