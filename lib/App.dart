import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage2.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage3.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage4.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TutorialPage1(),
      // home:
    );
  }
}
