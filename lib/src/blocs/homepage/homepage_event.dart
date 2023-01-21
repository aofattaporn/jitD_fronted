import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';


@immutable
abstract class HomepageEvent extends Equatable {
  const HomepageEvent();
}

class LoadHomePageEvent extends HomepageEvent {
  @override
  List<Object> get props => [];
}