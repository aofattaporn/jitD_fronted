import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant_url.dart';

class AuthRepository {
  /// signUp
  Future<String?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      print(token);
      final response =
          await http.post(Uri.parse("${globalUrl}v1/users/"), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.request);
      if (response.statusCode == 201) {
        return "creating data success";
      } else {
        await FirebaseAuth.instance.currentUser?.delete();
        return "Something wrong";
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message.toString();
    } catch (e) {
      await FirebaseAuth.instance.currentUser?.delete();
      return "Something wrong";
    }
    return "creating data success";
  }

  /// signIn
  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      print(token);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user.";
      }
    }
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response =
        await http.post(Uri.parse("${globalUrl}v1/users/signIn"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return "creating data success";
    } else {
      await FirebaseAuth.instance.currentUser?.delete();
      return "something wrong";
    }
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

  Future<String> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    final response = await http
        .post(Uri.parse("${globalUrl}v1/users/signIn/google"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return "sign in success";
    } else if (response.statusCode == 201) {
      return "create user success";
    } else {
      await FirebaseAuth.instance.currentUser?.delete();
      return "something wrong";
    }
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

  Future<String> getMyUser() async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    final response =
        await http.get(Uri.parse("${globalUrl}v1/users/id"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Something wrong";
    }
  }
}
