import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';
import 'package:jitd_client/src/data/respository/comment_repository.dart';
part 'comment_event.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {

  // creating object repository
  CommentRepository commentRepository = CommentRepository();

  CommentBloc() : super(InitialComment()) {
    on<CreatingComment>((event, emit) {
      // TODO: implement event handler
      emit(CheckingComment());
      // ยิงหลังบ้าน
      Future<String> response =  commentRepository.creatingComment(event._content, event._like, event._userId, event._date);

      print(response);
      // 200 -> return CommentSuccess
      if (response != "create data success") {
        emit(CommentSuccess());
      }
      // !200 -> return CommentError
      else {
        print(response);
        emit(CommentError());
      }
    });
  }
}
