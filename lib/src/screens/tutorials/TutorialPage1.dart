import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage2.dart';

class TutorialPage1 extends StatefulWidget {
  const TutorialPage1({Key? key}) : super(key: key);

  @override
  State<TutorialPage1> createState() => _TutorialPage1State();
}

class _TutorialPage1State extends State<TutorialPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: secondaryColor,
      body: SafeArea(
          child: Stack(
        children: [
          // stack 1
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.54,
            child: Center(
              child: Container(
                // color: Colors.amber,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// Text 1
                      Container(
                        // color: Colors.lightBlue,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 40),
                          child: Text("แอปพลิเคชันของเราคืออะไร ?",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1)),
                        ),
                      ),

                      /// Text 2 JIT:D
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("JIT :D",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 64,
                                fontWeight: FontWeight.bold)),
                      ),

                      /// Text 3 describe
                      Container(
                        // color: Colors.cyan.shade700,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 48),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'คือแอปพลิเคชันสำหรับ',
                              style: TextStyle(fontSize: 16, color: textColor1),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'ผู้ที่ต้องการระบายความเครียด',
                                    style: TextStyle(color: thirterydColor)),
                                TextSpan(
                                    text: ' หรือ',
                                    style: TextStyle(color: textColor1)),
                                TextSpan(
                                    text: 'ผู้ที่ต้องการให้คำปรึกษา',
                                    style: TextStyle(color: thirterydColor)),
                                TextSpan(
                                    text:
                                        ' กับกลุ่มผู้มีความเครียด ผ่านการโพส การคอมเมนต์หรือการพูดคุยให้คำปรึกษา โดยที่คุณจะสามารถระบายความเครียดหรือให้คำปรึกษาจากที่ไหนก็ได้ผ่านแอปพลิเคชันของเรา',
                                    style: TextStyle(color: textColor1)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // stack 2 on bottom
          Center(
            child: Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(top: 120),
                child: Image.asset(
                  'assets/images/tutorial_bg1.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                )),
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
                    _curcle_page(Colors.white70),
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
                        MaterialPageRoute(builder: (context) => const TutorialPage2()),
                      );
                    },
                    child: Text("ถัดไป"),
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
          BoxDecoration(color: colorData, shape: BoxShape.circle, boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 4)
      ]),
      // decoration:
    );
  }
}
