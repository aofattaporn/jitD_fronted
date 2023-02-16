part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final int countSelectedCategory;
  final List selectedCategory;
  final List<String> selectedCategoryMap;
  const CategoryState(
      {required this.countSelectedCategory, required this.selectedCategory, required this.selectedCategoryMap});

  CategoryState copyWith({int? countSelectedCategory, List? selectedCategory, List<String>? selectedCategoryMap}) {
    return CategoryState(
        countSelectedCategory: countSelectedCategory ?? this.countSelectedCategory,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectedCategoryMap: selectedCategoryMap ?? this.selectedCategoryMap
    );
  }

  @override
  List<Object> get props => [countSelectedCategory];
}
