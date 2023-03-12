part of 'consult_bloc.dart';

abstract class ConsultEvent extends Equatable {
  const ConsultEvent();

  @override
  List<Object> get props => [];
}

class QuestionNext extends ConsultEvent {}
class QuestionBack extends ConsultEvent {}