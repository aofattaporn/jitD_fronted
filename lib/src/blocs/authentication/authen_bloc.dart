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

    /// SignUP event
    on<SignUpEvent>((event, emit) async {
      // convert data to model
      var authModel = AuthModel.fromJson(event.dataSignUp);
      final email = authModel.email.toString().trim();
      final password = authModel.passworld.toString().trim();
      final passwordCF = authModel.passworldConfirm.toString().trim();

      emit(SignUpCheckingState());

      // Password confirm incorrect
      if (password != passwordCF) {
        String err = "Password confirm incorrect";
        String desc = "กดเพื่อลองใหม่อีกครั้ง";
        emit(SignUpError(err, desc));
      } else {

        // signIn with firebase authentication.
        String? temp;
        temp = await authRepository.signUp(email, password);

        // checking data
        if (temp == "The email address is already in use by another account.") {
          String err = "Email already existing";
          String desc = "กดเพื่อลองใหม่อีกครั้ง";
          emit(SignUpError(err, desc));
        }

        // checking data
        else if(temp == "somthing wrong"){
          String err = "Somthing fial";
          String desc = "กดเพื่อลองใหม่อีกครั้ง";
          emit(SignUpError(err, desc));
        }

        else {
          // ยิงข้อมูลไปที่ backend
          emit(SignUpLoadedState());
        }
      }
    });

    /// SignIn event
    on<SignInEvent>((event, emit) async {
      // convert data to model
      var authModel = AuthModel.fromJson(event.dataSignUp);
      // signIn with firebase authentication.
      String? temp = await authRepository.signIn(
          authModel.email.toString().trim(),
          authModel.passworld.toString().trim());
      // check case signIn
      emit(SignUpLoadedState());
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
