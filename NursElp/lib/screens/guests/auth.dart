import 'package:NursElp/models/UserModel.dart';
import 'package:NursElp/screens/dashboard/Home.dart';
import 'package:NursElp/screens/group/groupmenu.dart';
import 'package:flutter/material.dart';
import 'package:NursElp/screens/guests/AccountCreation.dart';

import 'package:NursElp/services/UserService.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  bool isSecret = true;
  String email = '';
  String password = '';
  FocusNode passwordFocus;
  UserService userService;

  @override
  void initState() {
    passwordFocus = FocusNode();
    userService = UserService();
    super.initState();
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 30,
                  ),
                  child:
                      Image(image: AssetImage('assets/images/logo_large.png')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Everyone has\n'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                          ),
                          children: [
                            TextSpan(
                              text: 'knowledge\n'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'to share'.toUpperCase(),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'It all starts here !',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .stretch, //Permet à la colonne de prendre toute la place dispo
                          children: [
                            Text('Entrez votre email'),
                            SizedBox(height: 10),
                            TextFormField(
                              onChanged: (value) =>
                                  setState(() => email = value),
                              validator: (value) =>
                                  value.isEmpty || !emailRegex.hasMatch(value)
                                      ? 'Entrez un email valide'
                                      : null,
                              onFieldSubmitted: (value) =>
                                  passwordFocus.requestFocus(),
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
                            SizedBox(height: 20),
                            Text('Et votre mot de passe'),
                            SizedBox(height: 10),
                            TextFormField(
                              focusNode: passwordFocus,
                              onChanged: (value) =>
                                  setState(() => password = value),
                              validator: (value) => value.length < 6
                                  ? '6 caractères minimum'
                                  : null,
                              obscureText: isSecret,
                              decoration: InputDecoration(
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
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AccountCreationPage(),
                                    ),
                                  );
                                },
                                child: Text('Pas encore de compte ?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    )),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: !emailRegex.hasMatch(email) ||
                                      password.length < 6
                                  ? null
                                  : () {
                                      if (formKey.currentState.validate()) {
                                        userService
                                            .auth(UserModel(
                                              email: email,
                                              password: password,
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
                              child: Text(
                                'continuer'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
