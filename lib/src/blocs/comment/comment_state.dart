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

/// state loading
class CheckingComment extends CommentState {
  final List<CommentModel> _comment;
  CheckingComment(this._comment);
  List<CommentModel> get comment => _comment;
  @override
  List<Object?> get props => [];
}

/// state loaded
class CommentSuccess extends CommentState {
  final List<CommentModel> _comment;
  CommentSuccess(this._comment);
  List<CommentModel> get comment => _comment;
  @override
  List<Object?> get props => [];
}

/// state error
class CommentError extends CommentState {
  final String error;

  CommentError(this.error);

  @override
  List<Object?> get props => [];
}

class LoadingComment extends CommentState {
  @override
  List<Object?> get props => [];
}

class LoadedComment extends CommentState {
  final List<CommentModel> _comment;

  LoadedComment(this._comment);

  List<CommentModel> get comment => _comment;

  @override
  List<Object?> get props => [];
}

class UpdatingComment extends CommentState {
  @override
  List<Object?> get props => [];
}

class UpdatedComment extends CommentState {
  @override
  List<Object?> get props => [];
}

class DeletedComment extends CommentState {
  @override
  List<Object?> get props => [];
}
