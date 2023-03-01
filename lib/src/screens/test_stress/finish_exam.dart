import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/constant.dart';

class Finishexam extends StatefulWidget {
  const Finishexam({Key? key}) : super(key: key);

  @override
  State<Finishexam> createState() => _FinishexamState();
}

class _FinishexamState extends State<Finishexam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Image.asset("assets/images/finish.png")),
              Align(
                alignment: AlignmentDirectional(0, -0.8),
                child: Text(
                  "สิ้นสุดการทดสอบ",
                  style: GoogleFonts.getFont(
                    'Bai Jamjuree',
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      color: Colors.white,
                      border: Border.all(color: primaryColor, width: 3)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.4),
                child: Image.asset("assets/images/Avatars.png"),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  "ท่านมีความรู้สึกเครียดเล็กน้อย",
                  style: GoogleFonts.getFont(
                    'Bai Jamjuree',
                    color: primaryColorDark,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.2),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                      "ท่านมีความรู้สึกเครียดอยู่ในระดับน้อย\n และ หายไปได้ในระยะเวลาสั้น ๆ\n เป็นความเครียด\nที่เกิดขึ้นได้ในชีวิตประจำวัน",
                      style: TextStyle(fontSize: 18, color: textColor1)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.7),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: primaryColorDark,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))
                      // fixedSize: Size.fromHeight(30)
                    ),
                    child: const Text("ยืนยัน",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
    );
  }
}