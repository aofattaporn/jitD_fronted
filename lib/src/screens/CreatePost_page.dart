import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePost_page extends StatelessWidget {
  const CreatePost_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: MaterialButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => const CreatePost_page()));
          }, child: Icon(Icons.arrow_back),),
        ),
        body: Center(
          child: Container(
            child: Text("Create post page"),
          ),
        ));
  }
}
