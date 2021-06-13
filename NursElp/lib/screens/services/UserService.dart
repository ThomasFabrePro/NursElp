import 'package:NursElp/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<UserModel> createAccount(UserModel userModel) async {
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } catch (e) {
      print('email déjà existant');
    }
    userModel.setUid = userCredential.user.uid;
    return userModel;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> checkMail(String email, String password, String nickname) async {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        addUser(email, password, nickname);
      } else {
        print('le mail existe deja');
      }
    });
  }

  void addUser(String email, String password, String nickname) {
    String newId = UniqueKey().toString();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    users
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        return users.doc(newId).set({
          'id': newId,
          'email': email,
          'password': password,
          'nickname': nickname,
        }).then((value) => print("User Added"));
      } else
        print("ca n'a pas marché");
    });
  }
}
