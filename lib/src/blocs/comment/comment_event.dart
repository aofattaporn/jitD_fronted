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
