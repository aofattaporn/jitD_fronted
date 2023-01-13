import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:rive/rive.dart';

import 'package:jitd_client/src/screens/tutorials/TutorialPage2.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage4.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';

import '../../constant.dart';

class TutorialPage3 extends StatefulWidget {
  const TutorialPage3({Key? key}) : super(key: key);

  @override
  State<TutorialPage3> createState() => _TutorialPage3State();
}

class _TutorialPage3State extends State<TutorialPage3> {
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
          child: Column(
            children: [
              /// top-content
              Container(
                height: MediaQuery.of(context).size.height * 0.54,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: primaryColorSubtle),
                child: Center(
                  child: Column(
                    children: [
                      /// JIT:D label
                      SizedBox(
                        //color: Colors.green,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: Text("JIT :D",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 64,
                                    fontWeight: FontWeight.bold)),
                          )),

                      /// Box content
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 65),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text:
                                "สวัสดีคนที่น่ารัก ยินดีต้อนรับครับ!!!เราเป็น สัตว์เลี้ยงของคุณ ที่จะอยู่เคียงข้างคุณตราบนานแสนนานวันนี้เจอปัญหามาหนักมากใช่ไหม มาระบายกับเราสิเราสัญญาว่าจะฟังอย่างตั้งใจเลยอยากเล่าให้เราฟังแล้วใช่ไหมล่ะ แต่มากอดก่อนเล่าเร็ว",
                                style:
                                TextStyle(fontSize: 16, color: textColor1)),
                          ),
                        ),
                      ),

                      /// Pet Riv
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: const RiveAnimation.asset(
                              "assets/images/login_screen_character.riv",
                              fit: BoxFit.cover,
                              animations: const ['idle']),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// bottom-content
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    // stack 4 on bottom
                    Center(
                      child: Align(
                          alignment: AlignmentDirectional(0, 0.8),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const TutorialPage3()),
                                );
                              },
                              child: Text("ถัดไป",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                  primary: thirterydColor,
                                  minimumSize: const Size(100, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))
                                // fixedSize: Size.fromHeight(30)
                              ))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
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
