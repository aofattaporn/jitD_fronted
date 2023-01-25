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
  String? date;
  bool? isPublic;
  List<String>? category;

  //----- data for get response ----
  int? countComment;
  int? countPost;
  String? error;

  // PostModel(this.content, this.date, this.isPublic);
  PostModel(this.content, this.date, this.isPublic, this.category);
  PostModel.Response(this.content, this.date, this.isPublic, this.category, this.countPost, this.countComment);
  PostModel.Resquest(this.content, this.date, this.isPublic, this.category);

  PostModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  PostModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    date = json['Date'];
    isPublic = json['IsPublic'];
    category = json['category'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['date'] = date;
    data['isPublic'] = isPublic;
    data['category'] = category;

    return data;
  }

  // TODO : function get post
  PostModel.fromJsonResponse(Map<String, dynamic> json) {
    content = json['content'];
    date = json['Date'];
    isPublic = json['IsPublic'];
    category = json['category'];
    category = json['category'];
    category = json['category'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = Map<String, dynamic>();
//   data['content'] = content;
//   data['date'] = date;
//   data['isPublic'] = isPublic;
//   data['category'] = category;
//
//   return data;
// }

}
