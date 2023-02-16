import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';
import 'package:jitd_client/src/data/models/comment_model.dart';
import 'package:jitd_client/src/data/respository/comment_repository.dart';

import '../../data/models/post_model.dart';
part 'comment_event.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  // creating object repository
  CommentRepository commentRepository = CommentRepository();

  CommentBloc() : super(InitialComment()) {
    on<CreatingComment>((event, emit) {
      // TODO: implement event handler
      emit(CheckingComment());
      // ยิงหลังบ้าน
      Future<String> response = commentRepository.creatingComment(
          event._content,
          event._commentId,
          event._postId,
          event._like,
          event._userId,
          event._date);

      print(response);
      // 200 -> return CommentSuccess
      if (response != "create data success") {
        emit(CommentSuccess());
      }
      // !200 -> return CommentError
      else {
        print(response);
        emit(CommentError("Something wrong"));
      }
    });
    on<GetComment>((event, emit) async {
      // await getComment(emit, commentRepository, event._postId);
      try {
        final commentData = await commentRepository.getCommented(event._postId);
        final commentModel = commentModelFromJson(commentData);
        emit(LoadedComment(commentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });
  }
}

Future<void> getComment(emit, commentRepository, postId) async {
  try {
    final commentData = await commentRepository.getCommented();
    final commentModel = postModelFromJson(commentData);
    emit(LoadedComment(commentModel.comments));
  } catch (e, stacktrace) {
    print("Exxception occured: $e stackTrace: $stacktrace");
    emit(CommentError(e.toString()));
  }
}
