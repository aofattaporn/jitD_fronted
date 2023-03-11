import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/screens/test_stress/stressData.dart';
import '../../blocs/stress/stress_bloc.dart';
import '../../constant.dart';

class StressQuiz extends StatefulWidget {
  const StressQuiz({Key? key}) : super(key: key);

  @override
  State<StressQuiz> createState() => StressQuizState();
}

class StressQuizState extends State<StressQuiz> {
  List quiz = quizData;

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
                    header(context),
                    const Divider(
                      thickness: 1.5,
                      color: primaryColorDark,
                    ),
                    questionText(context, state),
                    questionNavigate(context, state),
                    answerBox(state),
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
          "ในช่วง 2 สัปดาห์ที่ผ่านมารวมทั้งวันนี้ ท่านมีอาการเหล่านี้บ่อยแค่ไหน",
          style: fontsTH14_black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Padding submitButton(StressState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          if (state.countQuestion < quiz.length - 1) {
            context.read<StressBloc>().add(QuestionNext());
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.055,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            state.countQuestion != quiz.length - 1 ? "ต่อไป" : "ส่งคำตอบ",
            style: fontsTH16White,
          )),
        ),
      ),
    );
  }

  GridView answerBox(StressState state) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisSpacing: 20,
      childAspectRatio: 2.5,
      crossAxisCount: 2,
      children: List.generate(
          4,
          (listIndex) => ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        quiz[state.countQuestion]['answer'][listIndex]['text'],
                        style: fontsTH16_black_w500,
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
            quiz[state.countQuestion]['questionText'],
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
        Text('${(state.countQuestion + 1).toString()}/${quiz.length}'),
        IconButton(
          icon: const Icon(
            Icons.navigate_next,
            size: 30,
            color: textColor1,
          ),
          onPressed: () {
            if (state.countQuestion < quiz.length - 1) {
              context.read<StressBloc>().add(QuestionNext());
            }
          },
        )
      ],
    );
  }
}
