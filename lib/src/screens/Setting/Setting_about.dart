import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_about extends StatefulWidget {
  const Setting_about({Key? key}) : super(key: key);

  @override
  State<Setting_about> createState() => _Setting_aboutState();
}

class _Setting_aboutState extends State<Setting_about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "เกี่ยวกับ",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
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
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("นโยบายความเป็นส่วนตัว",
                        style: TextStyle(
                            fontSize: 18)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            // Divider(height: 20, thickness: 1),
            // SizedBox(height: 10),
            // buildAccountOption(context,"Change  Password"),
            // buildAccountOption(context,"Content Settings"),
            // buildAccountOption(context,"Social"),
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("ข้อกำหนดการใช้งาน",
                        style: TextStyle(
                            fontSize: 18,)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("ไลบารีโอเพนซอร์ส",
                        style: TextStyle(
                            fontSize: 18, )),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 30),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            // buildNotificationOption("Theme Dark", valNotify1, onChangeFunction1),
            // buildNotificationOption("Account Active", valNotify2, onChangeFunction2),
            // buildNotificationOption("Opportunity", valNotify3, onChangeFunction3),
            SizedBox(height: 40),
            Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {},
                  child: Text("ออกจากระบบ",
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 2.2, color: Colors.red)),
                ))
          ],
        ),
      ),
    );
  }
}
