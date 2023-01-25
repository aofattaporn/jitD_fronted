import 'package:flutter/material.dart';

class Setting_admin extends StatefulWidget {
  const Setting_admin({Key? key}) : super(key: key);

  @override
  State<Setting_admin> createState() => _Setting_adminState();
}

class _Setting_adminState extends State<Setting_admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "ติดต่อแอดมิน",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text(
                "เราสามารถช่วยอะไรคุณได้บ้าง ?\n"
                    "ลองติดต่อแอดมินผ่านแบบฟอร์มด้านล่าง\n"
                    "แล้วรอการตอบกลับ",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 2.2,
                    color: Color.fromARGB(255, 170, 212, 204))),
            const SizedBox(height: 20),
            Align(
              child: Container(
                height: 350,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 170, 212, 204),
                    borderRadius:
                    BorderRadiusDirectional.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: const [Text("หัวข้อ")],
                      ),
                      SizedBox(height: 20),
                      Container(color: Colors.white, child: TextField()),
                      SizedBox(height: 20),
                      Row(
                        children: const [Text("รายละเอียด")],
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        child: TextField(
                          maxLines: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "ตรวจสอบสถานะการร้องขอ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 120, 148, 150),  fontFamily: "Dubai", fontSize: 14),
                  ),
                  onPressed: () {
                    //Get.to(ForgetPassword());
                  },
                )
              ],
            ),
            const SizedBox(width: 20, height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize:
                  MaterialStateProperty.all(const Size(100, 40)),
                  backgroundColor:
                  MaterialStateProperty.all(Colors.orangeAccent),
                ),
                child: const Text('ส่ง'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
