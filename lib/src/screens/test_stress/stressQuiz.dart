import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/data/models/stress_model.dart';
import '../../blocs/stress/stress_bloc.dart';
import '../../constant.dart';
import '../Utilities/AllToast.dart';
import 'stressTestResult.dart';

class StressQuiz extends StatefulWidget {
  final List<StressModel> quiz;
  const StressQuiz({Key? key, required this.quiz}) : super(key: key);

  @override
  State<StressQuiz> createState() => StressQuizState();
}

class StressQuizState extends State<StressQuiz> {
  final toast = FToast();
  late int score;
  late String result;
  late String advice;

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
          "แบบทดสอบความเครียด",
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
            create: (_) => StressBloc(),
            child: BlocBuilder<StressBloc, StressState>(
              builder: (context, state) {
                return Column(
                  children: [
                    /// Header Section ------------------------
                    header(context),
                    const Divider(
                      thickness: 1.5,
                      color: primaryColorDark,
                    ),

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

  Padding header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).devicePixelRatio * 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Text(
          "ในช่วง 2 สัปดาห์ที่ผ่านมารวมทั้งวันนี้ ท่านมีอาการเหล่านี้บ่อยแค่ไหน คำตอบเป็น วัน / สัปดาห์",
          style: fontsTH14_black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Padding submitButton(StressState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: BlocConsumer<StressBloc, StressState>(
        listener: (contexts, state) {
          if (state is LoadedStressResult) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StressTestResult(
                          score: state.quizResult.point!,
                          result: state.quizResult.result!,
                          advice: state.quizResult.desc!,
                        )));
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (state.countQuestion < widget.quiz.length - 1) {
                context.read<StressBloc>().add(QuestionNext());
              } else {
                if (state.selectedAnswer.contains(-1)) {
                  showToast("กรุณาตอบทุกคำถาม");
                } else {
                  score = state.selectedScore
                      .reduce((value, current) => value + current);
                  context
                      .read<StressBloc>()
                      .add(CalResultStress(score.toString()));
                }
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.055,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: state is LoadingStressResult
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          state.countQuestion != widget.quiz.length - 1
                              ? "ต่อไป"
                              : "ส่งคำตอบ",
                          style: fontsTH16White,
                        )),
            ),
          );
        },
      ),
    );
  }

  GridView answerBox(StressState state, BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      childAspectRatio: 2.5,
      crossAxisCount: 2,
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
                          widget.quiz[state.countQuestion].answer![index].value;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: state.selectedAnswer[state.countQuestion] == index
                          ? primaryColor
                          : Colors.white,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        widget.quiz[state.countQuestion].answer![index].text!,
                        style:
                            state.selectedAnswer[state.countQuestion] == index
                                ? fontsTH16_white_w500
                                : fontsTH16_black_w500,
                      ),
                    ),
                  ),
                );
              })).toList(),
    );
  }

  Padding questionText(BuildContext context, StressState state) {
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
            widget.quiz[state.countQuestion].questionText!,
            style: fontsTH16_black_w500,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }

  Row questionNavigate(BuildContext context, StressState state) {
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
              context.read<StressBloc>().add(QuestionBack());
            }
          },
        ),
        Text('${(state.countQuestion + 1).toString()}/${widget.quiz.length}'),
        IconButton(
          icon: const Icon(
            Icons.navigate_next,
            size: 30,
            color: textColor1,
          ),
          onPressed: () {
            if (state.countQuestion < widget.quiz.length - 1) {
              context.read<StressBloc>().add(QuestionNext());
            }
          },
        )
      ],
    );
  }

  void showToast(String msg) => toast.showToast(
      child: warningToast(msg, context), gravity: ToastGravity.TOP);
}
