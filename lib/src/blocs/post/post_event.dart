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


  CreatingPost(this._content, this._IsPublic);

  @override
  List<Object> get props => [];
}

class GetAllPost extends PostEvent {
  @override
  List<Object> get props => [];

}

class UpdatingMyPost extends PostEvent {
   String _content;
   String _date;
   bool _isPublic;
   String postID;

   UpdatingMyPost(this._content, this._date, this._isPublic, this.postID);

  @override
  List<Object> get props => [];
}

class GetMyPost extends PostEvent {
  @override
  List<Object> get props => [];

}