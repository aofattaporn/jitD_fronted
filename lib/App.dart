import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:jitd_client/src/screens/autheentication/SignIn.dart';
import 'package:jitd_client/src/screens/autheentication/SignUptemp.dart';
import 'package:jitd_client/src/screens/autheentication/SignUp.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpCustom(),
      // home:
    );
  }
}
