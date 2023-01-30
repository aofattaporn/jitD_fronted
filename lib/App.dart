import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jitd_client/src/screens/HomePage.dart';
import 'package:jitd_client/src/screens/ProfilePage.dart';
import 'package:jitd_client/src/screens/autheentication/SignIn.dart';

import 'package:jitd_client/src/screens/autheentication/SignUp.dart';
import 'package:jitd_client/src/screens/post/ViewAllPost.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  String checkCurentUser() {
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser);
      return "/home";
    } else {
      return "/";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: checkCurentUser(),
      routes: {
        "/": (context) => const SignIn(),
        "/home": (context) => const BottomNavigationWidget()
      }, // home:
    );
  }
}
