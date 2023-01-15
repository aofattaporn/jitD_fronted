import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textfield Example'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter some text',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(_text),
          ),
        ],
      ),
    );
  }
}
