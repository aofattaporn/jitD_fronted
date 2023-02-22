import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/comment_model.dart';

@immutable
abstract class CommentState extends Equatable {}

/// state loading
class InitialComment extends CommentState {
  @override
  List<Object?> get props => [];
}

/// state in get all comment
class LoadingComment extends CommentState {
  @override
  List<Object?> get props => [];
}

class LoadedComment extends CommentState {
  final List<CommentModel> _comment;
  LoadedComment(this._comment);
  LoadedComment.Adding(this._comment);

  List<CommentModel> get comment => _comment;

  @override
  List<Object?> get props => [];
}

/// state in add comment
class CreatingComment extends CommentState {
  final List<CommentModel> _comment;
  CreatingComment(this._comment);
  List<CommentModel> get comment => _comment;
  @override
  List<Object?> get props => [];
}

class CommentSuccess extends CommentState {
  final List<CommentModel> _comment;
  CommentSuccess(this._comment);
  List<CommentModel> get comment => _comment;
  @override
  List<Object?> get props => [];
}

/// state update a comment
class UpdatingComment extends CommentState {
  @override
  List<Object?> get props => [];
}

class UpdatedComment extends CommentState {
  @override
  List<Object?> get props => [];
}

/// state delete a comment
class DeletingComment extends CommentState {
  final List<CommentModel> _comment;
  DeletingComment(this._comment);
  List<CommentModel> get comment => _comment;
  @override
  List<Object?> get props => [];
}

class DeletedComment extends CommentState {
  final List<CommentModel> _comment;
  DeletedComment(this._comment);
  List<CommentModel> get comment => _comment;
  @override
  List<Object?> get props => [];
}

/// --------- state error  --------------
class CommentError extends CommentState {
  final String error;

  CommentError(this.error);

  @override
  List<Object?> get props => [];
}
