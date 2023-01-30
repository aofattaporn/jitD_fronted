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
    /// event create post
    on<CreatingPost>((event, emit) async {
      emit(CheckingPost());
      // TODO : changing Temporary variable by create event Create Category
      /// Temporary variable
      List<String>? category = ["Hello", "Hello2"];

      Future<String> response = postRepository.creatingPost(
          event._content, event._IsPublic, category);

      if (await response == "create data success") {
        // 200 -> return PostSuccess
        emit(PostSuccess());
      } else {
        // !200 -> return PostError
        emit(PostError("Create Post Failed"));
      }
    });

    /// event get all post
    on<GetAllPost>((event, emit) async {
      await caseSelfCache(emit, postRepository);
    });

    on<DeleteMyPost>((event, emit) async {
      await deletePost(emit, event.id, postRepository);
    });
  }
}

Future<void> deletePost(emit, id, postRepository) async {
  emit(PostLoadingState());
  try {
    /// TODO: get Data and send List To PostLoadedState
    final responstatus = await postRepository.deletePost(id);
    if (await responstatus == "delete post success") {
      emit(PostDeletedState());
    } else {
      emit(PostError("Something thing"));
    }
  } catch (e, stacktrace) {
    print("Exxception occured: $e stackTrace: $stacktrace");
    emit(PostError(e.toString()));
  }
}

Future<void> caseSelfCache(emit, postRepository) async {
  if (PostCache.getDataPost == null) {
    print("Change state to loading");
    emit(PostLoadingState());
    try {
      /// TODO: get Data and send List To PostLoadedState
      final postData = await postRepository.getAllPost();
      final postModel = postModelFromJson(postData);
      emit(PostLoadedState(postModel.posts));
    } catch (e, stacktrace) {
      print("Exxception occured: $e stackTrace: $stacktrace");
      emit(PostError(e.toString()));
    }
  } else {
    final postData = await postRepository.getAllPost();
    final postModel = postModelFromJson(postData);
    emit(PostLoadedState(postModel.posts));
  }
}
