part of 'stress_bloc.dart';

class StressState extends Equatable {
  final int countQuestion;
  final List selectedAnswer;
  final List selectedScore;
  const StressState(
      this.countQuestion, this.selectedAnswer, this.selectedScore);

  StressState copyWith(
      {int? countQuestion, List? selectedAnswer, List? selectedScore}) {
    return StressState(
        countQuestion ?? this.countQuestion,
        selectedAnswer ?? this.selectedAnswer,
        selectedScore ?? this.selectedScore);
  }

  @override
  List<Object> get props => [countQuestion, selectedAnswer, selectedScore];
}

class LoadingStressQuiz {}

class LoadedStressQuiz {}

class StressQuizError extends StressState {
  String error;
  StressQuizError(super.countQuestion, super.selectedAnswer,
      super.selectedScore, this.error);
}
