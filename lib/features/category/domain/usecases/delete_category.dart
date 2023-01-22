import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

class DeleteCategory implements UseCase<Category, CategoryParams> {
  final CategoryRepository repository;

  DeleteCategory({required this.repository});
  @override
  Future<Either<Failure, Category>> call(CategoryParams params) async {
    return await repository.deleteCategory(id: params.id);
  }
}
