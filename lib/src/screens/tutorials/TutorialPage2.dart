import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage2 extends StatefulWidget {
  const TutorialPage2({Key? key}) : super(key: key);

  @override
  State<TutorialPage2> createState() => _TutorialPage2State();
}

class _TutorialPage2State extends State<TutorialPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Hello world"),
      ),
    );
  }
}
