import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: MaterialButton(onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => const CreatePostPage()));
          }, child: Icon(Icons.arrow_back),),
        ),
        body: Center(
          child: Container(
            child: Text("Create post page"),
          ),
        ));
  }
}
