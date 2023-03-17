import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';

class StressTestResult extends StatefulWidget {
  final int score;
  final String result;
  final String advice;
  const StressTestResult(
      {Key? key,
      required this.score,
      required this.result,
      required this.advice})
      : super(key: key);

  @override
  State<StressTestResult> createState() => StressTestResultState();
}

class StressTestResultState extends State<StressTestResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/finish.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "สิ้นสุดการทดสอบ",
                style: fontsTH30_black_bold,
              ),
              resultBox(context),
              submitButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Padding resultBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).devicePixelRatio * 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(70)),
            color: Colors.white,
            border: Border.all(color: primaryColor, width: 3)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).devicePixelRatio * 10,
              horizontal: MediaQuery.of(context).devicePixelRatio * 10),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Avatars.png',
                scale: 1.25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).devicePixelRatio * 5,
                    horizontal: MediaQuery.of(context).devicePixelRatio * 5),
                child: Text(
                  widget.result,
                  style: fontsTH20_secondaryDark_bold,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                widget.advice,
                style: fontsTH16_Black,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector submitButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const BottomNavigationWidget()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.055,
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          "ยืนยัน",
          style: fontsTH16White,
        )),
      ),
    );
  }
}
