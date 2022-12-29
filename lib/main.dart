import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'App.dart';

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  /// custom observer for check log on state
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
