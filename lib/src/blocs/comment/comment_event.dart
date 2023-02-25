part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

// create a comment (C)
class CreateComment extends CommentEvent {
  final String? _content;
  final String? _postId;

  const CreateComment(this._content, this._postId);

  @override
  List<Object> get props => [];
}

// reade all comment (R)
class GetComment extends CommentEvent {
  final String? _postId;

  const GetComment(this._postId);

  @override
  List<Object?> get props => [];
}

// update a comment (U)
class UpdatingMyComment extends CommentEvent {
  final String? _content;
  final String? _date;
  final String? _postID;
  final String? _commentId;

  const UpdatingMyComment(
      this._content, this._date, this._postID, this._commentId);

  @override
  List<Object> get props => [];
}

// delete a comment (D)
class DeleteMyComment extends CommentEvent {
  final String? _commentId;
  final String? _postId;

  const DeleteMyComment(this._commentId, this._postId);

  @override
  List<Object> get props => [];
}

class SortCommentByDate extends CommentEvent{

  @override
  List<Object> get props => [];
}
