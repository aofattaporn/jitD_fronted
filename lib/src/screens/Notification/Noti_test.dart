import 'package:flutter/material.dart';

void main() {
  runApp( Noti_test());
}

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
// class Noti_test extends StatefulWidget {
//   const Noti_test({Key? key}) : super(key: key);
//
//   @override
//   Noti_testState createState() {
//     return Noti_testState();
//   }
// }

class Noti_test extends StatefulWidget {
  @override
  Noti_testState createState() => Noti_testState();
}

class Noti_testState extends State<Noti_test> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  final List<String> _values = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.separated(
              itemCount: _values.length,
              padding: const EdgeInsets.all(5.0),
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key('item ${_values[index]}'),
                  background: Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.favorite, color: Colors.white),
                          Text('Move to favorites', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.delete, color: Colors.white),
                          Text('Move to trash', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Delete Confirmation"),
                          content: const Text("Are you sure you want to delete this item?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text("Delete")
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      print("Add to favorite");
                    } else {
                      print('Remove item');
                    }

                    setState(() {
                      _values.removeAt(index);
                    });
                  },
                  child: ListTile(
                    leading: Icon(Icons.local_activity, size: 50),
                    title: Text(_values[index]),
                    subtitle: Text('Description here'),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}