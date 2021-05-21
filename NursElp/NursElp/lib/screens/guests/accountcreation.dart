import 'package:flutter/material.dart';

class AccountCreationPage extends StatefulWidget {
  @override
  _AccountCreationPageState createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  String mail = '';
  String mailCheck = ' ';
  String password = '';
  String passwordCheck = ' ';
  bool confirm = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nouveau Compte'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Adresse mail'),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    onFieldSubmitted: (value) => mail = value,
                    decoration: InputDecoration(
                      hintText: 'Ex: votre.mail@domaine.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Confirmez votre mail'),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    onFieldSubmitted: (value) => mailCheck = value,
                    decoration: InputDecoration(
                      hintText: 'Ex: votre.mail@domaine.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Mot de passe'),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    onFieldSubmitted: (value) => password = value,
                    decoration: InputDecoration(
                      hintText: 'Votre mot de passe',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Confirmez votre mot de passe'),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    onFieldSubmitted: (value) => passwordCheck = value,
                    decoration: InputDecoration(
                      hintText: 'Confirmation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      elevation: 2,
                      shadowColor: Colors.redAccent,
                    ),
                    child: Text(
                      'continuer'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
