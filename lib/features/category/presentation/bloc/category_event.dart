part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final CategoryModel dataCategory;

  AddCategoryEvent({required this.dataCategory});
}

class UpdateCategoryEvent extends CategoryEvent {
  final CategoryModel dataCategory;
  final bool withNewImage;

  UpdateCategoryEvent({required this.dataCategory, required this.withNewImage});
}

class DeleteCategoryEvent extends CategoryEvent {
  final String id;

  DeleteCategoryEvent({required this.id});
}
