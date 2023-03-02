import 'package:flutter/cupertino.dart';

@immutable
abstract class QuestEvent {
  const QuestEvent();
}

class GetMyQuest extends QuestEvent {
  const GetMyQuest();
}

class UpdateQuestEvent extends QuestEvent {
  String? questName;
  String? currentPoint;

  UpdateQuestEvent(this.questName, this.currentPoint);
}
