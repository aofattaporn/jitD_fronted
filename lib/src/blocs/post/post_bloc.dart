import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';

import '../../data/respository/post_repositpory.dart';

part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  // creating object repository
  PostRepository postRepository = PostRepository();

  PostBloc() : super(InitialPost()) {
    on<CreatingPost>((event, emit) {
      // TODO: implement event handler
      emit(CheckingPost());
      // ยิงหลังบ้าน
      Future<String> response =  postRepository.creatingPost(event._content, event._IsPublic);

      print(response);
      // 200 -> return PostSuccess
      if (response != "create data success") {
        emit(PostSuccess());
      }
      // !200 -> return PostError
      else {
        print(response);
        emit(PostError());
      }
    });
  }
}
