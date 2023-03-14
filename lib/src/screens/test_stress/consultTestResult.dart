import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:intl/intl.dart';

class ConsultTestResult extends StatefulWidget {
  final int? consultLevel;
  const ConsultTestResult(
      {Key? key,
      required this.consultLevel,})
      : super(key: key);

  @override
  State<ConsultTestResult> createState() => ConsultTestResultState();
}

class ConsultTestResultState extends State<ConsultTestResult> {
  DateTime dateNow = DateTime.now();

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
              Text("ทดสอบเมื่อวันที่ ${dateConvert(dateNow)}", style: fontsTH14TextColor3,),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).devicePixelRatio * 5,
                    ),
                child: Text(
                  widget.consultLevel == 0
                   ? "เสียใจด้วยคุณยังไม่ผ่านการทดสอบ"
                   : "ยินดีด้วยคุณผ่านการทดสอบ",
                  style: fontsTH20_secondaryDark_bold,
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                widget.consultLevel == 0
                ? "กรุณาทดสอบใหม่อีกครั้ง"
                : "ระดับผู้ให้คำปรึกษาของคุณคือ",
                style: fontsTH16_Black,
                textAlign: TextAlign.center,
              ),
              Text(
                  widget.consultLevel == 0
                  ? ""
                : "ระดับ: ${widget.consultLevel.toString()}",
                style: fontsTH18_thirteryd_bold,
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
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const BottomNavigationWidget()));
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

  dateConvert(DateTime? date) {
    return DateFormat('dd MMM yyyy HH:mm:ss').format(
        DateTime.parse(date.toString())
            .toUtc()
            .add(const Duration(hours: 7)));
  }
}
