import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'exanmination.dart';

class ResultCounsellor extends StatefulWidget {
  const ResultCounsellor({Key? key}) : super(key: key);

  @override
  State<ResultCounsellor> createState() => _ResultCounsellorState();
}

class _ResultCounsellorState extends State<ResultCounsellor> {
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
      body: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Text 1
            const Center(
              // color: Colors.lightBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 40),
                child: Center(
                  child: SizedBox(
                    height: 25,
                    child: Text("ทดสอบฟรี",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1)),
                  ),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Center(
                  child: SizedBox(
                    height: 25,
                    child: Text(
                      "เริ่มต้นทดสอบวัดระดับการเป็นผู้ให้คำปรึกษาที่ดี\n",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),

            /// background image
            Stack(
              children: [
                Image.asset(
                  'assets/images/test_stress2-depositphotos.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.37,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: const AlignmentDirectional(0.6, -1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Examination()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: thirterydColor,
                            minimumSize: const Size(140, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            fixedSize: const Size.fromHeight(30)),
                        child: const Text("เริ่มต้นทดสอบ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(5, -1),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 30),
                      child: Text(
                        "ทดสอบระดับผู้ให้คำปรึกษา",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const Align(
                  alignment: AlignmentDirectional(5, -1),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 105, vertical: 60),
                      child: Text(
                        "ทดสอบการให้คำปรึกษาของคุณ\n"
                        "เพื่อการเข้าอกเข้าใจผู้อื่น",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Stack(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: backgroundColor2,
                        border: Border.all(
                            color: const Color.fromRGBO(207, 229, 225, 1),
                            width: 5)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Icon(
                          Icons.mood,
                          size: 80,
                          color: secondaryColorLight,
                        ),
                        Text(
                          "ทดสอบเมื่อ 24/11/2565",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.035,
                        ),
                        Text("ยินดีด้วย คุณผ่านการทดสอบ"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text("ระดับผู้ให้คำปรึกษาของคุณคือ: ระดับที่ 2")
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                    color: Colors.white,
                    child:
                        Text("ผลการทดสอบล่าสุดของคุณ", style: fontsTH18_Black)),
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
