import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage2.dart';
import 'package:rive/rive.dart';

import '../../constant.dart';

class TutorialPage5 extends StatefulWidget {
  const TutorialPage5({Key? key}) : super(key: key);

  @override
  State<TutorialPage5> createState() => _TutorialPage5State();
}

class _TutorialPage5State extends State<TutorialPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primaryColorSubtle,
          elevation: 0,
        ),
        backgroundColor: secondaryColor,
        body: SafeArea(
          child: Stack(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                      Expanded(
                        child: Stack(
                          children: [
                            /// content backgrround
                            Align(
                              alignment: const Alignment(0, -0.8),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                        text:
                                            "สุดท้ายแล้ว เย้ มาทำแบบทดสอบกัน คือทดสอบที่ปรึกษา มาลองทำด้วยกันนะ ไม่ต้องเครียดด้วย ทำตามที่เป็นจริงๆนะคนเก่งของผมระดับผู้ให้คำปรึกษาสูง ก็จะสามารถมองเห็นโพสได้มากยิ่งขึ้น",
                                        style: TextStyle(
                                            fontSize: 16, color: textColor1)),
                                  ),
                                ),
                              ),
                            ),

                            /// Bear
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      // color: Colors.amber,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: const RiveAnimation.asset(
                                          "assets/images/login_screen_character.riv",
                                          fit: BoxFit.cover,
                                          animations: ['idle'])),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0, 0.6),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: thirteryColorSubtle,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))
                        // fixedSize: Size.fromHeight(30)
                        ),
                    child: const Text("ข้ามเพื่อเริ่มการใช้งาน",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),

              Align(
                alignment: const Alignment(0, 0.85),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const BottomNavigationWidget(),
                        ),
                        (r) {
                          return false;
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: thirterydColor,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))
                        // fixedSize: Size.fromHeight(30)
                        ),
                    child: const Text("ถัดไป",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ));
  }
}
