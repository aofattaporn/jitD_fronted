import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_event.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/data/respository/auth_provider.dart';

import '../../data/models/auth_model.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(InitialState()) {
    /// inject Repository
    AuthRepository authRepository = new AuthRepository();

    /// SignIn event
    on<SignUpEvent>((event, emit) async {
      var authModel = AuthModel.fromJson(event.dataSignUp);

      // change to model

      // case empty

      // case password incorrect

      // case already data to signIn
      authRepository.signIn(authModel.email.toString().trim(),
          authModel.passworld.toString().trim());
      emit(SignInLoadingState());
    });
  }
}
