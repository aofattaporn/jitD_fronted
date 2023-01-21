import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jitd_client/src/data/models/post_model.dart';

@immutable
abstract class HomepageState extends Equatable {}

/// state loading
class HomePageLoadingState extends HomepageState {
  @override
  List<Object?> get props => [];
}

/// state loaded
class HomePageLoadedState extends HomepageState {
  final PostModel allPost;

  HomePageLoadedState(this.allPost);

  @override
  List<Object?> get props => [allPost];
}

/// state error
class HomePageErrorState extends HomepageState {
  final String error;

  HomePageErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
