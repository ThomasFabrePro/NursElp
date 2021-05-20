import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Termes et conditions'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                    'termes et conditions de NursElptermes et conditions de NursElptermes et conditions de NursElptermes et conditions de NursElp'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () => print('accepté'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    elevation: 2,
                    shadowColor: Colors.redAccent,
                  ),
                  child: Text(
                    'lu et approuvé'.toUpperCase(),
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
