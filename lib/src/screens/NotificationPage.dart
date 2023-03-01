import 'package:flutter/material.dart';
import '../constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  final items = List<String>.generate(10, (i) => 'Item ${i + 1}');

  List<String> _values = ['แจ้งเตือน', 'ผู้ใช้งาน1234xx',
    'ผู้ใช้งาน1234xx', 'ผู้ใช้งาน1234xx', 'ผู้ใช้งาน1234xx'];


  @override
  Widget build(BuildContext context) {
    //const title = 'Dismissing Items';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          //Background on top
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height,
                color: Colors.white,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      //Widget Box and Text
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: primaryColor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).devicePixelRatio * 8,
                              left:
                              MediaQuery.of(context).devicePixelRatio * 10),
                          child: const Text(
                            "การแจ้งเตือน",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ), //Category btn
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "วันนี้",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ล้างค่า",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _values.length,
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key('item ${_values[index]}'),
                        background: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)
                                )
                            ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.favorite, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        secondaryBackground: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.delete, color: Colors.white),
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
                                content: const Text(
                                    "Are you sure you want to delete this item?"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text("Delete")),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
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
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: const BoxDecoration(
                              color: backgroundColor2,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: Offset(0, 4),
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              //SizedBox(width: MediaQuery.of(context).size.width * 10,),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                              Text(_values[index]),
                              SizedBox(height: 5,),
                              Text("ผมคิดว่าทำแบบนั้นดีแล้วครับ สุดยอดมากเลยครับ")
                            ],
                          ),
                        )

                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "สัปดาห์ที่แล้ว",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
