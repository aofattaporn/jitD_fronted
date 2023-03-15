import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jitd_client/src/data/respository/like_repository.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeRepository likeRepository = LikeRepository();

  LikeBloc() : super(LikeInitial())  {
    on<LikePost>((event, emit) async {
      try {
        await likeRepository.likePost(postId: event.postId);
        emit(Liked());
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(LikeError(error: e.toString()));
      }
    });

    on<UnlikePost>((event, emit) async {
      try {
        await likeRepository.unlikePost(postId: event.postId);
        emit(Unlike());
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(LikeError(error: e.toString()));
      }
    });

    on<LikeComment>((event, emit) async {
      try {
        await likeRepository.likeComment(postId: event.postId, commentId: event.commentId);
        emit(Liked());
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(LikeError(error: e.toString()));
      }
    });

    on<UnlikeComment>((event, emit) async {
      try {
        await likeRepository.unlikeComment(postId: event.postId, commentId: event.commentId);
        emit(Unlike());
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(LikeError(error: e.toString()));
      }
    });
  }
}
