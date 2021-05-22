import 'package:NursElp/screens/guests/auth.dart';
import 'package:flutter/material.dart';

class AccountCreationPage extends StatefulWidget {
  @override
  _AccountCreationPageState createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  String email = '';
  String emailCheck = ' ';
  String password = '';
  String passwordCheck = ' ';
  String pseudo = '';
  bool isSecret = false;
  FocusNode emailCheckFocus;
  FocusNode passwordFocus;
  FocusNode passwordCheckFocus;
  FocusNode pseudoFocus;

  @override
  void initState() {
    pseudoFocus = FocusNode();
    emailCheckFocus = FocusNode();
    passwordFocus = FocusNode();
    passwordCheckFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pseudoFocus.dispose();
    emailCheckFocus.dispose();
    passwordFocus.dispose();
    passwordCheckFocus.dispose();
    super.dispose();
  }

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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Adresse mail'),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() => email = value);
                      },
                      validator: (value) =>
                          value.isEmpty || !emailRegex.hasMatch(value)
                              ? 'Entrez un email valide'
                              : null,
                      onFieldSubmitted: (value) =>
                          emailCheckFocus.requestFocus(),
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
                      focusNode: emailCheckFocus,
                      onChanged: (value) => setState(() => emailCheck = value),
                      validator: (value) => value.isEmpty || email != emailCheck
                          ? 'Les adresses mail sont différentes'
                          : null,
                      onFieldSubmitted: (value) => passwordFocus.requestFocus(),
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
                  Text('Mot de passe'),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      focusNode: passwordFocus,
                      onChanged: (value) => setState(() => password = value),
                      validator: (value) =>
                          value.length < 6 ? '6 caractères minimum' : null,
                      onFieldSubmitted: (value) =>
                          passwordCheckFocus.requestFocus(),
                      obscureText: isSecret,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() => isSecret = !isSecret);
                          },
                          child: Icon(
                            !isSecret ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
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
                      focusNode: passwordCheckFocus,
                      onChanged: (value) =>
                          setState(() => passwordCheck = value),
                      validator: (value) => password == passwordCheck
                          ? null
                          : 'Les mots de passe sont différents',
                      onFieldSubmitted: (value) => pseudoFocus.requestFocus(),
                      obscureText: isSecret,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() => isSecret = !isSecret);
                          },
                          child: Icon(
                            !isSecret ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
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
                  Text('Votre pseudo'),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      focusNode: pseudoFocus,
                      onChanged: (value) => setState(() => pseudo = value),
                      decoration: InputDecoration(
                        hintText: 'SupaNurse13',
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
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: !(email == emailCheck) ||
                              !(password == passwordCheck) ||
                              pseudo == ''
                          ? null
                          : () {
                              if (formKey.currentState.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthPage(),
                                  ),
                                );
                              }
                            },
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
      ),
    );
  }
}
