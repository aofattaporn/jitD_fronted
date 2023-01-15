import 'dart:convert';

CreateModel createModelFromJson(String str) => CreateModel.fromJson(json.decode(str));

String createModelToJson(CreateModel data) => json.encode(data.toJson());


class CreateModel {
  String? message;
  String? error;

  /// constructor method
  CreateModel(CreateModel? tese_model, {
    required this.message,
  });


  CreateModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  CreateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  CreateModel convertType(CreateModel? tese_model) {
    return CreateModel(tese_model, message: '');
  }



  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}
