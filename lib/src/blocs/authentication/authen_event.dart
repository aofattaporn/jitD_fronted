import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class SignUpEvent extends AuthenticationEvent {
  Map<String, dynamic> _dataSignUp;

  SignUpEvent(this._dataSignUp);

  Map<String, dynamic> get dataSignUp => _dataSignUp;

  @override
  List<Object> get props => [];
}
