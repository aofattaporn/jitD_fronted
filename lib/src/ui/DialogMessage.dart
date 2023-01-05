import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  color: statusColorError))),
      content: SingleChildScrollView(
        child: Center(
            child: Text(desc, style: const TextStyle(color: textColor1))),
      ),
      actions: <Widget>[
        TextButton(
          child: const Center(
              child: Text('ลองใหม่อีกครั้ง',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16))),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
