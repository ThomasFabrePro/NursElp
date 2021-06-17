import 'package:NursElp/models/UserModel.dart';
import 'package:NursElp/screens/dashboard/Home.dart';
import 'package:NursElp/screens/group/groupmenu.dart';
import 'package:NursElp/screens/services/UserService.dart';
import 'package:flutter/material.dart';

class AccountCreationPage extends StatefulWidget {
  @override
  _AccountCreationPageState createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  UserService userService = UserService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  String email = '';
  String emailCheck = ' ';
  String password = '';
  String passwordCheck = ' ';
  String nickname = '';
  bool test;
  bool isSecret = false;
  FocusNode emailCheckFocus;
  FocusNode passwordFocus;
  FocusNode passwordCheckFocus;
  FocusNode nicknameFocus;

  @override
  void initState() {
    nicknameFocus = FocusNode();
    emailCheckFocus = FocusNode();
    passwordFocus = FocusNode();
    passwordCheckFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nicknameFocus.dispose();
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
          padding: const EdgeInsets.only(right: 12.0, left: 12.0, top: 24),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.red[300]],
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Adresse mail',
                      style: TextStyle(color: Colors.white),
                    ),
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
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Ex: votre.mail@domaine.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Confirmez votre mail',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        focusNode: emailCheckFocus,
                        onChanged: (value) =>
                            setState(() => emailCheck = value),
                        validator: (value) =>
                            value.isEmpty || email != emailCheck
                                ? 'Les adresses mail sont différentes'
                                : null,
                        onFieldSubmitted: (value) =>
                            passwordFocus.requestFocus(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Confirmation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Mot de passe',
                      style: TextStyle(color: Colors.white),
                    ),
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
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() => isSecret = !isSecret);
                            },
                            child: Icon(
                              !isSecret
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          hintText: 'Votre mot de passe',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Confirmez votre mot de passe',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        focusNode: passwordCheckFocus,
                        onChanged: (value) =>
                            setState(() => passwordCheck = value),
                        validator: (value) => password == passwordCheck
                            ? null
                            : 'Les mots de passe sont différents',
                        onFieldSubmitted: (value) =>
                            nicknameFocus.requestFocus(),
                        obscureText: isSecret,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() => isSecret = !isSecret);
                            },
                            child: Icon(
                              !isSecret
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          hintText: 'Confirmation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Votre pseudo',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        focusNode: nicknameFocus,
                        onChanged: (value) => setState(() => nickname = value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'SupaNurse13',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                                nickname == ''
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  userService
                                      .createAccount(UserModel(
                                        email: email,
                                        password: password,
                                        nickname: nickname,
                                      ))
                                      .then((value) => {
                                            if (value.uid != null)
                                              {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen(),
                                                  ),
                                                ),
                                              }
                                          });
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text(
                          'continuer'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
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
      ),
    );
  }
}
