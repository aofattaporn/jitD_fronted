part of 'consult_bloc.dart';

class ConsultState extends Equatable {
  final int countQuestion;
  final List selectedAnswer;
  final List selectedScore;
  const ConsultState(
      {required this.countQuestion,
      required this.selectedAnswer,
      required this.selectedScore});

  ConsultState copyWith(
      {int? countQuestion, List? selectedAnswer, List? selectedScore}) {
    return ConsultState(
        countQuestion: countQuestion ?? this.countQuestion,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        selectedScore: selectedScore ?? this.selectedScore);
  }

  @override
  List<Object> get props => [countQuestion, selectedAnswer, selectedScore];
}
