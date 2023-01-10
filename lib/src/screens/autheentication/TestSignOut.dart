import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestSignOut extends StatelessWidget {
  const TestSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {  },
        child: Text("Sign Out"),
      ),
    );
  }
}
