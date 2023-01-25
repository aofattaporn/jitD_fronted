import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState(content: '', tag: [])) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
