import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';

import '../../constant.dart';

class TutorialPage4 extends StatefulWidget {
  const TutorialPage4({Key? key}) : super(key: key);

  @override
  State<TutorialPage4> createState() => _TutorialPage4State();
}

class _TutorialPage4State extends State<TutorialPage4> {
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
                                child: Image.asset("assets/images/bgInStackPic2.png", height: MediaQuery.of(context).size.height * 0.35)
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

              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Align(
                  alignment: const AlignmentDirectional(-0.65, 0.2),
                  child: Container(
                    margin: EdgeInsets.only(top: 220),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "หลังจากหายเครียดแล้วเรามาเป็นผู้ให้กันเถอะ ให้รอยยิ้ม วิธีการแก้จากตัวเราคอมเม้นท์ช่วยคนอื่นกันเป็นผู้ให้ ก็สุขใจและยิ่งใหญ่นะ",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0, 0.65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // cucle 1
                    _curcle_page(thirterydColor),
                    const SizedBox(width: 10),
                    // cucle 1
                    _curcle_page(thirterydColor),
                    const SizedBox(width: 10),
                    // cucle 1
                    _curcle_page(thirterydColor),
                    const SizedBox(width: 10),
                    // cucle 1
                    _curcle_page(thirterydColor),
                  ],
                ),
              ),

              Align(
                alignment: const Alignment(0, 0.85),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const TutorialPage5()),
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
