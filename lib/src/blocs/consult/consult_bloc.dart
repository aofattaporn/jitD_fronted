import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jitd_client/src/screens/test_stress/consultData.dart';
part 'consult_event.dart';
part 'consult_state.dart';

class ConsultBloc extends Bloc<ConsultEvent, ConsultState> {
  ConsultBloc()
      : super(ConsultState(
          countQuestion: 0,
          selectedAnswer: List.generate(consultQuizData.length, (i) => -1),
          selectedScore: List.generate(consultQuizData.length, (i) => -1),
        )) {
    on<QuestionNext>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion + 1));
    });

    on<QuestionBack>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion - 1));
    });
  }
}
