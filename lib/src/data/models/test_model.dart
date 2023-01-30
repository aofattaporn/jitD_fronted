import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());


class TestModel {
  String? id;
  String? error;

  /// constructor method
  TestModel(TestModel? tese_model, {
    required this.id,
  });


  TestModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  TestModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
  }

  TestModel convertType(TestModel? tese_model) {
    return TestModel(tese_model, id: '');
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = id;
    return data;
  }
}
