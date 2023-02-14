import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';


@immutable
abstract class CommentState extends Equatable {}

/// state loading
class InitialComment extends CommentState {
  @override
  List<Object?> get props => [];
}


/// state loading
class CheckingComment extends CommentState {

  @override
  List<Object?> get props => [];
}

/// state loaded
class CommentSuccess extends CommentState {
  @override
  List<Object?> get props => [];
}

/// state error
class CommentError extends CommentState {
  @override
  List<Object?> get props => [];
}

class LoadingComment extends CommentState{
  @override
  List<Object?> get props => [];
}

class LoadedComment extends CommentState{
  @override
  List<Object?> get props => [];
}

class UpdatingComment extends CommentState{
  @override
  List<Object?> get props => [];
}

class UpdatedComment extends CommentState{
  @override
  List<Object?> get props => [];
}

class DeletedComment extends CommentState{
  @override
  List<Object?> get props => [];
}
