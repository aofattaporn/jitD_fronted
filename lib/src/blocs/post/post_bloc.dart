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
        print("ss");

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
      emit(PostLoadingState());
      List<String>? category = ["Update", "Update2"];

      String content = event._content;
      String date = event._date;
      bool isPublic = event._isPublic;
      String postID = event._postID;
      try {
        final userJSON = await postRepository.updatingPost(
            content, date, isPublic, category, postID);
        final userData = postModelFromJson(userJSON);

        // update for post id
        for (var element in listPostModel.posts) {
          if (element.postId == userData.postId) {
            print(element.content);
            element.content = userData.content;
            element.category = userData.category;
            element.isPublic = userData.isPublic;
          }
        }

        emit(UpdatedPost(listPostModel.posts));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }

      // save to user data
    });

    // event delete my post
    on<DeleteMyPost>((event, emit) async {
      emit(PostDeletingState());
      try {
        final postJSON = await postRepository.deletePost(event.id!);
        final postData = await postModelIDFromJson(postJSON);

        for (int i = 0; i < listPostModel.posts.length; i++) {
          if (listPostModel.posts[i].postId! == postData.postId!) {
            listPostModel.posts.removeAt(i);
            break; // stop the loop after removing the comment
          }
        }

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
