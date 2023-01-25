part of 'post_bloc.dart';

class PostState extends Equatable {

  final String content;
  final List<String> tag;

  const PostState({required this.content, required this.tag});

  @override
  List<Object> get props => [];
}