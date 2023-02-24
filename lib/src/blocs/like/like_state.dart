part of 'like_bloc.dart';

class LikeState extends Equatable {
  final bool isLike;
  const LikeState({required this.isLike});

  LikeState copyWith({bool? isLike}) {
    return LikeState(
        isLike: isLike ?? this.isLike
    );
  }

  @override
  List<Object> get props => [isLike];
}
