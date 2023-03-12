import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jitd_client/src/screens/test_stress/stressData.dart';
part 'stress_event.dart';
part 'stress_state.dart';

class StressBloc extends Bloc<StressEvent, StressState> {
  StressBloc()
      : super(StressState(
          countQuestion: 0,
          selectedAnswer: List.generate(stressQuizData.length, (i) => -1),
          selectedScore: List.generate(stressQuizData.length, (i) => -1),
        )) {
    on<QuestionNext>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion + 1));
    });

    on<QuestionBack>((event, emit) {
      emit(state.copyWith(countQuestion: state.countQuestion - 1));
    });
  }
}
