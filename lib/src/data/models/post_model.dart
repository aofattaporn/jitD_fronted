import 'dart:convert';

ListPostModel listPostModelFromJson(String str) =>
    ListPostModel.fromJson(json.decode(str));

class ListPostModel {
  List<PostModel> posts = [];

  ListPostModel();

  /// method convert map to json
  ListPostModel.fromJson(List<dynamic> json) {
    for (var element in json) {
      posts.add(PostModel.fromJson(element));
    }
    posts.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
  }

  void setCategory(List<PostModel> list, List<String> category, String postID) {
    for (var element in list) {
      if (element.postId == postID) {
        element.category = category.toList();
        break;
      }
    }
  }
}

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

PostModel postModelIDFromJson(String str) =>
    PostModel.fromJsonID(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String? userId;
  String? postId;
  String? content;
  String? date;
  bool? isPublic;
  List<String>? category;
  int? countLike;
  int? countComment;
  int? countPost;
  bool? isLike;
  String? error;

  PostModel();

  /// constructor method (Method ที่ยัด arg และจะสร้าง object เป็น type นั้น)
  PostModel.GetData(this.content, this.date, this.isPublic, this.category,);

  PostModel.Response(this.content, this.date, this.isPublic, this.category,
      this.countPost, this.countComment);

  PostModel.Resquest(this.content, this.date, this.isPublic, this.category,);

  PostModel.withError(String errorMessage) {
    error = errorMessage;
  }

  // function get post
  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    postId = json['postId'];
    content = json['content'];
    date = json['date'];
    isPublic = json['IsPublic'];
    category =
        (json['category'] as List).map((item) => item as String).toList();
    countLike = json['countLike'];
    countComment = json['countComment'];
    isLike = json['isLike'];
  }

  // function get post
  PostModel.fromJsonID(Map<String, dynamic> json) {
    postId = json['postId'];
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
