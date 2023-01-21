import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/homepage/homepage_event.dart';
import 'package:jitd_client/src/blocs/homepage/homepage_state.dart';
import 'package:jitd_client/src/data/models/post_model.dart';
import 'package:jitd_client/src/data/respository/homepage.dart';


import '../../Cash.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomePageLoadingState()) {
    /// inject Repository
    final HomePageRepository homePageRepository = HomePageRepository();

    on<LoadHomePageEvent>((event, emit) async {
      /// case Lib Cache
      // await case_LibCach(emit, testerRepository);

      /// case self Cache
      await case_selfCach(emit, homePageRepository);
    });
  }
}

Future<void> case_selfCach(emit, homePageRepository) async {
  if (Cache.get_data_home_page == null) {
    emit(HomePageLoadingState());
    try {
      final data_test = await homePageRepository.getHomePage();
      Cache.set_data_home_page = data_test;
      emit(HomePageLoadedState(data_test));
    } catch (e) {
      emit(HomePageErrorState(e.toString()));
    }
  } else {
    // var data = PostModel(Cache.get_data_home_page, id: Cache.get_data_home_page?.id, content: );
    var data = PostModel(PostCache.getDataPost?.content, PostCache.getDataPost?.Date, PostCache.getDataPost?.IsPublic);
    emit(HomePageLoadedState(data));
  }
}