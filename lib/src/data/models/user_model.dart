import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? countPosts;
  int? countLikes;
  int? countComments;
  String? userId;
  int? point;
  String? petName;
  String? error;

  UserModel.response(this.countPosts,this.countLikes,this.countComments,this.userId,this.point,this.petName);
  UserModel(this.point,this.petName);


  UserModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  UserModel.fromJson(Map<String, dynamic> json) {
    countPosts = json['countPosts'];
    countLikes = json['countLikes'];
    countComments = json['countComments'];
    userId = json['userId'];
    petName = json['petName'];
    point = json['point'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['countPosts'] = countPosts;
    // data['countLikes'] = countLikes;
    // data['countComments'] = countComments;
    // data['userId'] = userId;
    data['petName'] = petName;
    data['point'] = point;

    return data;
  }
}