import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/screens/HomePage.dart';

import 'App.dart';

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      print(change);
    }
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// custom observer for check log on state
  Bloc.observer = AppBlocObserver();
  print("2023-01-16T23:28:13.418485+07:00");
  print(DateTime.now().toLocal().toString());
  runApp(const App());
}

