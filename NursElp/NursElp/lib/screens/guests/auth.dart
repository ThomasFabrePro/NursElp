import 'package:NursElp/screens/guests/terms.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .stretch, //Permet à la colonne de prendre toute la place dispo
                          children: [
                            Text('Entrez votre email'),
                            SizedBox(height: 10),
                            TextFormField(
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
                              obscureText: true,
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
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermsPage(),
                                ),
                              ),
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
