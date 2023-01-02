import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:jitd_client/src/screens/SignIn.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
