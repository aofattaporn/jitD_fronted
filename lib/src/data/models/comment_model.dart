import 'dart:convert';

import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  List<CommentModel> comments = [];

  String? userId;
  String? commentId;
  String? content;
  int? like;
  String? postId;
  String? Date;
  String? error;


  CommentModel(this.content);


  CommentModel.withError(String errorMessage) {
    error = errorMessage;
  }

  /// method convert map to json
  CommentModel.fromJson(List<dynamic> json) {
    if (json != null) {
      json.forEach((element) {
        // แตก json ที่เป็น list ออกเป็นก้อน object type PostModel
        comments.add(CommentModel.fromJsonResponse(element));
      });
      comments.sort((a, b) => (b.Date ?? "").compareTo(a.Date ?? ""));
    }
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