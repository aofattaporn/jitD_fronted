import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenticationState {}

/// initial state
class InitialState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

/// state for signIn
class SignUpCheckingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}


class SignUpError extends AuthenticationState {
  late final String _err_msg;
  late final String _err_desc;

  SignUpError(this._err_msg, this._err_desc);

  String get err_msg => _err_msg;

  @override
  List<Object?> get props => [_err_msg, _err_desc];


}

class SignUpLoadedState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TesterErrorState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
