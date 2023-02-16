part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final int countSelectedCategory;
  final List selectedCategory;
  final List selectedCategoryMap;
  const CategoryState(
      {required this.countSelectedCategory, required this.selectedCategory, required this.selectedCategoryMap});

  CategoryState copyWith({int? countSelectedCategory, List? selectedCategory, List? selectedCategoryMap}) {
    return CategoryState(
        countSelectedCategory: countSelectedCategory ?? this.countSelectedCategory,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedCategoryMap: selectedCategoryMap ?? this.selectedCategoryMap
    );
  }

  @override
  List<Object> get props => [countSelectedCategory];
}
