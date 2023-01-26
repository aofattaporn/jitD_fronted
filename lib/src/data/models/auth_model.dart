import 'dart:convert';

AuthModel testModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

// String testModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String? email;
  String? passworld;
  String? passworldConfirm;
  String? phone;
  String? error;


  AuthModel(this.email, this.passworld, this.passworldConfirm, this.phone);


  AuthModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  AuthModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    passworld = json['Password'];
    passworldConfirm = json['PasswordCF'];
    phone = json['Phone'];
  }
}