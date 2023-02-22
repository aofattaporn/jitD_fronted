import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';
import 'package:jitd_client/src/data/models/comment_model.dart';
import 'package:jitd_client/src/data/respository/comment_repository.dart';

part 'comment_event.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  // creating object repository
  CommentRepository commentRepository = CommentRepository();
  ListCommentModel listCommentModel = ListCommentModel();

  CommentBloc() : super(InitialComment()) {
    // event create comment
    on<CreatingComment>((event, emit) async {
      emit(CheckingComment(listCommentModel.comments));
      try {
        final commentJSON = await commentRepository.creatingComment(
            event._content, event._postId, DateTime.now().toString());
        final commentModel = listCommentModelFromJson(commentJSON);
        listCommentModel.setComments(commentModel.comments);
        emit(CommentSuccess(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });

    // get comment
    on<GetComment>((event, emit) async {
      emit(LoadingComment());
      try {
        final commentJSON = await commentRepository.getCommented(event._postId);
        final commentModel = listCommentModelFromJson(commentJSON);
        listCommentModel.setComments(commentModel.comments);
        emit(LoadedComment(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });

    // delete comment
    on<DeleteMyComment>((event, emit) async {
      emit(CheckingComment(listCommentModel.comments));
      try {
        final commentJSON = await commentRepository.deleteComment(
            event._commentId, event._postId);
        emit(DeletedComment());
        final commentModel = await listCommentModelFromJson(commentJSON);
        listCommentModel.setComments(commentModel.comments);
        emit(CheckingComment(listCommentModel.comments));
        emit(LoadedComment(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });

    // update comment
    on<UpdatingMyComment>((event, emit) async {
      // emit(CheckingComment());
      Future<Object> response = commentRepository.updateComment(
          event._content, event._date, event._postID, event._commentId);

      if (await response == "updating data success") {
        // 200 -> return UpdatePostSuccess
        emit(UpdatedComment());
      } else {
        // !200 -> return UpdatePostError
        emit(CommentError("Update Post Failed"));
      }
    });
  }
}
