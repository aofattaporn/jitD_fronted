import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';

import '../../data/models/comment_model.dart';

@immutable
abstract class CommentState extends Equatable {
  late final List<CommentModel> comment;
  late String sortby = "เรียงตามความคิดเห็นล่าสุด";
}

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
  // TODO: constructor
  LoadedComment(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;

  @override
  List<Object?> get props => [];
}

/// state in add comment
class CreatingComment extends CommentState {
  // TODO: constructor
  CreatingComment(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}

class CommentSuccess extends CommentState {
  // TODO: constructor
  CommentSuccess(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}

/// state update a comment
class UpdatingComment extends CommentState {
  // TODO: constructor
  UpdatingComment(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}

class UpdatedComment extends CommentState {
  // TODO: constructor
  UpdatedComment(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}

/// state delete a comment
class DeletingComment extends CommentState {
  // TODO: constructor
  DeletingComment(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}

class DeletedComment extends CommentState {
  // TODO: constructor
  DeletedComment(List<CommentModel> _comment) {
    super.comment = _comment;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
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

///----------Sort By Date--------------
class SortedCommentByDate extends CommentState{
  SortedCommentByDate(List<CommentModel> _comment, String _sortby) {
    super.comment = _comment;
    super.sortby = _sortby;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}

class SortedCommentByLike extends CommentState{
  SortedCommentByLike(List<CommentModel> _comment, String _sortby) {
    super.comment = _comment;
    super.sortby = _sortby;
  }

  @override
  // TODO: implement comment
  List<CommentModel> get comment => super.comment;
  @override
  List<Object?> get props => [];
}