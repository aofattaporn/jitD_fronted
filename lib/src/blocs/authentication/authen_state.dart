import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenticationState {}

/// initial state
class InitialState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

/// state for signIn
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
