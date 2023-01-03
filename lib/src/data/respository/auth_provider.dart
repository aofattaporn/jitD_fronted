import 'package:firebase_auth/firebase_auth.dart';

import '../models/auth_model.dart';

class AuthRepository {
  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    checkCredentail();
    return "create success";
  }
  Future<void> checkCredentail() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        print(FirebaseAuth.instance.currentUser?.uid.toString());
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
