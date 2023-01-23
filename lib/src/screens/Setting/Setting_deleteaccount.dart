import 'package:flutter/material.dart';

class Setting_deleteaccount extends StatefulWidget {
  const Setting_deleteaccount({Key? key}) : super(key: key);

  @override
  State<Setting_deleteaccount> createState() => _Setting_deleteaccountState();
}

class _Setting_deleteaccountState extends State<Setting_deleteaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        centerTitle: true,
        title: const Text("ลบบัญชี", style: TextStyle(fontSize: 22,
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
              Icons.cancel,
              size: 80.0,
              color: Color.fromARGB(255, 255, 76, 76),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                  "ปิดใช้งานบัญชีของคุณ\n"
                      "แทนที่จะลบบัญชีใช่ไหม",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //letterSpacing: 2.2,
                      color: Colors.black)),
            ),
            const SizedBox(height: 40),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.remove_red_eye,
                  size: 20.0,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text(
                    "การปิดใช้งานบัญชีของคุณ\n"
                        "จะเป็นการดำเนินการชั่วคราว\n",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Align(
              child: Text(
                "โปรไฟล์,รูปภาพ,ความคิดเห็นและการกดถูกใจ\n"
                    "จะถูกซ่อนไว้จนกว่าคุณจะเปิดใช้งาน\n"
                    "โดยการกลับเข้าสู่ระบบ\n",
                style: TextStyle(
                  fontSize: 14,
                  //line height 1= 100%, were 0.9 = 90% of actual line height
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.warning_amber,
                  size: 20.0,
                  color: Color.fromARGB(255, 255, 180, 77),
                ),
                SizedBox(width: 20),
                Text("บัญชีของคุณจะถูกลบถาวร\n",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Align(
              child: Text(
                "รูปโปรไฟล์, รูปภาพ, วิดีโอ, ความคิดเห็น,\n"
                    " การกดถูกใจ และผู้ติดตามจะถูกลบโดยถาวร\n",
                style: TextStyle(
                  fontSize: 14,
                  //line height 1= 100%, were 0.9 = 90% of actual line height
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 76, 76)),
                ),
                child: const Text('ลบบัญชี'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                  backgroundColor: MaterialStateProperty.all(Colors.white54),
                ),
                child: const Text('ปิดการใช้งานบัญชี',
                  style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
