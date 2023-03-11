part of 'stress_bloc.dart';

class StressState extends Equatable {
  final int countQuestion;
  final List selectedAnswer;
  const StressState(
      {required this.countQuestion, required this.selectedAnswer});

  StressState copyWith({int? countQuestion, List? selectedAnswer}) {
    return StressState(
      countQuestion: countQuestion ?? this.countQuestion,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }

  @override
  List<Object> get props => [countQuestion];
}
