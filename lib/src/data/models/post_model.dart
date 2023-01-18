import 'dart:convert';


class PostData {
  String content;
  String like;
  List<String>? comment;
  List<String> tag;

  PostData(this.content, this.like, this.comment, this.tag);
}



PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String? content;
  String? Date;
  bool? IsPublic;
  String? error;


  PostModel(this.content, this.Date, this.IsPublic);

  /// constructor method
  // TestModel(TestModel? tese_model, {
  //   required this.id,
  // });


  PostModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  PostModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    Date = json['Date'];
    IsPublic = json['IsPublic'];
  }


  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['Date'] = Date;
    data['IsPublic'] = IsPublic;

    return data;
  }
}
