import 'package:flutter/material.dart';

class UpdatePost extends StatefulWidget {
  const UpdatePost({Key? key}) : super(key: key);

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  TextEditingController? textController;
  final _unFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
