import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> auth() async {
    UserCredential userCredential = await _auth.signInAnonymously();

    print(userCredential.user);
  }
}
