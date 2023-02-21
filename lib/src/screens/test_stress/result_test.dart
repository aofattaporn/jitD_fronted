import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../tutorials/TutorialPage2.dart';

class Resulttest extends StatefulWidget {
  const Resulttest({Key? key}) : super(key: key);

  @override
  State<Resulttest> createState() => _ResulttestState();
}

class _ResulttestState extends State<Resulttest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "หน้าหลักการทดสอบ",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.54,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.white),
          child: Center(
            child: Container(
              // color: Colors.amber,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Text 1
                    const Center(
                      // color: Colors.lightBlue,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 40),
                        child: Text("ทดสอบฟรี",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1)),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Center(
                          child: Text(
                              "เริ่มต้นทดสอบวัดระดับความเครียดของคุณได้แล้ว\n",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(0.1),
                        child: Center(
                          child: Text("ตอนนี้",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                    ),

                    /// background image
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/test_stress1.png',
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 60),
                                child: Text(
                                  "ทดสอบระดับความเครียด",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 80),
                                child: Text(
                                  "วัดระดับความเครียดของ\n"
                                  "คุณภายใน 15 นาที",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )),
                          ),
                          Container(
                            child: Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => TutorialPage2()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: thirterydColor,
                                    minimumSize: Size(100, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                     fixedSize: Size.fromHeight(30)
                                    ),
                                child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 80),
                                    child: Text("ถัดไป",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   child: const Padding(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 5, vertical: 80),
                    //     child: InputDecorator(
                    //       decoration: InputDecoration(
                    //         labelText: 'XP',
                    //       ),
                    //       child: Text('content goes here'),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
