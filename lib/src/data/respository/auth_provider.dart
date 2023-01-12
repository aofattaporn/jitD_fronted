import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:jitd_client/src/data/models/auth_model.dart';
import 'package:jitd_client/src/data/models/createModel.dart';
import 'package:jitd_client/src/data/models/user_model.dart';
import 'package:localstorage/localstorage.dart';

class AuthRepository {
  final String _baseUrl = "http://localhost:3000/v1/users/";
  final String _grobalAPI = "https://jitd-backend.onrender.com/v1/users/";
  final LocalStorage storage = new LocalStorage('jitD_storage');

  /// signUp
  Future<String?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // check firebase
      final user = await FirebaseAuth.instance.currentUser;
      String? userID = await user?.uid;

      // request to backend
      final response = await http.post(Uri.parse(_grobalAPI),
          body: userModelToJson(UserModel(userID, "", 0)));
      createModelFromJson(response.body);
      if (response.statusCode == 201) {
        print("creating data success");
        // save to local storage
        storage.setItem("uid", userID);
        return userID.toString();
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message.toString();
    } catch (e) {
      return _deleteUserd();
    }
  }

  Future<String> _deleteUserd() async {
    await FirebaseAuth.instance.currentUser
        ?.delete()
        .then((value) => {print("Delete success")})
        .catchError((err) => {print("Delete Error")});
    return "Something wrong";
  }

  /// signIn
  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
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

  Future<void> signOut() async {
    // Once signed in, return the UserCredential
    await checkCredentail();

    await FirebaseAuth.instance.signOut();
  }
}
