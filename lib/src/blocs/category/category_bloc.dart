import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState(
      countSelectedCategory: 0,
      selectedCategory: List.generate(7, (i) => false),
      selectedCategoryMap: []
  )) {
    // Add
    on<SelectedCategoryAdd>((event, emit) {
      emit(state.copyWith(countSelectedCategory: state.countSelectedCategory + 1));
    });

    // Minus
    on<SelectedCategoryRemove>((event, emit) {
      emit(state.copyWith(countSelectedCategory: state.countSelectedCategory - 1));
    });
  }
}
