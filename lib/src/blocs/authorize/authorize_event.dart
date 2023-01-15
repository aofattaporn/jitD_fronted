import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthorizeEvent extends Equatable {
  const AuthorizeEvent();
}

class ConnectingFirebase extends AuthorizeEvent {
  String _uid;
  String _email;
  String _token;

  ConnectingFirebase(this._uid, this._email, this._token);

  @override
  List<Object> get props => [];
}
