import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/screens/test_stress/consultData.dart';
import '../../blocs/consult/consult_bloc.dart';
import '../../constant.dart';
import '../Utilities/AllToast.dart';
import 'consultTestResult.dart';

class ConsultQuiz extends StatefulWidget {
  const ConsultQuiz({Key? key}) : super(key: key);

  @override
  State<ConsultQuiz> createState() => ConsultQuizState();
}

class ConsultQuizState extends State<ConsultQuiz> {
  final toast = FToast();
  List quiz = consultQuizData;
  int score = 0;
  int consultLevel = 0;

  @override
  void initState() {
    toast.init(context);
    super.initState();
  }

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
          "แบบทดสอบผู้ให้คำปรึกษา",
          style: fontsTH20_black_bold,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/doing_test_wallpaper.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocProvider(
            create: (context) => ConsultBloc(),
            child: BlocBuilder<ConsultBloc, ConsultState>(
              builder: (context, state) {
                return Column(
                  children: [
                    /// Question Section ------------------------
                    questionText(context, state),
                    questionNavigate(context, state),

                    /// Answer Section ------------------------
                    answerBox(state, context),
                    submitButton(state, context)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Padding submitButton(ConsultState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          if (state.countQuestion < quiz.length - 1) {
            context.read<ConsultBloc>().add(QuestionNext());
          } else {
            if (state.selectedAnswer.contains(-1)) {
              showToast("กรุณาตอบทุกคำถาม");
            } else {
              scoreCalculator(state);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConsultTestResult(
                            consultLevel: consultLevel,
                          )));
            }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.055,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            state.countQuestion != quiz.length - 1 ? "ต่อไป" : "ส่งคำตอบ",
            style: fontsTH16White,
          )),
        ),
      ),
    );
  }

  GridView answerBox(ConsultState state, BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 5,
      crossAxisCount: 1,
      children: List.generate(
          4,
          (index) => ListView.builder(
              itemCount: 1,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, listIndex) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      state.selectedAnswer[state.countQuestion] = index;
                      state.selectedScore[state.countQuestion] =
                          quiz[state.countQuestion]['answer'][index]['score'];
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: BoxDecoration(
                      color: state.selectedAnswer[state.countQuestion] == index
                          ? primaryColor
                          : Colors.white,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          quiz[state.countQuestion]['answer'][index]['text'],
                          style:
                          state.selectedAnswer[state.countQuestion] == index
                          ? fontsTH16_white_w500
                          : fontsTH16_black_w500,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              })).toList(),
    );
  }

  Padding questionText(BuildContext context, ConsultState state) {
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).devicePixelRatio * 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primaryColor, width: 5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Center(
              child: Text(
            quiz[state.countQuestion]['questionText'],
            style: fontsTH16_black_w500,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }

  Row questionNavigate(BuildContext context, ConsultState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(
            Icons.navigate_before,
            size: 30,
            color: textColor1,
          ),
          onPressed: () {
            if (state.countQuestion > 0) {
              context.read<ConsultBloc>().add(QuestionBack());
            }
          },
        ),
        Text('${(state.countQuestion + 1).toString()}/${quiz.length}'),
        IconButton(
          icon: const Icon(
            Icons.navigate_next,
            size: 30,
            color: textColor1,
          ),
          onPressed: () {
            if (state.countQuestion < quiz.length - 1) {
              context.read<ConsultBloc>().add(QuestionNext());
            }
          },
        )
      ],
    );
  }

  void showToast(String msg) => toast.showToast(
      child: warningToast(msg, context), gravity: ToastGravity.TOP);

  void scoreCalculator(ConsultState state) {
    score = state.selectedScore.reduce((value, current) => value + current);
    if (score >= 0 && score <= 10) {
    } else if (score >= 11 && score <= 14) {
      consultLevel = 1;
    } else if (score >= 9 && score <= 14) {
      consultLevel = 2;
    } else if (score >= 15 && score <= 19) {
      consultLevel = 3;
    }
  }
}
