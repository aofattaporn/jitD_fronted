import 'dart:convert';
import 'dart:core';

ListConsultModel listConsultModelFromJson(String str) =>
    ListConsultModel.fromJson(json.decode(str));

class ListConsultModel {
  List<ConsultModel> quiz = [];

  ListStressModel() {
    throw UnimplementedError();
  }

  /// method convert map to json
  ListConsultModel.fromJson(List<dynamic> json) {
    for (var element in json) {
      quiz.add(ConsultModel.fromJson(element));
    }
  }
}

List<ListConsultModel> quizResult = [];

ConsultModel consultModelFromJson(String str) =>
    ConsultModel.fromJson(json.decode(str));

ConsultResultModel consultResultModelFromJson(String str) =>
    ConsultResultModel.fromJson(json.decode(str));

class ConsultModel {
  int? number;
  String? questionText;
  List<Answer>? answer;
  String? error;

  ConsultModel();

  ConsultModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ConsultModel.fromJson(Map<String, dynamic> json) {
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

class ConsultResultModel {
  String? testDate;
  String? testName;
  int? point;
  String? result;
  String? desc;
  String? error;

  ConsultResultModel();

  ConsultResultModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ConsultResultModel.fromJson(Map<String, dynamic> json) {
    testDate = json['testDate'];
    testName = json['testName'];
    point = json['point'];
    result = json['result'];
    desc = json['desc'];
  }
}