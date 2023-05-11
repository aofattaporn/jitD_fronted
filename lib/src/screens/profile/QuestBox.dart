import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_bloc.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_event.dart';
import 'package:intl/intl.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../blocs/dialyQuest/quest_state.dart';
import '../../blocs/user/user_bloc.dart';
import '../../constant.dart';

class QuestBox extends StatefulWidget {
  final BuildContext context;
  final GetMyQuestSuccess state;
  final int index;
  final QuestBloc questBloc;
  final UserBloc userBloc;
  const QuestBox(
      {Key? key,
      required this.questBloc,
      required this.userBloc,
      required this.context,
      required this.state,
      required this.index})
      : super(key: key);

  @override
  State<QuestBox> createState() => _QuestBoxState();
}

class _QuestBoxState extends State<QuestBox> {
  @override
  Widget build(BuildContext context) {
    String questDate = DateFormat('dd/MM/yy').format(DateTime.parse(
            widget.questBloc.dailyQuestModel.questDate ?? DateTime.now().toString())
        .toUtc()
        .add(const Duration(hours: 7)));

    String progress =
        widget.questBloc.dailyQuestModel.quests![widget.index].progress.toString();
    String maxProgress = widget
        .state.dailyQuestModel.quests![widget.index].maxProgress
        .toString();

    String name =
        widget.questBloc.dailyQuestModel.quests![widget.index].questName.toString();
    int nameIndex = name.lastIndexOf("Quest");
    String questName = name.substring(0, nameIndex);

    bool checkReward =
        widget.questBloc.dailyQuestModel.quests![widget.index].countGet !=
            widget.questBloc.dailyQuestModel.quests![widget.index].progress;
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.085,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primaryColorSubtle),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            progressBox(context, questName, progress, maxProgress, questDate),
            GestureDetector(
              onTap: () {
                if (checkReward) {
                  widget.questBloc.add(UpdateQuestEvent(
                      widget.questBloc.dailyQuestModel.quests![widget.index]
                          .questName,
                      widget.userBloc.userModel.point.toString()));
                  // widget.userBloc.add(PointAdd());
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.135,
                // height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    color: checkReward ? thirterydColor : thirteryColorSubtle,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Point.png',
                            height: 15,
                          ),
                          Text(
                              " ${widget.state.dailyQuestModel.quests![widget.index].reward.toString()}")
                        ],
                      ),
                      // const SizedBox(height: 4),
                      Text("รับ", style: fontsTH14_white_bold)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox progressBox(BuildContext context, String questName, String progress,
      String maxProgress, String questDate) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "$questNameเป็นครั้งที่$progress/$maxProgressของวันที่ $questDate",
                style: fontsTH12TextColor2,
              ),
            ),
            LinearPercentIndicator(
              backgroundColor: Colors.white,
              progressColor: secondaryColorDark,
              lineHeight: MediaQuery.of(context).size.height * 0.025,
              barRadius: const Radius.circular(8),
              percent: int.parse(progress) * 0.333,
              animation: true,
              animationDuration: 200,
            )
          ],
        ));
  }
}
