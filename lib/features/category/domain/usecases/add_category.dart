import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

class AddCategory implements UseCase<void, NoParams> {
  final CategoryRepository repository;

  AddCategory({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.addCategory();
  }
}
