import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../tutorials/TutorialPage2.dart';

class Resulttest extends StatefulWidget {
  const Resulttest({Key? key}) : super(key: key);

  @override
  State<Resulttest> createState() => _ResulttestState();
}

class _ResulttestState extends State<Resulttest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "หน้าหลักการทดสอบ",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
          children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Text 1
            const Center(
              // color: Colors.lightBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 40),
                child: Text("ทดสอบฟรี",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1)),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                  child: Text("เริ่มต้นทดสอบวัดระดับความเครียดของคุณได้แล้ว\n",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(0.1),
                child: Center(
                  child: Text("ตอนนี้",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
            ),

            /// background image
            Stack(
              children: [
                Image.asset(
                  'assets/images/test_stress1.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.75, -1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => TutorialPage2()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: thirterydColor,
                            minimumSize: const Size(100, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            fixedSize: const Size.fromHeight(30)),
                        child: const Text("เริ่มต้นทดสอบ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 60),
                    child: Text(
                      "ทดสอบระดับความเครียด",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 80),
                    child: Text(
                      "วัดระดับความเครียดของ\n"
                      "คุณภายใน 15 นาที",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: backgroundColor2,
                      border: Border.all(color: const Color.fromRGBO(207, 229, 225, 1), width: 5)
                    ),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Icon(Icons.mood, size: 80, color: secondaryColorLight,),
                          Text("ทดสอบเมื่อ 24/11/2565",),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.035,),
                          Text("ท่านไม่มีอาการของโรคซึมเศร้า หรือมีอาการของโรคซึมเศร้าระดับน้อยมาก")
                        ],
                      ),
              ),
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                      child: Text("ผลการทดสอบล่าสุดของคุณ", style: fontsTH18_Black)),
                ),
              ]
            ),
          ],
        ),
      ]),
    );
  }
}
