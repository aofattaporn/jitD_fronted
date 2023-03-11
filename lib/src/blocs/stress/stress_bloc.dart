import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'stress_event.dart';
part 'stress_state.dart';

class StressBloc extends Bloc<StressEvent, StressState> {
  StressBloc()
      : super(StressState(
          countQuestion: 0,
          selectedAnswer: List.generate(9, (i) => 0),
        )) {

    on<QuestionNext>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion + 1));
    });

    on<QuestionBack>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion - 1));
    });
  }
}
