import 'dart:convert';

ListPostModel listPostModelFromJson(String str) =>
    ListPostModel.fromJson(json.decode(str));

ListPostModel listPostModelFromData(String str) =>
    ListPostModel.fromData(json.decode(str));

class ListPostModel {
  List<PostModel> posts = [];
  List<PostDate> postDate = [];

  ListPostModel();

  ListPostModel.fromData(Map<String, dynamic> json) {
    for (var element in json["data"]) {
      posts.add(PostModel.fromJson(element));
    }
    posts.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
  }

  /// method convert map to json
  ListPostModel.fromJson(List<dynamic> json) {
    for (var element in json) {
      posts.add(PostModel.fromJson(element));
      postDate.add(PostDate.fromJson(element));
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
  bool? isBookmark;
  int? countLike;
  int? countComment;
  int? countPost;
  bool? isLike;
  String? error;
  bool? isBookmark;

  PostModel();

  /// constructor method (Method ที่ยัด arg และจะสร้าง object เป็น type นั้น)
  PostModel.GetData(this.content, this.date, this.isPublic, this.category,
      this.isBookmark);

  PostModel.Response(this.content, this.date, this.isPublic, this.category,
      this.isBookmark,this.countPost, this.countComment);

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
    isBookmark = json['isBookmark'];
    countLike = json['countLike'];
    countComment = json['countComment'];
    isLike = json['isLike'];
    isBookmark = json['isBookMark'];
  }

  // function get post
  PostModel.fromJsonID(Map<String, dynamic> json) {
    postId = json['postId'];
    isBookmark = json['isBookMark'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['date'] = date;
    data['isPublic'] = isPublic;
    data['isBookmark'] = isBookmark;
    data['category'] = category;
    return data;
  }
}

// Test---------------------------------------------------

ListHomePageModel listHomePagePostModelFromJson(String str) =>
    ListHomePageModel.fromJson(json.decode(str));

class ListHomePageModel {
    List<PostDate>? postDate;
    List<PostLike>? postLike;
    List<PostRecommend>? postRecommend;
    String? error;

    ListHomePageModel();

    ListHomePageModel.withError(String errorMessage) {
      error = errorMessage;
    }

    ListHomePageModel.fromJson(Map<String, dynamic> json) {
      postDate = addDatePost(json['postDate']);
      postLike = addLikePost(json['postLike']);
      postRecommend = addRecommendPost(json['postReccommend']);
    }

    List<PostDate>? addDatePost(List<dynamic> json) {
      List<PostDate>? temp = [];
      for (var element in json) {
        temp.add(PostDate.fromJson(element));
      }
      temp.sort((a, b) => (b.date ?? "").compareTo(a.date ?? ""));
      return temp;
    }
    List<PostLike>? addLikePost(List<dynamic> json) {
      List<PostLike>? temp = [];
      for (var element in json) {
        temp.add(PostLike.fromJson(element));
      }
      return temp;
    }
    List<PostRecommend>? addRecommendPost(List<dynamic> json) {
      List<PostRecommend>? temp = [];
      for (var element in json) {
        temp.add(PostRecommend.fromJson(element));
      }
      return temp;
    }
}

class PostDate {
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
  bool? isBookmark;

  PostDate();

  PostDate.fromJson(Map<String, dynamic> json) {
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
    isBookmark = json['isBookmark'];
  }

  PostDate.fromJsonID(Map<String, dynamic> json) {
    postId = json['postId'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['date'] = date;
    data['isPublic'] = isPublic;
    data['category'] = category;
    return data;
  }
}

class PostLike {
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
  bool? isBookmark;

  PostLike();

  PostLike.fromJson(Map<String, dynamic> json) {
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
    isBookmark = json['isBookmark'];
  }

  PostLike.fromJsonID(Map<String, dynamic> json) {
    postId = json['postId'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['date'] = date;
    data['isPublic'] = isPublic;
    data['category'] = category;
    return data;
  }
}

class PostRecommend {
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
  bool? isBookmark;

  PostRecommend();

  PostRecommend.fromJson(Map<String, dynamic> json) {
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
    isBookmark = json['isBookmark'];
  }

  PostRecommend.fromJsonID(Map<String, dynamic> json) {
    postId = json['postId'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['date'] = date;
    data['isPublic'] = isPublic;
    data['category'] = category;
    return data;
  }
}
