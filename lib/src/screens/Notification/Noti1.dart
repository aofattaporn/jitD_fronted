import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constant.dart';

class Noti_1 extends StatefulWidget {
  const Noti_1({Key? key}) : super(key: key);

  @override
  State<Noti_1> createState() => _Noti_1State();
}

class _Noti_1State extends State<Noti_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Center(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.02,
      //         width: MediaQuery.of(context).size.height,
      //         color: primaryColorSubtle,
      //       ),
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.2,
      //         width: MediaQuery.of(context).size.height * 1,
      //         decoration:
      //             const BoxDecoration(color: primaryColorSubtle, boxShadow: [
      //           BoxShadow(
      //             blurRadius: 4,
      //             color: Color.fromRGBO(0, 0, 0, 0.25),
      //             offset: Offset(0, 4),
      //           )
      //         ]),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 //Widget Box and Text
      //                 Container(
      //                   decoration: const BoxDecoration(
      //                     borderRadius: BorderRadius.only(
      //                       topRight: Radius.circular(20),
      //                       bottomRight: Radius.circular(20),
      //                     ),
      //                     color: primaryColor,
      //                   ),
      //                   height: MediaQuery.of(context).size.height * 0.1,
      //                   width: MediaQuery.of(context).size.width * 0.7,
      //                   child: Container(
      //                     margin: EdgeInsets.only(
      //                         top: MediaQuery.of(context).devicePixelRatio * 6,
      //                         left:
      //                             MediaQuery.of(context).devicePixelRatio * 10),
      //                     child: const Text(
      //                       "การแจ้งเตือน",
      //                       style: TextStyle(
      //                           color: Colors.white,
      //                           fontSize: 36,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                   ),
      //                 ),
      //
      //                 Container(
      //                   margin: EdgeInsets.only(
      //                       right: MediaQuery.of(context).devicePixelRatio * 5),
      //                   decoration: const BoxDecoration(
      //                     borderRadius: BorderRadius.all(Radius.circular(50)),
      //                     color: secondaryColor,
      //                   ),
      //                   child: IconButton(
      //                     icon: Image.asset(
      //                       'assets/images/messenger.png',
      //                       color: Colors.white,
      //                     ),
      //                     onPressed: () {},
      //                   ),
      //                 ),
      //               ],
      //             ),
      //SizedBox(height: 100),
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
            child: ListTile(
              title: Text('ผู้ใช้งาน 123456 ได้แสดงความเห็น'),
              subtitle: Text('ชีวิตคนเรามันมีปัญหาเสมอครับ ค่อยๆแก้ไป'),
            )),
      ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }
}
