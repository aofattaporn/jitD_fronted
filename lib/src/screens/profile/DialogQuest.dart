import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_bloc.dart';
import 'package:jitd_client/src/blocs/user/user_event.dart';
import 'package:jitd_client/src/screens/profile/QuestBox.dart';
import '../../blocs/dialyQuest/quest_state.dart';
import '../../blocs/user/user_bloc.dart';
import '../../blocs/user/user_state.dart';
import '../../constant.dart';

class DialogQuest extends StatelessWidget {
  final QuestBloc questBloc;
  final UserBloc _userBloc;

  const DialogQuest(
      {Key? key, required UserBloc userBloc, required this.questBloc})
      : _userBloc = userBloc,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: BlocProvider(
        create: (context) => _userBloc,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _userBloc.add(PointAdd());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: thirterydColor),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Daily Quest",
                              style: fontsENG20_White_Bold,
                            )),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Point.png',
                              height: 20,
                            ),
                            Text(state.user.point.toString()),
                          ],
                        );
                      },
                    ),
                    Text(
                      "ทำภารกิจ และ รับคะแนน\nเพื่อให้แก่สัตว์เลี้ยงของคุณได้เลย",
                      style: fontsTH16_black_bold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColorLight),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: BlocProvider(
                              create: (context) => questBloc,
                              child: BlocBuilder<QuestBloc, QuestState>(
                                builder: (questContext, questState) {
                                  if (questState is GetMyQuestSuccess) {
                                    return ListView.separated(
                                      itemCount: questState
                                          .dailyQuestModel.quests!.length,
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return separatedBox(context);
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return QuestBox(
                                            questBloc: questBloc,
                                            userBloc: _userBloc,
                                            context: context,
                                            state: questState,
                                            index: index);
                                      },
                                    );
                                  } else {
                                    return const Text("ERROR");
                                  }
                                },
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -20,
                right: 10,
                child: RawMaterialButton(
                  onPressed: () => Navigator.pop(context),
                  fillColor: statusColorErrorLight,
                  padding: const EdgeInsets.all(11),
                  shape: const CircleBorder(),
                  child: Text(
                    "X",
                    style: GoogleFonts.getFont("Lato",
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Row showPoints(GetUserSuccess userState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Point.png',
          height: 20,
        ),
        Text(userState.user.point.toString()),
      ],
    );
  }

  SizedBox separatedBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.0125,
    );
  }
}
