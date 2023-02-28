import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../data/models/post_model.dart';

@immutable
abstract class PostState extends Equatable {
  late final List<PostModel> posts;
}

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
  final String error;

  PostError(this.error);

  @override
  List<Object?> get props => [];
}

/// state post loading
class PostLoadingState extends PostState {
  @override
  List<Object?> get props => [];
}

/// state loaded
class PostLoadedState extends PostState {
  final List<PostModel> _allPost;

  PostLoadedState(this._allPost);

  List<PostModel> get allPost => _allPost;

  @override
  List<Object?> get props => [allPost];
}

/// state post loading
class PostDeletedState extends PostState {
  @override
  List<Object?> get props => [];
}
class UpdatingPost extends PostState {
  @override
  List<Object?> get props => [];
}

class UpdatedPost extends PostState {
  @override
  List<Object?> get props => [];
}

class SortedPostByDate extends PostState{
  SortedPostByDate(List<PostModel>_posts){
    super.posts = _posts;
  }
  @override
  // TODO: implement comment
  List<PostModel> get posts => super.posts;
  @override
  List<Object?> get props => [];
}

class SortedPostByLike extends PostState{
  SortedPostByLike(List<PostModel>_posts){
    super.posts = _posts;
  }
  @override
  // TODO: implement comment
  List<PostModel> get posts => super.posts;
  @override
  List<Object?> get props => [];
}