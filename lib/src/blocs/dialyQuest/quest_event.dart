import 'package:flutter/cupertino.dart';

@immutable
abstract class QuestEvent {
  const QuestEvent();
}

class GetMyQuest extends QuestEvent {
  const GetMyQuest();
}
