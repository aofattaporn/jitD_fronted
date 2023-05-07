import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/data/models/dialyQuest_model.dart';

@immutable
abstract class QuestState {
  final DailyQuestModel dailyQuestModel = DailyQuestModel();

  QuestState();
}

/// state loading
class InitialQuest extends QuestState {
  @override
  List<Object?> get props => [];
}

class GettingMyQuest extends QuestState {
  @override
  List<Object?> get props => [];

  GettingMyQuest();
}

class GetMyQuestSuccess extends QuestState {
  GetMyQuestSuccess(String questDate, List<Quest> quests) {
    super.dailyQuestModel.questDate = questDate;
    super.dailyQuestModel.quests = quests;
  }

  @override
  List<Object?> get props => [];
}

class GetMyQuestError extends QuestState {
  @override
  List<Object?> get props => [];

  final String error;

  GetMyQuestError(this.error);
}

class UpdatingQuest extends QuestState {

}

class CheckingQuest extends QuestState {
  
  @override
  List<Object?> get props => [];
}
