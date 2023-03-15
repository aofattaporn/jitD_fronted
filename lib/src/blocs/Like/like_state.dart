part of 'like_bloc.dart';

abstract class LikeState extends Equatable {
  const LikeState();
}

class LikeInitial extends LikeState {
  @override
  List<Object> get props => [];
}

class Liked extends LikeState {
  @override
  List<Object> get props => [];
}

class Unlike extends LikeState {
  @override
  List<Object> get props => [];
}

class LikeError extends LikeState {
  String? error;
  LikeError({required this.error});
  @override
  List<Object> get props => [];
}