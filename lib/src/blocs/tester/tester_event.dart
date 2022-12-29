
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';


@immutable
abstract class TesterEvent extends Equatable {
  const TesterEvent();
}

class LoadTesterEvent extends TesterEvent {
  @override
  List<Object> get props => [];
}