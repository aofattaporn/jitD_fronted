import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

UserModel petNameFromJson(String str) =>
    UserModel.fromJsonPet(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? userID;
  String? petName;
  int? petHP;
  int? point;
  String? error;

  UserModel();

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  // method convert map to json
  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    petName = json['petName'];
    petHP = json['petHP'];
    point = json['point'];
  }

  // method convert map to json
  UserModel.fromJsonPet(Map<String, dynamic> json) {
    petName = json['petName'];
  }

  // method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userID;
    return data;
  }
}
