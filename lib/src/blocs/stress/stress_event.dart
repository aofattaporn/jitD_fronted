part of 'stress_bloc.dart';

abstract class StressEvent extends Equatable {
  const StressEvent();

  @override
  List<Object> get props => [];
}

class GetQuestion extends StressEvent {}
class CalResultStress extends StressEvent {
  String point;
  CalResultStress(this.point);
}
class GetResultStress extends StressEvent {}
class QuestionNext extends StressEvent {}
class QuestionBack extends StressEvent {}
