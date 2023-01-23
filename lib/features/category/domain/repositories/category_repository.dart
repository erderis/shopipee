import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategory();
  Future<Either<Failure, void>> addCategory(
      {required CategoryModel dataCategory});
  Future<Either<Failure, void>> updateCategory(
      {required CategoryModel dataCategory});
  Future<Either<Failure, void>> deleteCategory({required String id});
}
