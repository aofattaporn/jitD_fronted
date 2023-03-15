part of 'like_bloc.dart';

abstract class LikeEvent extends Equatable {
  const LikeEvent();

  @override
  List<Object> get props => [];
}

class LikePost extends LikeEvent {
  String? postId;
  LikePost({required this.postId});
}
class UnlikePost extends LikeEvent {
  String? postId;
  UnlikePost({required this.postId});
}
class LikeComment extends LikeEvent {
  String? postId;
  String? commentId;
  LikeComment({required this.postId, required this.commentId});
}
class UnlikeComment extends LikeEvent {
  String? postId;
  String? commentId;
  UnlikeComment({required this.postId, required this.commentId});
}