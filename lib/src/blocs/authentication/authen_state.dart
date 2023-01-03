import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

/// initial state
class InitialState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

/// state for signIn
class SignInLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class SignInLoadedState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TesterErrorState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
