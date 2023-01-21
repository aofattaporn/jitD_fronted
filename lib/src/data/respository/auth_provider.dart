import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

import '../models/auth_model.dart';
import '../models/user_model.dart';

class AuthRepository {
  final String _createlocalUserUrl = "http://localhost:3000/v1/users/";
  final String _createUserUrl = "https://jitd-backend.onrender.com/v1/users";

  /// signUp
  Future<String?> signUp(String email, String password) async {

    print(email);
    print(password);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      UserModel userData = await UserModel(FirebaseAuth.instance.currentUser?.uid, "", 0);

      print(userData.userId);
      final response = await http.post(Uri.parse(_createlocalUserUrl), body: userModelToJson(userData));

      if (response.statusCode == 201) {
        return "creating data success";
      } else {
        print("somthing wrong");
        return "somthing wrong";
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message.toString();
    }  catch (e) {
      await FirebaseAuth.instance.currentUser?.delete();
      return "somthing wrong";
    }
    return "creating data success";
  }

  /// signIn
  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return "creating data success";
  }

  /// check credentail function
  Future<String> checkCredentail() async {
    String result = "";
    await FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        result = 'User is currently signed out!';
      } else {
        result = 'User is signed in!';
      }
    });
    return result;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await checkCredentail();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  /// signOut
  Future<void> signOut() async {
    // Once signed in, return the UserCredential
    await checkCredentail();

    await FirebaseAuth.instance.signOut();
  }
}
