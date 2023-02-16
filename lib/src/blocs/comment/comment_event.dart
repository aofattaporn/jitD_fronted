part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class CreatingComment extends CommentEvent {
  final String? _content;
  final String? _postId;
  final String? _commentId;
  final String? _userId;
  final int? _like;
  final String? _date;

  const CreatingComment(
      this._content, this._userId, this._commentId, this._date, this._like, this._postId);

  @override
  List<Object> get props => [];

}

class GetComment extends CommentEvent {
  final String? _postId;


  GetComment(this._postId);

  @override
  List<Object?> get props => [];
}
