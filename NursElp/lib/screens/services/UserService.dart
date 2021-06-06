import 'package:NursElp/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential userCredential;

  Stream<UserModel> get user {
    //Vérifier User deja authentifié
    return _auth
        .authStateChanges()
        .asyncMap((user) => UserModel(uid: user.uid, email: user.email));
  }

  Future<UserModel> auth(UserModel userModel) async {
    print(userModel.toJson());
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } catch (e) {
      print('pas de mail correspondant');
    }
    userModel.setUid = userCredential.user.uid;
    return userModel;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
