import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/data/models/user_model.dart';

@immutable
abstract class AuthenticationState {
  late final UserModel user = UserModel();
}

/// initial state
class InitialState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

// --------------- authen_state ---------------------

class AuthenCheckingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenUpError extends AuthenticationState {
  late final String _err_msg;
  late final String _err_desc;

  AuthenUpError(this._err_msg, this._err_desc);

  String get err_msg => _err_msg;
  String get err_desc => _err_desc;

  @override
  List<Object?> get props => [_err_msg, _err_desc];
}

class SignUpLoadedState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SigIn3PartySuccess extends AuthenticationState {}

class SigUp3PartySuccess extends AuthenticationState {}

class CheckStatusAuthrn extends AuthenticationState {
  late String _statueAuth;

  CheckStatusAuthrn(this._statueAuth);

  String get statueAuth => _statueAuth;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignOutSuccess extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TesterErrorState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// --------------- user_state ---------------------

class GettingUser extends AuthenCheckingState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetUserSuccess extends AuthenticationState {
  GetUserSuccess(String userId, int point, String petName) {
    super.user.userID = userId;
    super.user.point = point;
    super.user.petName = petName;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetPetNameSuccess extends AuthenticationState {
  SetPetNameSuccess(String userId, int point, String petName) {
    super.user.userID = userId;
    super.user.point = point;
    super.user.petName = petName;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SettingNamePet extends AuthenticationState {
  SettingNamePet(String userId, int point, String petName) {
    super.user.userID = userId;
    super.user.point = point;
    super.user.petName = petName;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetUserError extends AuthenCheckingState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
