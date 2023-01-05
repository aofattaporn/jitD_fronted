import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: secondaryColor,
      body: SafeArea(
          child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Center(
          child: Container(
            // color: Colors.amber,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Text 1
                Container(
                  // color: Colors.lightBlue,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 40),
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
      )),
    );
  }
}
