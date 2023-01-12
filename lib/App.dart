import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jitd_client/src/screens/CreatePost_page.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage2.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage3.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage4.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';
import 'package:jitd_client/src/screens/HomePage.dart';
import 'package:jitd_client/src/screens/autheentication/SignIn.dart';
import 'package:jitd_client/src/screens/autheentication/SignUp.dart';
import 'package:localstorage/localstorage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = LocalStorage('jitD_storage');

    final uid = storage.getItem("uid");
    if (uid != null) {
      return MaterialApp(home: Scaffold(body: Center(child: Text(uid.toString()))));
    } else {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUp(),
        // home:
      );
    }
  }
}
