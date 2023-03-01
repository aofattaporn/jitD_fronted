import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/post_model.dart';

@immutable
abstract class PostState extends Equatable {
  late List<PostModel> listPostModel = [];
  late List<String> category = [];
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
  PostLoadedState(List<PostModel> list) {
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

/// state post loading
class PostDeletingState extends PostState {
  @override
  List<Object?> get props => [];
}

class PostDeletedState extends PostState {
  PostDeletedState(List<PostModel> list) {
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

class UpdatingPost extends PostState {
  UpdatingPost(List<PostModel> list) {
    super.listPostModel = list;
  }
  @override
  List<Object?> get props => [];
}

class UpdatedPost extends PostState {
  UpdatedPost(List<PostModel> list) {
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

class EditCategorySuccess extends PostState {
  EditCategorySuccess(List<PostModel> list) {
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

class EditingCategorySuccess extends PostState {
  EditingCategorySuccess(List<String> category, List<PostModel> list) {
    super.category = category.toList();
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

class WillEditCategory extends PostState {
  WillEditCategory(List<String> category) {
    super.category = category.toList();
  }

  @override
  List<Object?> get props => [];
}
