import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jitd_client/src/screens/test_stress/consultData.dart';

import '../../data/models/consult_model.dart';
import '../../data/respository/quiz_repository.dart';
part 'consult_event.dart';
part 'consult_state.dart';

class ConsultBloc extends Bloc<ConsultEvent, ConsultState> {
  QuizRepository quizRepository = QuizRepository();
  ConsultModel consultModel = ConsultModel();

  ConsultBloc()
      : super(ConsultState(
          0,
          List.generate(consultQuizData.length, (i) => -1),
          List.generate(consultQuizData.length, (i) => -1),
        )) {
    on<GetQuestion>((event, emit) async {
      emit(LoadingConsultQuiz(
          state.countQuestion, state.selectedAnswer, state.selectedScore));
      try {
        final consultQuizJSON = await quizRepository.getConsultQuiz();
        final consultModel = listConsultModelFromJson(consultQuizJSON);
        emit(LoadedConsultQuiz(state.countQuestion, state.selectedAnswer,
            state.selectedScore, consultModel.quiz));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(ConsultQuizError(state.countQuestion, state.selectedAnswer,
            state.selectedScore, e.toString()));
      }
    });

    on<CalResultConsult>((event, emit) async {
      emit(LoadingConsultResult(
          state.countQuestion, state.selectedAnswer, state.selectedScore));
      try {
        final consultQuizJSON =
        await quizRepository.calConsultQuizResult(event.point);
        final consultResultModel = consultResultModelFromJson(consultQuizJSON);
        emit(LoadedConsultResult(state.countQuestion, state.selectedAnswer,
            state.selectedScore, consultResultModel));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(ConsultQuizError(state.countQuestion, state.selectedAnswer,
            state.selectedScore, e.toString()));
      }
    });

    on<GetResultConsult>((event, emit) async {
      emit(LoadingConsultResult(
          state.countQuestion, state.selectedAnswer, state.selectedScore));
      try {
        final consultResultJSON =
        await quizRepository.getConsultQuizResult();
        final consultResultModel = consultResultModelFromJson(consultResultJSON);
        emit(LoadedConsultResult(state.countQuestion, state.selectedAnswer,
            state.selectedScore, consultResultModel));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(ConsultQuizError(state.countQuestion, state.selectedAnswer,
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
