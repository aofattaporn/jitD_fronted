import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message.toString();
    }

    return "creating data success";
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
