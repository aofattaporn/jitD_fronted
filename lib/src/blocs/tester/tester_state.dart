import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/test_model.dart';

@immutable
abstract class TesterState extends Equatable {}

/// state loading
class TesterLoadingState extends TesterState {
  @override
  List<Object?> get props => [];
}

/// state loaded
class TesterLoadedState extends TesterState {
  final TestModel tester;

  TesterLoadedState(this.tester);

  @override
  List<Object?> get props => [tester];
}

/// state error
class TesterErrorState extends TesterState {
  final String error;

  TesterErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
