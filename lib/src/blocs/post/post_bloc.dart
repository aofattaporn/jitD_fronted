import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';

import '../../Cash.dart';
import '../../data/models/post_model.dart';
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
        emit(PostError("Create Post Failed"));
      }
    });

    on<GetAllPost>((event, emit) async {

      await caseSelfCache(emit, postRepository);
    });
  }
}

Future<void> caseSelfCache(emit, postRepository) async {
  if (PostCache.getDataPost == null) {
    emit(PostLoadingState());
    try {
      final postData = await postRepository.getAllPost();
      PostCache.setDataPost = postData;
      emit(PostLoadedState(postData));
      print(postData);
    } catch (e, stacktrace) {
      print("Exception occurred: $e stackTrace: $stacktrace");
      emit(PostError(e.toString()));
    }
  } else {
    var data = PostModel(PostCache.getDataPost?.content, PostCache.getDataPost?.date, PostCache.getDataPost?.isPublic, PostCache.getDataPost?.category);
    emit(PostLoadedState(data));
  }
}