import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/authorize/authorize_state.dart';
import 'package:jitd_client/src/blocs/tester/tester_event.dart';

import '../../data/respository/test_provider.dart';
import 'authorize_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthorizeBloc extends Bloc<AuthorizeEvent, AuthoruzeState> {
  AuthorizeBloc() : super(InitailFirebase()) {
    /// inject Repository

    /// connecting firebasw
    on<ConnectingFirebase>((event, emit) async {
      emit(LoadingFirebase());
      try {
        // conecting fiirebase
        if (await FirebaseAuth.instance.currentUser != null) {}
      } catch (e) {
        emit(ConnectErrorFirebase(e.toString()));
      }
    });
  }
}
