import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategory();
  Future<Either<Failure, void>> addCategory();
  Future<Either<Failure, Category>> updateCategory({required String id});
  Future<Either<Failure, Category>> deleteCategory({required String id});
}
