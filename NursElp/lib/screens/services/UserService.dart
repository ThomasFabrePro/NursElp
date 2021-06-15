import 'package:NursElp/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  String getUserId() {
    return _auth.currentUser.uid;
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
      addUser(
        userModel.email,
        userModel.password,
        userModel.nickname,
        userCredential.user.uid,
      );
    } catch (e) {
      print('email already exist');
    }
    userModel.setUid = userCredential.user.uid;
    return userModel;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  void addUser(String email, String password, String nickname, String uid) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    users
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        users.doc(uid).set({
          'id': uid,
          'email': email,
          'password': password,
          'nickname': nickname,
        }).then((value) => print("User Added"));
      } else
        print("Error adding user");
    });
  }
}
