import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jitd_client/src/screens/test_stress/stressData.dart';
import '../../data/models/stress_model.dart';
import '../../data/respository/quiz_repository.dart';
part 'stress_event.dart';
part 'stress_state.dart';

class StressBloc extends Bloc<StressEvent, StressState> {
  QuizRepository quizRepository = QuizRepository();
  StressModel stressModel = StressModel();

  StressBloc()
      : super(StressState(
          0,
          List.generate(stressQuizData.length, (i) => -1),
          List.generate(stressQuizData.length, (i) => -1),
        )) {

    on<GetQuestion>((event, emit) async {
      try {
        final stressQuizJSON = await quizRepository.getStressQuiz();
        final stressModel = listStressModelFromJson(stressQuizJSON);

      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(StressQuizError(state.countQuestion, state.selectedAnswer,
            state.selectedScore, e.toString()));
      }
    });

    on<QuestionNext>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion + 1));
    });

    on<QuestionBack>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion - 1));
    });
  }
}
