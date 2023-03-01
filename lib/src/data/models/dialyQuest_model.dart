import 'dart:convert';
import 'dart:core';

DialyQuestModel DialyQuestModelFromJson(String str) =>
    DialyQuestModel.fromJson(json.decode(str));

// String testModelToJson(AuthModel data) => json.encode(data.toJson());

class DialyQuestModel {
  String? questDate;
  List<Quest>? quests;
  String? error;

  DialyQuestModel();

  DialyQuestModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DialyQuestModel.fromJson(Map<String, dynamic> jsons) {
    questDate = jsons['questDate'];
    quests = getEachQuest(jsons['quests']);
  }

  List<Quest>? getEachQuest(List<dynamic> json) {
    List<Quest>? temp;
    for (var element in json) {
      temp?.add(Quest.fromJson(element));
    }
    return quests;
  }

  void setMyQuest(String? questDate, List<Quest>? quests) {
    this.questDate = questDate;
    this.quests = quests;
  }
}

class Quest {
  String? questName;
  String? progress;
  String? maxProgress;
  String? reward;
  bool? isGetPoint;
  bool? completed;
  String? lastCompletion;

  Quest();

  Quest.fromJson(Map<String, dynamic> json) {
    questName = json['questName'];
    progress = json['progress'];
    maxProgress = json['maxProgress'];
    reward = json['reward'];
    isGetPoint = json['isGetPoint'];
    completed = json['completed'];
    lastCompletion = json['lastCompletion'];
  }
}
