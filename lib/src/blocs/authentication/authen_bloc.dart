import 'package:bloc/bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_event.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/data/models/user_model.dart';
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

      emit(AuthenCheckingState());

      // Password confirm incorrect
      if (password != passwordCF) {
        String err = "Password confirm incorrect";
        String desc = "กดเพื่อลองใหม่อีกครั้ง";
        emit(AuthenUpError(err, desc));
      } else {
        // signIn with firebase authentication.
        String? temp;
        temp = await authRepository.signUp(email, password);

        // checking data
        if (temp == "The email address is already in use by another account.") {
          String err = "Email already existing";
          String desc = "กดเพื่อลองใหม่อีกครั้ง";
          emit(AuthenUpError(err, desc));
        }

        // checking data
        else if (temp == "Something wrong") {
          String err = "Something fial";
          String desc = "กดเพื่อลองใหม่อีกครั้ง";
          emit(AuthenUpError(err, desc));
        } else {
          // ยิงข้อมูลไปที่ backend
          emit(SignUpLoadedState());
        }
      }
    });

    /// SignIn event
    on<SignInEvent>((event, emit) async {
      emit(AuthenCheckingState());
      // convert data to model
      var authModel = AuthModel.fromJson(event.dataSignUp);
      // signIn with firebase authentication.
      String? temp = await authRepository.signIn(
          authModel.email.toString().trim(),
          authModel.passworld.toString().trim());
      if (temp == "No user found for that email.") {
        emit(AuthenUpError(
            "No user found for that email.", "Please to try again"));
      } else if (temp == "Wrong password provided for that user.") {
        emit(AuthenUpError("Wrong password.", "Please to try again"));
      } else if (temp == "something wrong") {
        emit(AuthenUpError("something wrong", "Please to try again"));
      } else {
        emit(SignUpLoadedState());
      }
    });

    /// SignIn by google
    on<SignIngoogle>((event, emit) async {
      // emit checking
      emit(AuthenCheckingState());

      String response = await authRepository.signInWithGoogle();
      // check result
      if (response == "sign in success") {
        emit(SigIn3PartySuccess());
      } else if (response == "create user success") {
        emit(SigUp3PartySuccess());
      } else {
        emit(AuthenUpError("something wrong", "pls try again"));
      }

      // return err
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

    /// UserID
    on<getUserID>((event, emit) async {
      await authRepository.GetMyUser();
      emit(GettingUser());
      try {
        final userData = await authRepository.GetMyUser();
        final userModel = await userModelFromJson(userData);
        // int? post = userModel.countPosts;
        emit(GettedUser(
            userModel.countPosts!,
            userModel.countLikes!,
            userModel.countComments!,
            userModel.userId!,
            userModel.point!,
            userModel.petName!));
      } catch (e, stacktrace) {
        print("Exxception occured: $e stackTrace: $stacktrace");
        emit(GetUserError());
      }
    });
  }
}
