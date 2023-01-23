import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      // theme: ThemeData(
      //   pageTransitionsTheme: const PageTransitionsTheme(
      //       builders: {
      //         TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //         TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      //       }
      //   )
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: checkCurentUser(),
      routes: {
        "/": (context) => const SignUp(),
        "/home": (context) => const BottomNavigationWidget()
      }, // home:
    );
  }
}
