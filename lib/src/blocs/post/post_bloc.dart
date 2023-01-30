import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';

import '../../data/respository/post_repository.dart';

part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  // creating object repository
  PostRepository postRepository = PostRepository();

  PostBloc() : super(InitialPost()) {
    on<CreatingPost>((event, emit) async {
      emit(CheckingPost());
      // TODO : changing Temporary variable by create event Create Category
      /// Temporary variable
      List<String>? category = ["Hello", "Hello2"];

      Future<String> response = postRepository.creatingPost(event._content, event._IsPublic, category);


      if (await response == "create data success") {
        // 200 -> return PostSuccess
        emit(PostSuccess());
      } else {
        // !200 -> return PostError
        emit(PostError());
      }
    });


    on<GetMyPost>((event, emit) async{
      emit(LoadingPost());
      Future<String>? Resquest = postRepository.GetMyPost();
    });

    /// event load post
    ///
  }
}