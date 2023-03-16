import 'dart:convert';
import 'dart:core';

ListStressModel listStressModelFromJson(String str) =>
    ListStressModel.fromJson(json.decode(str));

class ListStressModel {
  List<StressModel> quiz = [];

  ListStressModel() {
    throw UnimplementedError();
  }

  /// method convert map to json
  ListStressModel.fromJson(List<dynamic> json) {
    for (var element in json) {
      quiz.add(StressModel.fromJson(element));
    }
  }
}


StressModel stressModelFromJson(String str) =>
    StressModel.fromJson(json.decode(str));

class StressModel {
  int? number;
  String? questionText;
  List<Answer>? answer;
  String? error;

  StressModel();

  StressModel.withError(String errorMessage) {
    error = errorMessage;
  }

  StressModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    questionText = json['questionText'];
    answer = getEachChoice(json['choices']);
  }

  List<Answer>? getEachChoice(List<dynamic> json) {
    List<Answer>? temp = [];
    for (var element in json) {
      temp.add(Answer.fromJson(element));
    }
    return temp;
  }
}

class Answer {
  int? number;
  String? text;
  int? value;

  Answer();

  Answer.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    value = json['value'];
  }
}