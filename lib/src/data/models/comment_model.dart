import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  String? content;
  String? like;
  String? postId;
  String? Date;
  String? error;



  CommentModel(this.content, this.like, this.postId, this.Date);

  CommentModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  CommentModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    like = json['like'];
    postId = json['postId'];
    Date = json['Date'];
  }


  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['like'] = like;
    data['postId'] = postId;
    data['Date'] = Date;

    return data;
  }
}