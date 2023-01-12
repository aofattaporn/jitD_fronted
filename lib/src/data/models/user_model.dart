import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? tokenId;
  String? petName;
  int? point;

  // Config? config;
  // Post? posts;
  // Comment? comment?
  // Like? like?
  // Notification? notiffication?

  String? error;

  UserModel(this.tokenId, this.petName, this.point);
  // UserModel(this.error);

  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  UserModel.fromJson(Map<String, dynamic> json) {
    tokenId = json['tokenId'];
    petName = json['petName'];
    point = json['point'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tokenId'] = tokenId;
    data['petName'] = petName;
    data['point'] = point;

    return data;
  }
}
