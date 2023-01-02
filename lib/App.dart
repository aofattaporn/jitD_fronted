import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/autheentication/SignIn.dart';
import 'package:jitd_client/src/screens/autheentication/SignUp.dart';
import 'package:jitd_client/src/screens/autheentication/SignUp_custom.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp_CT(),
    );
  }
}
