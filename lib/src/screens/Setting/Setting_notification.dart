import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/Setting/Setting_setting.dart';

class Setting_notification extends StatefulWidget {
  const Setting_notification({Key? key}) : super(key: key);

  @override
  State<Setting_notification> createState() => _Setting_notificationState();
}

class _Setting_notificationState extends State<Setting_notification> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;
  bool valNotify4 = false;
  bool valNotify5 = false;
  bool valNotify6 = false;
  bool valNotify7 = false;
  bool valNotify8 = false;
  bool valNotify9 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }
  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }
  onChangeFunction4(bool newValue4) {
    setState(() {
      valNotify4 = newValue4;
    });
  }
  onChangeFunction5(bool newValue5) {
    setState(() {
      valNotify5 = newValue5;
    });
  }
  onChangeFunction6(bool newValue6) {
    setState(() {
      valNotify6 = newValue6;
    });
  }
  onChangeFunction7(bool newValue7) {
    setState(() {
      valNotify7 = newValue7;
    });
  }
  onChangeFunction8(bool newValue8) {
    setState(() {
      valNotify8 = newValue8;
    });
  }
  onChangeFunction9(bool newValue9) {
    setState(() {
      valNotify9 = newValue9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        centerTitle: true,
        title: const Text("การแจ้งเตือน", style: TextStyle(fontSize: 16,
            color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Setting_setting()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // SizedBox(height: 40),
            // Row(
            //   children: const [
            //     Icon(
            //       Icons.person,
            //       color: Colors.black,
            //     ),
            //     SizedBox(width: 10),
            //     Text("บัญชี", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            //   ],
            // ),
            // Divider(height: 20, thickness: 1),
            // SizedBox(height: 10),
            // buildAccountOption(context,"Change  Password"),
            // buildAccountOption(context,"Content Settings"),
            // buildAccountOption(context,"Social"),
            SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.volume_up_outlined, color: Colors.black),
                SizedBox(width: 10),
                Text("การแจ้งเตือนแบบพุซ", style: TextStyle(
                    fontSize: 16))
              ],
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            buildNotificationOption("ฟังก์ชันทั้งหมด", valNotify1, onChangeFunction1),
            buildNotificationOption("การโพสต์", valNotify2, onChangeFunction2),
            buildNotificationOption("ความคิดเห็น", valNotify3, onChangeFunction3),
            buildNotificationOption("การกดถูกใจ", valNotify4, onChangeFunction4),
            buildNotificationOption("การปักหมุดความคิดเห็น", valNotify5, onChangeFunction5),
            SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.volume_up_outlined, color: Colors.black),
                SizedBox(width: 10),
                Text("การแจ้งเตือนประเภทอื่นๆ", style: TextStyle(
                    fontSize: 16))
              ],
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            buildNotificationOption("อีเมลข่าว", valNotify6, onChangeFunction6),
            buildNotificationOption("อีเมลคำติชม", valNotify7, onChangeFunction7),
            buildNotificationOption("อีเมลการเตือน", valNotify8, onChangeFunction8),
            buildNotificationOption("อีเมลสนับสนุน", valNotify9, onChangeFunction9),
            Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  onPressed: () {},
                  child: const Text("ออกจากระบบ", style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Color.fromARGB(255, 255, 76, 76)
                  )),
                )
            )
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Option 1"),
                Text("Option 2")
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                  child: Text("Close")
              )
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
