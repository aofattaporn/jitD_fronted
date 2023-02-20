import 'dart:convert';

class PostData {
  String content;
  List<String>? comment;
  List<String> tag;

  PostData(this.content, this.comment, this.tag);
}

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  //----- variable for getAllPost (เพราะมัน return มาเป็น list) ----
  List<PostModel> posts = [];

  //----- variable in Each PostModel----
  String? userId;
  String? postId;
  String? content;
  String? date;
  bool? isPublic;
  List<String>? category;

  //----- data for get response ----
  int? countComment;
  int? countPost;
  String? error;

  /// constructor method (Method ที่ยัด arg และจะสร้าง object เป็น type นั้น)
  PostModel(this.content, this.date, this.isPublic, this.category);

  PostModel.Response(this.content, this.date, this.isPublic, this.category,
      this.countPost, this.countComment);

  PostModel.Resquest(this.content, this.date, this.isPublic, this.category);

  PostModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  PostModel.fromJson(List<dynamic> json) {
    if (json != null) {
      json.forEach((element) {
        // แตก json ที่เป็น list ออกเป็นก้อน object type PostModel
        posts.add(PostModel.fromJsonResponse(element));
      });
      print(posts.length);
      posts.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
    }
  }

  /// function get post
  PostModel.fromJsonResponse(Map<String, dynamic> json) {
    userId = json['userId'];
    postId = json['postId'];
    content = json['content'];
    date = json['date'];
    isPublic = json['IsPublic'];
    category =
        (json['category'] as List).map((item) => item as String).toList();
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
}
