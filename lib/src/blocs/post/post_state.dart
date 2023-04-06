import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/data/models/cateSearch_model.dart';

import '../../data/models/post_model.dart';

@immutable
abstract class PostState extends Equatable {
  late List<PostModel> listPostModel = [];
  late ListHomePageModel listHomePageModel;
  late List<String> category = [];
  late List<CateSearchModel> listCatModel = [];
  late String sortby = "เรียงตามโพสล่าสุด";
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

class HomePagePostLoadingState extends PostState {
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

class HomePagePostLoadedState extends PostState {
  HomePagePostLoadedState(ListHomePageModel listHomePage) {
    super.listHomePageModel = listHomePage;
  }

  @override
  List<Object?> get props => [];
}

class MyPostLoadedState extends PostState {
  MyPostLoadedState(List<PostModel> list) {
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

// ------ state of edit category -------

class EditCategorySuccess extends PostState {
  EditCategorySuccess(List<PostModel> list) {
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

class SelectedCatSuccess extends PostState {
  SelectedCatSuccess(List<String> category, List<PostModel> list) {
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

class SelectCatMaxCategory extends PostState {
  SelectCatMaxCategory(List<String> category, List<PostModel> list) {
    super.category = category.toList();
    super.listPostModel = list;
  }

  @override
  List<Object?> get props => [];
}

class SortedPostByDate extends PostState {
  SortedPostByDate(List<PostModel> _listpost, String _sortby) {
    super.listPostModel = _listpost;
    super.sortby = _sortby;
  }

  @override
  // TODO: implement comment
  List<PostModel> get listPostModel => super.listPostModel;
  @override
  List<Object?> get props => [];
}

class SortedPostByLike extends PostState {
  SortedPostByLike(List<PostModel> _listpost, String _sortby) {
    super.listPostModel = _listpost;
    super.sortby = _sortby;
  }

  @override
  // TODO: implement comment
  List<PostModel> get listPostModel => super.listPostModel;
  @override
  List<Object?> get props => [];
}

class BookMarkLoadingState extends PostState{
  @override
  List<Object?> get props => [];
}

class BookMarkLoadedState extends PostState{
  BookMarkLoadedState(ListHomePageModel list) {
    super.listHomePageModel = list;
  }
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends PostState{
  @override
  List<Object?> get props => [];
}

class SearchLoadedState extends PostState{
  late List<CateSearchModel> catSearch ;
  SearchLoadedState(List<CateSearchModel> list) {
    catSearch = list;
  }

  @override
  List<Object?> get props => [];
}

class DeletingBookMarkState extends PostState{
  @override
  List<Object?> get props => [];
}

class DeletedBookMarkState extends PostState{
  DeletedBookMarkState(List<PostModel> list) {
    super.listPostModel = list;
  }
  @override
  List<Object?> get props => [];
}


/// this state for show dialog that Added bookmark
class AddedBookMarkState extends PostState{
  @override
  List<Object?> get props => [];
}
class RecommendCateSearch extends PostState{
  @override
  List<Object?> get props => [];

}
