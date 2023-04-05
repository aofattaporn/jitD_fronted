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
  String sortby = "";

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
      emit(UpdatingPost(listPostModel.posts));

      String content = event._content;
      List<String> category = event.category;
      String date = event._date;
      bool isPublic = event._isPublic;
      String postID = event._postID;

      for (var element in event.category) {
        print("category -> $element");
      }
      try {
        final userJSON = await postRepository.updatingPost(
            content, date, isPublic, category, postID);
        final userData = postModelFromJson(userJSON);

        // update for post id
        for (var element in listPostModel.posts) {
          if (element.postId == userData.postId) {
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

    on<GetSearchByCate>((event, emit) async{
      emit(PostLoadingState());
      try {
        final listPostJSON = await postRepository.getSearchByCate();
        final listPostData = listPostModelFromJson(listPostJSON);

        listPostModel.posts = listPostData.posts;

        emit(PostLoadedState(listPostModel.posts));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
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

    on<UpdateCategory>((event, emit) {
      List<String> temp = event.category.toList();
      emit(WillEditCategory(temp));
      listPostModel.setCategory(
          listPostModel.posts, event.category, event.postID);

      // emit remove success
      emit(EditCategorySuccess(listPostModel.posts));
    });

    on<InitialSelectCat>((event, emit) {
      emit(SelectedCatSuccess(event.category, listPostModel.posts));
    });

    on<RemoveCategory>((event, emit) {
      List<String> temp = event.category.toList();
      emit(WillEditCategory(temp));
      for (var element in event.category) {
        if (element == event.newCategory) {
          event.category.remove(element);
          break;
        }
      }
      emit(SelectedCatSuccess(event.category, listPostModel.posts));
    });

    on<AddCategory>((event, emit) {
      List<String> temp = event.category.toList();
      emit(WillEditCategory(temp));
      event.category.add(event.newCategory);
      if (event.category.length < 3) {
        emit(SelectedCatSuccess(event.category, listPostModel.posts));
      } else {
        emit(SelectCatMaxCategory(event.category, listPostModel.posts));
      }
    });

    on<DeleteBookMark>((event, emit) async {
      try {
        int index = 0;
        for(int i =0; i < listPostModel.posts.length ; i++){
          if(listPostModel.posts[i].postId == event.postId){
            index = i;
            break;
          }
        }
        listPostModel.posts[index].isBookmark = false;
        await postRepository.RemoveBookMark(event.postId);
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<AddBookMark>((event, emit) async {
      try {
        int index = 0;
        for(int i =0; i < listPostModel.posts.length; i++){
          if(listPostModel.posts[i].postId == event.postId){
            index = i;
            break;
          }
        }
        listPostModel.posts[index].isBookmark = true;
        await postRepository.AddBookMark(event.postId);
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<GetMyBookMark>((event, emit) async {
      emit(BookMarkLoadingState());
      try {
        final listPostJSON = await postRepository.getMyBookMark();
        final listPostData = listPostModelFromData(listPostJSON);
        listPostModel.posts = listPostData.posts;

        emit(BookMarkLoadedState(listPostData.posts));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<SortPostByDate>((event, emit) {
      listPostModel.posts.sort((post1, post2) =>
          convertDate(post1.date).compareTo(convertDate(post2.date)));
      listPostModel.posts = listPostModel.posts.reversed.toList();
      sortby = event.sortdate;
      emit(SortedPostByDate(listPostModel.posts, sortby));
    });

    on<SortPostByLike>((event, emit) {
      listPostModel.posts.sort((post1, post2) =>
          (post1.countLike.toString()).compareTo(post2.countLike.toString()));
      listPostModel.posts = listPostModel.posts.reversed.toList();
      sortby = event.sortlike;
      emit(SortedPostByLike(listPostModel.posts, sortby));
    });
  }

  DateTime convertDate(String? date) {
    DateTime dt = DateTime.parse(date!);
    return dt;
  }
}
