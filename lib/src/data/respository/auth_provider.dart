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
    return "create success";
  }
}
