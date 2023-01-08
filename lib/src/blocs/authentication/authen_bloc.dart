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
      print(authModel.email);
      print(authModel.passworld);
      print(authModel.passworldConfirm);

      emit(SignUpCheckingState());

      // Password confirm incorrect
      if (authModel.passworld.toString().trim() !=
          authModel.passworldConfirm.toString().trim()) {
        String err = "Password confirm incorrect";
        String desc = "กดเพื่อลองใหม่อีกครั้ง";
        emit(SignUpError(err, desc));
      }

      else {
        // signIn with firebase authentication.
        String? temp;
        temp = await authRepository.signIn(authModel.email.toString().trim(),
            authModel.passworld.toString().trim());
        print(temp);


        // checking data
        if (temp == "The email address is already in use by another account.") {
          String err = "Email already existing";
          String desc = "กดเพื่อลองใหม่อีกครั้ง";
          emit(SignUpError(err, desc));
        } else {
          // ยิงข้อมูลไปที่ backend
          emit(SignUpLoadedState());
        }

        // sace data
        String result = await authRepository.checkCredentail();
        emit(CheckStatusAuthrn(result));
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
