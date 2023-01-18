
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/test_model.dart';
// part of 'post_bloc.dart';


class TestPostState extends Equatable {

  final String content;
  final List<String> tag;

  const TestPostState({required this.content, required this.tag});

  @override
  List<Object> get props => [];
}

// -------------------------------


@immutable
abstract class PostState extends Equatable {}

/// state loading
class InitialPost extends PostState {
  @override
  List<Object?> get props => [];
}


/// state loading
class CheckingPost extends PostState {

  @override
  List<Object?> get props => [];
}

/// state loaded
class PostSuccess extends PostState {
  @override
  List<Object?> get props => [];
}

/// state error
class PostError extends PostState {
  @override
  List<Object?> get props => [];
}
