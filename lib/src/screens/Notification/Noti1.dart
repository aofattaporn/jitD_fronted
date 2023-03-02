import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({Key? key}) : super(key: key);

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: ((context) {
                //do some thing
              }),
              backgroundColor: Colors.green,
              icon: Icons.phone,
            ),
            SlidableAction(
              flex: 2,
              onPressed: ((context) {}),
              backgroundColor: Colors.grey,
              icon: Icons.notifications_off,
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: ((context) {}),
              backgroundColor: Colors.red,
              icon: Icons.delete_forever,
            )
          ],
        ),
        child: Container(
            color: Colors.orange,
            child: const ListTile(
              title: Text('ผู้ใช้งาน 123456 ได้แสดงความเห็น'),
              subtitle: Text('ชีวิตคนเรามันมีปัญหาเสมอครับ ค่อยๆแก้ไป'),
            )),
      ),
    );
  }
}
