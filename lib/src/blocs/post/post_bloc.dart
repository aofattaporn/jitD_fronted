import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';

import '../../data/models/cateSearch_model.dart';
import '../../data/models/post_model.dart';
import '../../data/respository/post_repository.dart';

part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  // creating object repository
  PostRepository postRepository = PostRepository();
  ListPostModel listPostModel = ListPostModel();
  ListCateSearch listCateSearch = ListCateSearch();
  ListHomePageModel listHomePageModel = ListHomePageModel();
  PostModel postModel = PostModel();
  String sortby = "";

  PostBloc() : super(InitialPost()) {
    // event get all post
    on<GetAllPost>((event, emit) async {
      emit(PostLoadingState());
      try {
        final listPostJSON = await postRepository.getAllPost();
        final listPostData = listPostModelFromJson(listPostJSON);

        listHomePageModel.postDate = listPostData.postDate;

        emit(PostLoadedState(listHomePageModel));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<GetHomePagePost>((event, emit) async {
      emit(HomePagePostLoadingState());
      try {
        final listHomePagePostJSON = await postRepository.getHomePagePost();
        final listHomePagePostData = listHomePagePostModelFromJson(listHomePagePostJSON);
        listHomePageModel = listHomePagePostData;

        emit(HomePagePostLoadedState(listHomePageModel));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }

    });

    on<GetAllPostSortedByLike>((event, emit) async {
      emit(PostLoadingState());
      try {
        final listPostJSON = await postRepository.getAllPostSortedByLike();
        final listPostData = listPostModelFromJson(listPostJSON);
        listHomePageModel.postDate = listPostData.postDate;

        emit(PostLoadedState(listHomePageModel));
      } catch (e, stacktrace) {
        print("Exception occurred: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<GetAllRecommendPost>((event, emit) async {
      emit(PostLoadingState());
      try {
        final listPostJSON = await postRepository.getAllRecommendPost();
        final listPostData = listPostModelFromJson(listPostJSON);
        listHomePageModel.postDate = listPostData.postDate;

        emit(PostLoadedState(listHomePageModel));
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

      print("Response: $response");
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
      emit(UpdatingPost(listHomePageModel));

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
        for (var element in listHomePageModel.postDate!) {
          if (element.postId == userData.postId) {
            element.content = userData.content;
            element.category = userData.category;
            element.isPublic = userData.isPublic;
          }
        }

        emit(UpdatedPost(listHomePageModel));
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
        print(postJSON);
        final postData = await postModelIDFromJson(postJSON);

        for (int i = 0; i < listHomePageModel.postDate!.length; i++) {
          if (listHomePageModel.postDate![i].postId! == postData.postId!) {
            listHomePageModel.postDate!.removeAt(i);
            break; // stop the loop after removing the comment
          }
        }
        emit(PostDeletedState(listHomePageModel));
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
        listHomePageModel.postDate = listPostData.postDate;
        emit(HomePagePostLoadedState(listHomePageModel));
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

        listHomePageModel.postDate = listPostData.postDate;

        emit(PostLoadedState(listHomePageModel));
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
        listHomePageModel.postDate = listPostData.postDate;

        emit(PostLoadedState(listHomePageModel));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<UpdateCategory>((event, emit) {
      List<String> temp = event.category.toList();
      emit(WillEditCategory(temp));
      listHomePageModel.setCategory(
          listHomePageModel.postDate!, event.category, event.postID);

      // emit remove success
      emit(EditCategorySuccess(listHomePageModel));
    });

    on<InitialSelectCat>((event, emit) {
      emit(SelectedCatSuccess(event.category, listHomePageModel));
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
      emit(SelectedCatSuccess(event.category, listHomePageModel));
    });

    on<AddCategory>((event, emit) {
      List<String> temp = event.category.toList();
      emit(WillEditCategory(temp));
      event.category.add(event.newCategory);
      if (event.category.length < 3) {
        emit(SelectedCatSuccess(event.category, listHomePageModel));
      } else {
        emit(SelectCatMaxCategory(event.category, listHomePageModel));
      }
    });

    on<DeleteBookMark>((event, emit) async {
      try {
        int index = 0;
        for(int i =0; i < listHomePageModel.postDate!.length ; i++){
          if(listHomePageModel.postDate![i].postId == event.postId){
            index = i;
            break;
          }
        }
        listHomePageModel.postDate![index].isBookmark = false;
        await postRepository.RemoveBookMark(event.postId);
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<AddBookMark>((event, emit) async {
      try {
        int index = 0;
        for(int i =0; i < listHomePageModel.postDate!.length; i++){
          if(listHomePageModel.postDate![i].postId == event.postId){
            index = i;
            break;
          }
        }
        listHomePageModel.postDate![index].isBookmark = true;
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
        listHomePageModel.postDate = listPostData.postDate;

        emit(BookMarkLoadedState(listHomePageModel));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<CatSearch>((event, emit) async{
      emit(SearchLoadingState());
      try{
        final listCatJSON = await postRepository.getSearchPage();
        final listCatData = ListCateSearchFromJson(listCatJSON);
         listCateSearch.cateSearch = listCatData.cateSearch;

         emit(SearchLoadedState(listCateSearch.cateSearch));
      }catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(PostError(e.toString()));
      }
    });

    on<SortPostByDate>((event, emit) {
      listHomePageModel.postDate!.sort((post2, post1) =>
          convertDate(post1.date).compareTo(convertDate(post2.date)));
      sortby = event.sortdate;
      emit(SortedPostByDate(listHomePageModel.postDate!, sortby));
    });

    on<SortPostByLike>((event, emit) {

      listHomePageModel.postDate!.sort((post2, post1) =>
          (post1.countLike.toString()).compareTo(post2.countLike.toString()));
      sortby = event.sortlike;
      emit(SortedPostByLike(listHomePageModel.postDate!, sortby));
    });
  }

  DateTime convertDate(String? date) {
    DateTime dt = DateTime.parse(date!);
    return dt;
  }
}
