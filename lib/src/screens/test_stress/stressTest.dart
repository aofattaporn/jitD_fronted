import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:jitd_client/src/screens/test_stress/stressQuiz.dart';

import '../../constant.dart';

class StressTest extends StatefulWidget {
  const StressTest({Key? key}) : super(key: key);

  @override
  State<StressTest> createState() => StressTestState();
}

class StressTestState extends State<StressTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: secondaryColorDark,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "หน้าหลักการทดสอบ",
          style: fontsTH20_black_bold,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/stress_wallpaper.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            sectionHeader(context),
            sectionButton(context),
            sectionResult(context),
          ],
        ),
      ),
    );
  }

  Column sectionHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).devicePixelRatio * 15,
              bottom: MediaQuery.of(context).devicePixelRatio * 3),
          child: Text("ทดสอบฟรี", style: fontsTH20_black_bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).devicePixelRatio * 15),
          child: Text(
            "เริ่มต้นทดสอบวัดระดับความเครียดของคุณได้แล้วตอนนี้",
            style: fontsTH16_Black,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Padding sectionResult(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).devicePixelRatio * 25),
      child: Stack(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: backgroundColor2,
                  border: Border.all(
                      color: const Color.fromRGBO(207, 229, 225, 1), width: 5)),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  const Icon(
                    Icons.mood,
                    size: 80,
                    color: secondaryColorLight,
                  ),
                  Text(
                    "ทดสอบเมื่อ 24/11/2565",
                    style: fontsTH14TextColor3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        "ท่านไม่มีอาการของโรคซึมเศร้าหรือมีอาการของโรคซึมเศร้าระดับน้อยมาก",
                        style: fontsTH16_Black,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Container(
              color: Colors.white,
              child: Text("ผลการทดสอบล่าสุดของคุณ", style: fontsTH18_Black)),
        ),
      ]),
    );
  }

  Padding sectionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).devicePixelRatio * 30,
          left: MediaQuery.of(context).devicePixelRatio * 5),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              Text(
                "ทดสอบระดับความเครียด",
                style: fontsTH18_black_bold,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).devicePixelRatio * 4),
                child: Text(
                  "วัดระดับความเครียดของคุณภายใน 15 นาที",
                  style: fontsTH14TextColor2,
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StressQuiz()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                      color: thirterydColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "เริ่มต้นทดสอบ",
                    style: fontsTH16White,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
