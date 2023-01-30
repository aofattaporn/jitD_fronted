part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class CreatingComment extends CommentEvent {
  final String? _content;
  final String? _userId;
  final String? _like;
  final String? _date;

  const CreatingComment(this._content, this._userId, this._date, this._like);

  @override
  List<Object> get props => [];
}