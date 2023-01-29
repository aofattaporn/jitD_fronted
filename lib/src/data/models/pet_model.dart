import 'dart:convert';

PetModel petModelFromJson(String str) => PetModel.fromJson(json.decode(str));

String petModelToJson(PetModel data) => json.encode(data.toJson());

class PetModel {
  String? PetName;
  String? error;

  PetModel(this.PetName);

  PetModel.withError(String errorMassage){
    error = errorMassage;
  }

  PetModel.fromJson(Map<String, dynamic> json) {
    PetName = json['petName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['petName'] = PetName;
    return data;
  }
}