import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';

import '../../data/models/post_model.dart';
import '../../data/respository/post_repository.dart';

part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  // creating object repository
  PostRepository postRepository = PostRepository();
  ListPostModel listPostModel = ListPostModel();
  PostModel postModel = PostModel();

  PostBloc() : super(InitialPost()) {
    // event get all post
    on<GetAllPost>((event, emit) async {
      emit(PostLoadingState());
      try {
        final listPostJSON = await postRepository.getAllPost();
        final listPostData = listPostModelFromJson(listPostJSON);

        listPostModel.posts = listPostData.posts;

        emit(PostLoadedState(listPostModel.posts));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    // event create post
    on<CreatingPost>((event, emit) async {
      emit(CheckingPost());
      Future<String> response = postRepository.creatingPost(
          event._content, event._IsPublic, event._category);

      if (await response == "create data success") {
        // 200 -> return PostSuccess
        emit(PostSuccess());
      } else {
        // !200 -> return PostError
        emit(PostError("Create Post Failed"));
      }
    });

    // event updating post
    on<UpdatingMyPost>((event, emit) async {
      emit(CheckingPost());
      List<String>? category = ["Update", "Update2"];

      Future<String> response = postRepository.updatingPost(event._content,
          event._date, event._isPublic, category, event._postID);

      if (await response == "updating data success") {
        // 200 -> return UpdatePostSuccess
        emit(UpdatedPost());
      } else {
        // !200 -> return UpdatePostError
        emit(PostError("Update Post Failed"));
      }
    });

    // event delete my post
    on<DeleteMyPost>((event, emit) async {
      emit(PostDeletingState());
      try {
        final postJSON = await postRepository.deletePost(event.id!);
        final postData = await postModelIDFromJson(postJSON);

        print("before -> ${listPostModel.posts.length}");

        for (int i = 0; i < listPostModel.posts.length; i++) {
          if (listPostModel.posts[i].postId! == postData.postId!) {
            listPostModel.posts.removeAt(i);
            break; // stop the loop after removing the comment
          }
        }

        print("after -> ${listPostModel.posts.length}");

        emit(PostDeletedState(listPostModel.posts));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    // event get my post
    on<GetMyPost>((event, emit) async {
      try {
        final listPostJSON = await postRepository.getMyPost();
        final listPostData = listPostModelFromJson(listPostJSON);

        listPostModel.posts = listPostData.posts;

        emit(PostLoadedState(listPostModel.posts));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<GetPostBySearch>((event, emit) async {
      emit(PostLoadingState());
      try {
        final listPostJSON =
            await postRepository.getPostBySearch(event.content);
        final listPostData = listPostModelFromJson(listPostJSON);

        listPostModel.posts = listPostData.posts;

        emit(PostLoadedState(listPostModel.posts));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });
  }
}
