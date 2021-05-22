import 'package:NursElp/screens/GroupMenu.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  ScrollController scrollController;
  bool termsRead = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          termsRead = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Termes et conditions'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                      " Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp Termes et conditions obligatoires avant l'utilisation de l'application de NursElp"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: ElevatedButton(
                onPressed: !termsRead
                    ? null
                    : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GroupMenu(),
                          ),
                        ),
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
    );
  }
}
