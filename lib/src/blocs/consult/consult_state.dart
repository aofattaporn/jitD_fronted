part of 'consult_bloc.dart';

class ConsultState extends Equatable {
  final int countQuestion;
  final List selectedAnswer;
  final List selectedScore;
  const ConsultState(
      this.countQuestion, this.selectedAnswer, this.selectedScore);

  ConsultState copyWith(
      {int? countQuestion, List? selectedAnswer, List? selectedScore}) {
    return ConsultState(
        countQuestion ?? this.countQuestion,
        selectedAnswer ?? this.selectedAnswer,
        selectedScore ?? this.selectedScore);
  }

  @override
  List<Object> get props => [countQuestion, selectedAnswer, selectedScore];
}

class LoadingConsultQuiz extends ConsultState {
  LoadingConsultQuiz(
      super.countQuestion, super.selectedAnswer, super.selectedScore);
}

class LoadedConsultQuiz extends ConsultState {
  List<ConsultModel> quizData;
  LoadedConsultQuiz(super.countQuestion, super.selectedAnswer,
      super.selectedScore, this.quizData);
}

class LoadingConsultResult extends ConsultState {
  LoadingConsultResult(
      super.countQuestion, super.selectedAnswer, super.selectedScore);
}

class LoadedConsultResult extends ConsultState {
  ConsultResultModel quizResult;
  LoadedConsultResult(super.countQuestion, super.selectedAnswer,
      super.selectedScore, this.quizResult);
}

class ConsultQuizError extends ConsultState {
  String error;
  ConsultQuizError(super.countQuestion, super.selectedAnswer,
      super.selectedScore, this.error);
}

