part of 'stress_bloc.dart';

class StressState extends Equatable {
  final int countQuestion;
  final List selectedAnswer;
  final List selectedScore;
  const StressState(
      {required this.countQuestion,
      required this.selectedAnswer,
      required this.selectedScore});

  StressState copyWith(
      {int? countQuestion, List? selectedAnswer, List? selectedScore}) {
    return StressState(
        countQuestion: countQuestion ?? this.countQuestion,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        selectedScore: selectedScore ?? this.selectedScore);
  }

  @override
  List<Object> get props => [countQuestion, selectedAnswer, selectedScore];
}
