import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

class UpdateCategory implements UseCase<Category, UpdateCategoryParams> {
  final CategoryRepository repository;

  UpdateCategory({required this.repository});
  @override
  Future<Either<Failure, Category>> call(UpdateCategoryParams params) async {
    return await repository.updateCategory(dataCategory: params.categoryModel);
  }
}

class UpdateCategoryParams extends Equatable {
  final CategoryModel categoryModel;

  UpdateCategoryParams(this.categoryModel);
  @override
  List<Object?> get props => [categoryModel];
}
