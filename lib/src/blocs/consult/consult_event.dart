part of 'consult_bloc.dart';

abstract class ConsultEvent extends Equatable {
  const ConsultEvent();

  @override
  List<Object> get props => [];
}

class GetQuestion extends ConsultEvent {}
class CalResultConsult extends ConsultEvent {
  String point;
  CalResultConsult(this.point);
}
class GetResultConsult extends ConsultEvent {}
class QuestionNext extends ConsultEvent {}
class QuestionBack extends ConsultEvent {}