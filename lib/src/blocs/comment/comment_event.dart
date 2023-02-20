part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class CreatingComment extends CommentEvent {
  final String? _content;
  final String? _postId;


  CreatingComment(this._content,this._postId);

  @override
  List<Object> get props => [];

}

class GetComment extends CommentEvent {
  final String? _postId;


  GetComment(this._postId);

  @override
  List<Object?> get props => [];
}

class DeleteMyComment extends CommentEvent {
  String? _commentId;
  String? _postId;
  DeleteMyComment(this._commentId, this._postId);


  @override
  List<Object> get props => [];
}

class UpdatingMyComment extends CommentEvent {
  String? _content;
  String? _date;
  String? _postID;
  String? _commentId;


  UpdatingMyComment(this._content, this._date, this._postID, this._commentId);

  @override
  List<Object> get props => [];
}