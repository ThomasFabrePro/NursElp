import 'package:NursElp/widgets.dart';
import 'package:flutter/material.dart';

class GroupCreationPage extends StatefulWidget {
  @override
  _GroupCreationPageState createState() => _GroupCreationPageState();
}

class _GroupCreationPageState extends State<GroupCreationPage> {
  @override
  Widget build(BuildContext context) {
    int numberMember;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Groupe',
              style: TextStyle(
                fontSize: 20,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Rejoindre un groupe',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        hintText: 'Nom du groupe',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        hintText: 'Code du groupe',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.contact_support, color: Colors.white),
                          Text(
                            'Se trouve dans les options du groupe',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                        hintText: 'Mot de passe du groupe',
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          //TODO envoie un mail au proprio pour avoir un nouveau mot de passe
                        },
                        child: Text(
                          'Mot de passe oublié ?',
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => {setState(() {})},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text(
                          'Rejoindre ce groupe',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  // width: double.infinity,
                  // height: 200,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[400],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Nouveau groupe',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        hintText: 'Nom du groupe',
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hintText: 'Mot de passe',
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hintText: 'Confirmation mot de passe',
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        hintText: 'Adresse mail du propriétaire',
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Nombre de membre',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 120,
                              height: 40,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: TextField(
                                // controller: TextEditingController(
                                //   text: '$displayNumberMember',
                                // ),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey[200],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: '4',
                                  contentPadding: EdgeInsets.only(
                                    top: 0,
                                    bottom: 10,
                                  ),
                                ),

                                onSubmitted: (value) {
                                  setState(() {
                                    numberMember = int.parse(value);
                                    print(numberMember);
                                    print(value.runtimeType);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.contact_support, color: Colors.white),
                          Expanded(
                            child: Text(
                              'Note: Ce paramètre pourra être modifié dans les options du groupe',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => {setState(() {})},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text(
                          'Créer mon groupe',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 20,
                          ),
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

class MyTextField extends StatefulWidget {
  final String hintText;

  const MyTextField({Key key, this.hintText}) : super(key: key);
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[200],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
