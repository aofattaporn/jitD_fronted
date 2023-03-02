import 'dart:convert';
import 'dart:core';

DailyQuestModel DailyQuestModelFromJson(String str) =>
    DailyQuestModel.fromJson(json.decode(str));

// String testModelToJson(AuthModel data) => json.encode(data.toJson());

class DailyQuestModel {
  String? questDate;
  List<Quest>? quests;
  String? error;

  DailyQuestModel();

  DailyQuestModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DailyQuestModel.fromJson(Map<String, dynamic> json) {
    questDate = json['questDate'];
    quests = getEachQuest(json['quest']);
  }

  List<Quest>? getEachQuest(List<dynamic> json) {
    List<Quest>? temp = [];
    for (var element in json) {
      temp.add(Quest.fromJson(element));
    }
    return temp;
  }

  void setMyQuest(String? questDate, List<Quest>? quests) {
    this.questDate = questDate;
    this.quests = quests;
  }
}

class Quest {
  String? questName;
  int? progress;
  int? countGet;
  int? maxProgress;
  int? reward;
  bool? isGetPoint;
  bool? completed;
  String? lastCompletion;

  Quest();

  Quest.fromJson(Map<String, dynamic> json) {
    questName = json['questName'];
    progress = json['progress'];
    countGet = json['countGet'];
    maxProgress = json['maxProgress'];
    reward = json['reward'];
    isGetPoint = json['isGetPoint'];
    completed = json['completed'];
    lastCompletion = json['lastCompletion'];
  }
}
