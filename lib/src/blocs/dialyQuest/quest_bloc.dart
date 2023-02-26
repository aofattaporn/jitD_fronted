import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_event.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_state.dart';
import 'package:jitd_client/src/data/models/dialyQuest_model.dart';

import '../../data/respository/quest_repository.dart';

class QuestBloc extends Bloc<QuestEvent, QuestState> {
  // creating object repository
  DialyQuestModel dialyQuestModel = DialyQuestModel();
  DiryQuestRepository diryQuestRepository = DiryQuestRepository();

  QuestBloc() : super(InitialQuest()) {
    emit(GettingMyQuest());
    // get comment
    on<GetMyQuest>((event, emit) async {
      try {
        final questJSON = await diryQuestRepository.getMyQuest();
        final questData = DialyQuestModelFromJson(questJSON);

        // set global state
        dialyQuestModel.setMyQuest(questData.questDate!, questData.quests!);

        // return global state
        emit(GetMyQuestSuccess(
            dialyQuestModel.questDate!, dialyQuestModel.quests!));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(GetMyQuestError(e.toString()));
      }
    });
  }
}
