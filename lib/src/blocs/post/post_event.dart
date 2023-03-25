part of 'post_bloc.dart';

// สร้าง abstract บอกว่าเป็น class แม่
@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

// สร้าง abstract บอกว่าเป็น class แม่
class CreatingPost extends PostEvent {
  String? _content;

  // DateTime? _Date;
  bool? _IsPublic;
  List<String> _category;

  CreatingPost(this._content, this._IsPublic, this._category);

  @override
  List<Object> get props => [];
}

class GetAllPost extends PostEvent {
  @override
  List<Object> get props => [];
}

class GetPostByCate extends PostEvent{
  @override
  List<Object> get props => [];
}

class GetPostBySearch extends PostEvent {
  String content;

  GetPostBySearch(this.content);

  @override
  List<Object> get props => [];
}

class DeleteMyPost extends PostEvent {
  String? _id;

  DeleteMyPost(this._id);

  String? get id => _id;

  @override
  List<Object> get props => [];
}

class UpdatingMyPost extends PostEvent {
  String _content;
  String _date;
  bool _isPublic;
  String _postID;
  List<String> category;

  UpdatingMyPost(
      this._content, this._date, this._isPublic, this._postID, this.category);

  @override
  List<Object> get props => [];
}

class GetMyPost extends PostEvent {
  @override
  List<Object> get props => [];
}

class UpdateCategory extends PostEvent {
  String postID;
  List<String> category;

  UpdateCategory(this.postID, this.category);

  @override
  List<Object> get props => [];
}

// -- about category -----

class RemoveCategory extends PostEvent {
  String newCategory;
  List<String> category;

  RemoveCategory(this.newCategory, this.category);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCategory extends PostEvent {
  String newCategory;
  List<String> category;

  AddCategory(this.newCategory, this.category);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialSelectCat extends PostEvent {
  List<String> category;
  InitialSelectCat(this.category);

  @override
  List<Object?> get props => [];
}

class SortPostByDate extends PostEvent{
  final String sortdate;

  SortPostByDate(this.sortdate);

  @override
  List<Object> get props => [];
}

class SortPostByLike extends PostEvent{
  final String sortlike;

  SortPostByLike(this.sortlike);

  @override
  List<Object> get props => [];
}
