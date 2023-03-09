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
    comments.sort((a, b) {
      if (a.isPin == b.isPin) {
        return (b.Date ?? '').compareTo(a.Date ?? '');
      } else {
        return a.isPin! ? -1 : 1;
      }
    });
  }

  // set list comment
  void setComments(List<CommentModel> list) {
    comments = list;
  }

  // add comment to list
  void addNewComment(CommentModel newComment) {
    comments.add(newComment);
  }

  // update comment to list
  void updateComment(CommentModel newComment) {
    for (var i = 0; i < comments.length; i++) {
      if (comments[i].commentId! == newComment.commentId!) {
        comments[i] = newComment;
        break;
      }
    }
  }

  // delete comment to list
  void deleteComment(CommentModel deleteComment) {
    for (int i = 0; i < comments.length; i++) {
      if (comments[i].commentId! == deleteComment.commentId!) {
        comments.removeAt(i);
        break; // stop the loop after removing the comment
      }
    }
  }
}

//----------------------------------------------------------------

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJsonResponse(json.decode(str));

class CommentModel {
  String? userId;
  String? commentId;
  String? content;
  int? countLike;
  String? postId;
  String? Date;
  bool? isLike;
  bool? isPin;
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
    countLike = json['countLike'];
    postId = json['postId'];
    Date = json['date'];
    commentId = json['commentId'];
    userId = json['userId'];
    isLike = json['isLike'];
    isPin = json['isPin'];
  }

  /// method convert json to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['countLike'] = countLike;
    data['postId'] = postId;
    data['Date'] = Date;
    data['commentId'] = commentId;
    data['userId'] = userId;
    data['isLike'] = isLike;
    data['isPin'] = isPin;

    return data;
  }

  String convertDate(String? date) {
    DateTime dt = DateTime.parse(date!);
    String datFormat =
        '${dt.day.toString()}-${dt.month.toString()}-${dt.year.toString()}';
    return datFormat;
  }
}
