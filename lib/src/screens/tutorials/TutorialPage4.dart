import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          clipBehavior: Clip.none,
          child: Center(
            child: Container(
              // color: Colors.amber,
              child: Container(
                color: Colors.transparent,
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

                    Container(
                      child: Image.asset(
                        'assets/images/bgInStackPic2.png',
                        width: MediaQuery.of(context).size.width * 1.2,
                        height: MediaQuery.of(context).size.width * 0.4
                      ),
                    ),

                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        // color: Colors.amber,
                        //   margin: EdgeInsets.only(top: 158), //Container ห่างจากวัตถุด้านบนตามที่กำหนด
                          child: Image.asset(
                            'assets/images/bear.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.48,
                            fit: BoxFit.contain,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 80),
        child: Align(
          alignment: AlignmentDirectional(-0.65, 0.2),
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
                _curcle_page(thirterydColor),
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
                    MaterialPageRoute(builder: (context) => const TutorialPage5()),
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
        ),
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
