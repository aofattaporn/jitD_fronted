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
  String sortby = "SortDate";

  CommentBloc() : super(InitialComment()) {
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

    // event create comment
    on<CreateComment>((event, emit) async {
      emit(CreatingComment(listCommentModel.comments));
      try {
        final commentJSON = await commentRepository.creatingComment(
            event._content, event._postId, DateTime.now().toString());
        final commentModel = commentModelFromJson(commentJSON);
        listCommentModel.addNewComment(commentModel);

        emit(CommentSuccess(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });

    // delete comment
    on<DeleteMyComment>((event, emit) async {
      emit(DeletingComment(listCommentModel.comments));
      try {
        final commentJSON = await commentRepository.deleteComment(
            event._commentId, event._postId);
        final commentModel = commentModelFromJson(commentJSON);
        listCommentModel.deleteComment(commentModel);
        emit(DeletedComment(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        print(e.toString());
      }
    });

    // update comment
    on<UpdatingMyComment>((event, emit) async {
      // print(event.)
      emit(UpdatingComment(listCommentModel.comments));
      try {
        final commentJSON = await commentRepository.updateComment(
            event._content, event._date, event._postID, event._commentId);
        final commentModel = commentModelFromJson(commentJSON);
        listCommentModel.updateComment(commentModel);

        emit(UpdatedComment(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });

    // Sort comment by date
    on<SortCommentByDate>((event, emit) {
      listCommentModel.comments.sort((comment1, comment2) =>
          convertDate(comment1.Date).compareTo(convertDate(comment2.Date)));
      listCommentModel.comments = listCommentModel.comments.reversed.toList();
      sortby = event.sortdate;
      emit(SortedCommentByDate(listCommentModel.comments, sortby));
    });

    // Sort comment by Like
    on<SortCommentByLike>((event, emit) {
      listCommentModel.comments.sort((comment1, comment2) =>
          (comment1.countLike.toString())
              .compareTo(comment2.countLike.toString()));
      listCommentModel.comments = listCommentModel.comments.reversed.toList();
      sortby = event.sortlike;
      emit(SortedCommentByLike(listCommentModel.comments, sortby));
    });

    on<PinComment>((event, emit) async {
      // emit(LoadingComment());
      try {
        await commentRepository.pinComment(event._postId, event._commentId);
        emit(UpdatedComment(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });

    on<UnPinComment>((event, emit) async {
      // emit(LoadingComment());
      try {
        await commentRepository.unpinComment(event._postId, event._commentId);
        emit(UpdatedComment(listCommentModel.comments));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(CommentError(e.toString()));
      }
    });
  }
  DateTime convertDate(String? date) {
    DateTime dt = DateTime.parse(date!);
    return dt;
  }
}
