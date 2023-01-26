import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_user_status extends StatefulWidget {
  const Setting_user_status({Key? key}) : super(key: key);

  @override
  State<Setting_user_status> createState() => _Setting_user_statusState();
}

class _Setting_user_statusState extends State<Setting_user_status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        centerTitle: true,
        title: const Text("สถานะบัญชี", style: TextStyle(fontSize: 22,
            color: Colors.black,fontWeight: FontWeight.bold),
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
            const SizedBox(height: 20),
            const Icon(
              Icons.emoji_emotions_outlined,
              size: 80.0,
              color: Color.fromARGB(255, 120, 148, 150),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                  "คุณยังไม่ได้โพสต์เนื้อหา\n"
                      "ที่จะส่งผลต่อสถานะบัญชี",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 2.2,
                      color: Colors.black)),
            ),
            const SizedBox(height: 20),
            Align(
              child: Text(
                "ขอบคุณที่ปฏิบัติตาม"
                    "แนวทางปฏิบัติสำหรับชุมชน"
                    "ของเรา",
                style: TextStyle(
                  fontSize: 14,
                  //line height 1= 100%, were 0.9 = 90% of actual line height
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 20),
            Text("  สถานะบัญชีคืออะไร",
                style: TextStyle(
                    fontSize: 22,fontWeight: FontWeight.bold)
              //line height 1= 100%, were 0.9 = 90% of actual line height
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.warning_amber,
                  size: 40.0,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Align(
                  child: Text(
                      "ตรวจดูว่าคุณโพสต์เนื้อหาที่\n"
                          "ไม่ควรอยู่บนJit : D\n"
                          "และ สิ่งที่อาจจะเกิดขึ้นกับบัญชีของคุณ",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.assignment_outlined,
                  size: 40.0,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text("เรียนรู้สิ่งที่คุณสามารถทำได้\n"
                    "หากเนื้อหาที่คุณโพสต์ถูกลบออก\n"
                    "หรือคุณไม่เห็นด้วยกับคำตัดสินของเรา",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.cancel_outlined,
                  size: 40.0,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text("เราอาจยังคงลบบัญชีของคุณออก\n"
                    "โดยไม่แจ้งเตือนหากคุณโพสต์\n"
                    "เนื้อหาที่มีความเสี่ยงต่อชุมชน",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
