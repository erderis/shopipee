import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

class GetCategory implements UseCase<void, NoParams> {
  final CategoryRepository repository;

  GetCategory({required this.repository});
  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.getCategory();
  }
}
