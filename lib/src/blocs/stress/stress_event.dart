part of 'stress_bloc.dart';

abstract class StressEvent extends Equatable {
  const StressEvent();

  @override
  List<Object> get props => [];
}

class QuestionNext extends StressEvent {}
class QuestionBack extends StressEvent {}