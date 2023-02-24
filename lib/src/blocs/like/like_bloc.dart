import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(const LikeState(isLike: false)) {
    on<LikePost>((event, emit) {
      emit(state.copyWith(isLike: true));
    });

    on<UnLikePost>((event, emit) {
      emit(state.copyWith(isLike: false));
    });
  }
}
