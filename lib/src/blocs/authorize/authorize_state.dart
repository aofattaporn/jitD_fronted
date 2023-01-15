import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/test_model.dart';

@immutable
abstract class AuthoruzeState extends Equatable {}

/// state loading
class InitailFirebase extends AuthoruzeState {
  @override
  List<Object?> get props => [];
}

/// state loading
class LoadingFirebase extends AuthoruzeState {
  @override
  List<Object?> get props => [];
}

/// state loaded
class ConnectedFirebase extends AuthoruzeState {
  final TestModel tester;

  ConnectedFirebase(this.tester);

  @override
  List<Object?> get props => [tester];
}

/// state error
class ConnectErrorFirebase extends AuthoruzeState {
  final String error;

  ConnectErrorFirebase(this.error);

  @override
  List<Object?> get props => [error];
}
