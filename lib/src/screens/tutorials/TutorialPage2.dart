import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage3.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';
import 'package:rive/rive.dart';

import '../../constant.dart';

class TutorialPage2 extends StatefulWidget {
  const TutorialPage2({Key? key}) : super(key: key);

  @override
  State<TutorialPage2> createState() => _TutorialPage2State();
}

class _TutorialPage2State extends State<TutorialPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: primaryColorSubtle,
        elevation: 0,
      ),
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.54,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                color: primaryColorSubtle
              ),
              child: Center(
                  //color: Colors.red,
                  child: Container(
                    //color: Colors.orange,
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.green,
                          height: MediaQuery.of(context).size.height * 0.1,
                        child: const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Text("JIT :D", style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold)),)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 65),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: "สวัสดีคนที่น่ารัก ยินดีต้อนรับครับ!!!เราเป็น สัตว์เลี้ยงของคุณ ที่จะอยู่เคียงข้างคุณตราบนานแสนนานวันนี้เจอปัญหามาหนักมากใช่ไหม มาระบายกับเราสิเราสัญญาว่าจะฟังอย่างตั้งใจเลยอยากเล่าให้เราฟังแล้วใช่ไหมล่ะ แต่มากอดก่อนเล่าเร็ว",
                                  style: TextStyle(fontSize: 16, color: textColor1)
                                ),
                              ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                              // margin: EdgeInsets.only(top: 10),
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Expanded(
                                child: RiveAnimation.asset(
                                    "assets/images/login_screen_character.riv",
                                    fit: BoxFit.cover,
                                    animations: ['idle']),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.65, -0.01),
              child: Container(
                margin: const EdgeInsets.only(top: 220),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "ตั้งชื่อผมน่ารักๆ เท่ากับตัวคุณเลยนะ :)",
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ),
            Center(
              child: Align(
                alignment: AlignmentDirectional(0.1, 0.48),
                child: SizedBox(
                  width: 370,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 3,
                        )
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'พิมพ์ชื่อสัตว์เลี้ยงของคุณ',
                      //contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  )
                ),
              )
            ),
            Center(
              child: Align(
                  alignment: AlignmentDirectional(0.5, 0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // cucle 1
                      _curcle_page(thirterydColor),
                      SizedBox(width: 10),
                      // cucle 1
                      _curcle_page(thirterydColor),
                      SizedBox(width: 10),
                      // cucle 1
                      _curcle_page(Colors.white70),
                      SizedBox(width: 10),
                      // cucle 1
                      _curcle_page(Colors.white70),
                    ],
                  )),
            ),

            // stack 4 on bottom
            Center(
              child: Align(
                  alignment: AlignmentDirectional(0, 0.8),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TutorialPage3()),
                        );
                      },
                      child: Text("ถัดไป", style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                          primary: thirterydColor,
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                        // fixedSize: Size.fromHeight(30)
                      ))),
            ),
          ],
        ),
      )
    );
  }
  Container _curcle_page(Color colorData) {
    return Container(
      height: 15,
      width: 15,
      decoration:
      BoxDecoration(color: colorData, shape: BoxShape.circle, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 4)
      ]),
      // decoration:
    );
  }
}
