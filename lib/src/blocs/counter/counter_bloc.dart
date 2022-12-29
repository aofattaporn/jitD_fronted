import 'package:flutter_bloc/flutter_bloc.dart';

/// Event being processed by [CounterBloc].
abstract class CounterEvent {}

/// Event being processed by CounterEvent
class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterResetPressed extends CounterEvent {}
