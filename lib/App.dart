import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jitd_client/src/screens/CreatePost_page.dart';
import 'package:jitd_client/src/screens/post/BlockWords.dart';
import 'package:jitd_client/src/screens/post/ConsultantTest.dart';
import 'package:jitd_client/src/screens/post/MyApp.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage2.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage3.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage4.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';
import 'package:jitd_client/src/screens/HomePage.dart';
import 'package:jitd_client/src/screens/autheentication/SignIn.dart';
import 'package:jitd_client/src/screens/autheentication/SignUp.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyApp(),

      // home:
    );
  }
}
