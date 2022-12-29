
import 'counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// navigationBloc
class CounterBloc2 extends Bloc<CounterEvent, int> {
  CounterBloc2() : super(0) {
    /// business logic

    // case increment
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));

    // case decrement
    on<CounterDecrementPressed>((event, emit) => {
      if (state <= 0) {emit(state)} else {emit(state - 1)}
    });

    // case reeset
    on<CounterResetPressed>((event, emit) => emit(0));
  }
}
