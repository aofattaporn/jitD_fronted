import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

/// SignUp
class SignUpEvent extends AuthenticationEvent {
  Map<String, dynamic> _dataSignUp;
  SignUpEvent(this._dataSignUp);
  Map<String, dynamic> get dataSignUp => _dataSignUp;

  @override
  List<Object> get props => [];
}

/// SignIn
class SignInEvent extends AuthenticationEvent {
  Map<String, dynamic> _dataSignUp;
  SignInEvent(this._dataSignUp);
  Map<String, dynamic> get dataSignUp => _dataSignUp;

  @override
  List<Object> get props => [];
}

/// SignIn Google
class SignIngoogle extends AuthenticationEvent {
  SignIngoogle();

  @override
  List<Object> get props => [];
}

/// SignIn FaceBook
class SignInFacebook extends AuthenticationEvent {
  SignInFacebook();

  @override
  List<Object> get props => [];
}

/// SignOut
class SignOut extends AuthenticationEvent {
  SignOut();

  @override
  List<Object> get props => [];
}

class GetUserID extends AuthenticationEvent {
  GetUserID();

  @override
  List<Object> get props => [];
}

class WaitingSet extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class SetPetName extends AuthenticationEvent {
  final String petName;
  const SetPetName(this.petName);

  @override
  List<Object> get props => [];
}
