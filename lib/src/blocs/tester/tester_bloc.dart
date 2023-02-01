import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/tester/tester_event.dart';
import 'package:jitd_client/src/blocs/tester/tester_state.dart';


import '../../Cash.dart';
import '../../data/models/test_model.dart';
import '../../data/respository/test_provider.dart';

class TesterBloc extends Bloc<TesterEvent, TesterState> {
  TesterBloc() : super(TesterLoadingState()) {
    /// inject Repository
    final TestRepository testerRepository = TestRepository();

    on<LoadTesterEvent>((event, emit) async {
      /// case Lib Cache
      // await case_LibCach(emit, testerRepository);

      /// case self Cache
      await case_selfCach(emit, testerRepository);
    });
  }
}

/// case self cache ( without cache lib )
Future<void> case_selfCach(emit, testerRepository) async {
  if (Cache.get_data_home_page == null) {
    emit(TesterLoadingState());
    try {
      final data_test = await testerRepository.NamingPetEvent();
      Cache.set_data_home_page = data_test;
      emit(TesterLoadedState(data_test));
    } catch (e) {
      emit(TesterErrorState(e.toString()));
    }
  } else {
    var data = TestModel(Cache.get_data_home_page, id: Cache.get_data_home_page?.id);
    emit(TesterLoadedState(data));
  }
}

/// case lib cache
Future<void> case_LibCach(emit, testerRepository) async {
  if (Cache.get_data_home_page == null) {
    emit(TesterLoadingState());
    try {
      final data_test = await testerRepository.NamingPetEvent();
      emit(TesterLoadedState(data_test));
    } catch (e) {
      emit(TesterErrorState(e.toString()));
    }
  }
}