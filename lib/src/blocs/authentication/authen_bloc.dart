import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_event.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/data/models/auth_status.dart';
import 'package:jitd_client/src/data/respository/auth_provider.dart';

import '../../data/models/auth_model.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(InitialState()) {
    /// inject Repository
    AuthRepository authRepository = new AuthRepository();

    /// SignUP event
    on<SignUpEvent>((event, emit) async {
      // convert data to model
      var authModel = AuthModel.fromJson(event.dataSignUp);
      final email = authModel.email.toString().trim();
      final password = authModel.passworld.toString().trim();
      final passworldConfirm = authModel.passworldConfirm.toString().trim();

      emit(SignUpCheckingState());

      // Password confirm incorrect
      if (password != passworldConfirm) {
        emit(SignUpError(ErrorAuthenPasswordIncorrect().statusName,
            ErrorAuthenPasswordIncorrect().statusDesc));
      } else {
        // signIn with firebase authentication.
        String? temp = await authRepository.signUp(email, password);
        if (temp == "The email address is already in use by another account.") {
          emit(SignUpError(EmailExist().statusDesc, EmailExist().statusName));
        } else if (temp == "Something wrong") {
          emit(SignUpError("Something wrong", "Please try again"));
        } else {
          emit(SignUpLoadedState());
        }
      }
    });

    /// SignIn event
    on<SignInEvent>((event, emit) async {
      var authModel = AuthModel.fromJson(event.dataSignUp);
      final email = authModel.email.toString().trim();
      final password = authModel.passworld.toString().trim();
      final passworldConfirm = authModel.passworldConfirm.toString().trim();

      // signIn with firebase authentication.
      String? temp = await authRepository.signIn(email, password);
      if (temp == 'No user found for that email.') {
        emit(SignUpError(NotFoundUser().statusName, NotFoundUser().statusDesc));
      } else if (temp == 'Wrong password provided for that user.') {
        emit(SignUpError(
            PasswordIncorrect().statusName, PasswordIncorrect().statusDesc));
      } else {
        // print(temp);
        // check case sdignIn
        emit(SignUpLoadedState());
      }
    });

    /// SignIn by google
    on<SignIngoogle>((event, emit) async {
      await authRepository.signInWithGoogle();
      String result = await authRepository.checkCredentail();

      emit(CheckStatusAuthrn(result));
    });

    /// SignIn by FaceBook
    on<SignInFacebook>((event, emit) async {
      await authRepository.signInWithFacebook();
      String result = await authRepository.checkCredentail();

      emit(CheckStatusAuthrn(result));
    });

    /// SignOut
    on<SignOut>((event, emit) async {
      await authRepository.signOut();
      String result = await authRepository.checkCredentail();
      emit(CheckStatusAuthrn(result));
      emit(SignOutSuccess());
    });
  }
}
