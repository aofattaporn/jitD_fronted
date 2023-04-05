import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/test_stress/consultQuiz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/consult/consult_bloc.dart';
import '../../constant.dart';
import '../../constant/constant_fonts.dart';

class ConsultTest extends StatefulWidget {
  const ConsultTest({Key? key}) : super(key: key);

  @override
  State<ConsultTest> createState() => _ConsultTestState();
}

class _ConsultTestState extends State<ConsultTest> {
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
                image: AssetImage("assets/images/consult_wallpaper.png"),
                fit: BoxFit.cover)),
        child: BlocProvider(
          create: (context) => ConsultBloc(),
          child: Column(
            children: [
              sectionHeader(context),
              sectionButton(context),
              sectionResult(context),
            ],
          ),
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
              horizontal: MediaQuery.of(context).devicePixelRatio * 20),
          child: Text(
            "เริ่มต้นทดสอบวัดระดับการเป็นผู้ให้คำปรึกษาที่ดี",
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
          EdgeInsets.only(top: MediaQuery.of(context).devicePixelRatio * 35),
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
                    "ทดสอบเมื่อ 24/11/2565\n",
                    style: fontsTH14TextColor3,
                  ),
                  Text(
                    "ยินดีด้วยคุณผ่านการทดสอบ\n",
                    style: fontsTH14_black_bold,
                  ),
                  Text(
                    "ระดับผู้ให้คำปรึกษาของคุณคือ :",
                    style: fontsTH16_Black,
                  ),
                  Text(
                    "ระดับที่ 2",
                    style: fontsTH16_thirteryd_bold,
                  )
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
          top: MediaQuery.of(context).devicePixelRatio * 20,
          right: MediaQuery.of(context).devicePixelRatio * 5),
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              Text(
                "ทดสอบผู้ให้คำปรึกษา",
                style: fontsTH18_black_bold,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).devicePixelRatio * 4),
                child: Text(
                  "ทดสอบการให้คำปรึกษาของคุณ เพื่อการเข้าอกเข้าใจผู้อื่น",
                  style: fontsTH14TextColor2,
                  textAlign: TextAlign.center,
                ),
              ),
              BlocConsumer<ConsultBloc, ConsultState>(
                listener: (contexts, state) {
                  if (state is LoadedConsultQuiz) {
                    Navigator.push(
                        contexts,
                        MaterialPageRoute(
                            builder: (context) => ConsultQuiz(
                              quiz: state.quizData,
                            )));
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ConsultBloc>().add(GetQuestion());
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                            color: thirterydColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: state is LoadingConsultQuiz
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : Text(
                              "เริ่มต้นทดสอบ",
                              style: fontsTH16White,
                            ))),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
