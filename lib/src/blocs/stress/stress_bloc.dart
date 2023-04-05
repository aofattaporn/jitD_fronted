import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
          List.generate(20, (i) => -1),
          List.generate(20, (i) => -1),
        )) {
    on<GetQuestion>((event, emit) async {
      emit(LoadingStressQuiz(
          state.countQuestion, state.selectedAnswer, state.selectedScore));
      try {
        final stressQuizJSON = await quizRepository.getStressQuiz();
        final stressModel = listStressModelFromJson(stressQuizJSON);
        emit(LoadedStressQuiz(state.countQuestion, state.selectedAnswer,
            state.selectedScore, stressModel.quiz));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(StressQuizError(state.countQuestion, state.selectedAnswer,
            state.selectedScore, e.toString()));
      }
    });

    on<CalResultStress>((event, emit) async {
      emit(LoadingStressResult(
          state.countQuestion, state.selectedAnswer, state.selectedScore));
      try {
        final stressQuizJSON =
            await quizRepository.calStressQuizResult(event.point);
        final stressResultModel = stressResultModelFromJson(stressQuizJSON);
        emit(LoadedStressResult(state.countQuestion, state.selectedAnswer,
            state.selectedScore, stressResultModel));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(StressQuizError(state.countQuestion, state.selectedAnswer,
            state.selectedScore, e.toString()));
      }
    });

    on<GetResultStress>((event, emit) async {
      emit(LoadingStressResult(
          state.countQuestion, state.selectedAnswer, state.selectedScore));
      try {
        final stressResultJSON =
            await quizRepository.getStressQuizResult();
        final stressResultModel = stressResultModelFromJson(stressResultJSON);
        emit(LoadedStressResult(state.countQuestion, state.selectedAnswer,
            state.selectedScore, stressResultModel));
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
