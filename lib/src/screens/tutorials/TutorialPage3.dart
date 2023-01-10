import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';
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
      appBar: AppBar(
        backgroundColor: primaryColorSubtle,
        elevation: 0,
      ),
      backgroundColor: secondaryColor,
      body: SafeArea(
          child: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              // stack 1
              Container(
                height: MediaQuery.of(context).size.height * 0.54,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                    color: primaryColorSubtle
                ),
                clipBehavior: Clip.none,
                child: Center(
                  child: Container(
                    // color: Colors.amber,
                      child: Container(
                        // color: Colors.red,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("JIT :D",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold)),
                            ),

                            Center(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Stack(
                                  children: [
                                    Align(
                                    alignment: AlignmentDirectional(1, 0.8),
                                    child: Container(
                                      // color: Colors.amber,
                                        margin: EdgeInsets.only(top: 165),
                                        child: Image.asset(
                                          'assets/images/bear.png',
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          height: MediaQuery.of(context).size.width * 0.48,
                                          fit: BoxFit.contain,
                                        )),
                                  ),

                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(40)),
                                            margin: EdgeInsets.only(top: 0),
                                            child: Image.asset(
                                              'assets/images/bgInStackPic1.png',
                                              width: MediaQuery.of(context).size.width * 0.8,
                                              height: MediaQuery.of(context).size.width * 0.5,
                                              fit: BoxFit.contain,
                                            )),
                                      ),

                                ]
                                ),
                              ),
                            ),
                            // Center(
                            //   child: Align(
                            //     alignment: AlignmentDirectional(-2, -1),
                            //     child: Container(
                            //       // color: Colors.amber,
                            //         margin: EdgeInsets.only(top: 0),
                            //         child: Image.asset(
                            //           'assets/images/bear.png',
                            //           width: MediaQuery.of(context).size.width * 0.8,
                            //           height: MediaQuery.of(context).size.width * 0.5,
                            //           fit: BoxFit.contain,
                            //         )),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 65),
                child: Align(
                  alignment: AlignmentDirectional(-0.65, 0.2),
                  child: Container(
                    margin: EdgeInsets.only(top: 220),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "ตอนนี้คุณเครียดอยู่ใช่ไหม ? มาระบายกับเราสิมีผู้รับฟังมากมายที่เข้าใจ แล้วช่วยคุณได้นะ อย่างน้อยๆ มันช่วยให้ยิ้มได้นะ ",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
                      ),
                    ),
                  ),
                ),
              ),

              // stack 3 on bottom
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
                        _curcle_page(thirterydColor),
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
                            MaterialPageRoute(builder: (context) => const TutorialPage4()),
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

          )),
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
