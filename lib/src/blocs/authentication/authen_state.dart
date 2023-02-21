import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthenticationState {}

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

class GettedUser extends AuthenCheckingState {
  final int _countPosts;
  final int _countLikes;
  final int _countComments;
  final String _userId;
  final int _point;
  final String _petName;

  int? get countPosts => _countPosts;

  GettedUser(this._countPosts, this._countLikes, this._countComments,
      this._userId, this._point, this._petName);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  int? get countLikes => _countLikes;

  int? get countComments => _countComments;

  String? get userId => _userId;

  int? get point => _point;

  String? get petName => _petName;
}

class GetUserError extends AuthenCheckingState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
