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

