import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';

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
                            child: const Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: Text("JIT :D", style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold)),)),
                        Container(
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
                                  text: 'สุดท้ายแล้ว เย้ มาทำแบบทดสอบกัน คือทดสอบที่ปรึกษา มาลองทำด้วยกันนะไม่ต้องเครียดด้วย ทำตามที่เป็นจริงๆนะคนเก่งของผมระดับผู้ให้คำปรึกษาสูง ก็จะ',
                                  style: TextStyle(fontSize: 16, color: textColor1),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'สามารถที่จะมองเห็นโพสได้มากขึ้น',
                                        style: TextStyle(color: thirterydColor)),
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 32),
                              child: Image.asset(
                                'assets/images/bear.png',
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // stack 4 on bottom
              Center(
                child: Align(
                    alignment: AlignmentDirectional(0, 0.6),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TutorialPage1()),
                          );
                        },
                        child: Text("ข้ามเพื่อเริ่มการใช้งาน", style: TextStyle(fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            primary: thirterydColor,
                            minimumSize: const Size(100, 40),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                          // fixedSize: Size.fromHeight(30)
                        ))),
              ),
              Center(
                child: Align(
                    alignment: AlignmentDirectional(0, 0.8),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TutorialPage1()),
                          );
                        },
                        child: Text("ทำแบบทดสอบ", style: TextStyle(fontWeight: FontWeight.bold)),
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

}

