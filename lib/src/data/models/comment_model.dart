import 'dart:convert';

ListCommentModel listCommentModelFromJson(String str) =>
    ListCommentModel.fromJson(json.decode(str));

class ListCommentModel {
  List<CommentModel> comments = [];
  ListCommentModel();

  /// method convert map to json
  ListCommentModel.fromJson(List<dynamic> json) {
    json.forEach((element) {
      comments.add(CommentModel.fromJsonResponse(element));
    });
    comments.sort((a, b) => (b.Date ?? "").compareTo(a.Date ?? ""));
  }

  // set list comment
  void setComments(List<CommentModel> list) {
    comments = list;
  }
}

//----------------------------------------------------------------

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  String? userId;
  String? commentId;
  String? content;
  int? like;
  String? postId;
  String? Date;
  String? error;

  CommentModel();

  CommentModel.PostContent(this.content);

  CommentModel.Resquest(this.content, this.Date, this.postId, this.commentId);

  CommentModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// function get comment
  CommentModel.fromJsonResponse(Map<String, dynamic> json) {
    content = json['content'];
    like = json['like'];
    postId = json['postId'];
    Date = json['Date'];
    commentId = json['commentId'];
    userId = json['userId'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['like'] = like;
    data['postId'] = postId;
    data['Date'] = Date;
    data['commentId'] = commentId;
    data['userId'] = userId;

    return data;
  }
}
