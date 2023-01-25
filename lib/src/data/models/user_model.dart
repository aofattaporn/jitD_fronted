import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? point;
  String? petName;
  String? error;

  UserModel(this.petName, this.point);

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  UserModel.fromJson(Map<String, dynamic> json) {
    petName = json['petName'];
    point = json['point'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['petName'] = petName;
    data['point'] = point;

    return data;
  }
}
