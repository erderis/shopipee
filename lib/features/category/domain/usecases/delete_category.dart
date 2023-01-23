import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

class DeleteCategory implements UseCase<void, DeleteCategoryParams> {
  final CategoryRepository repository;

  DeleteCategory({required this.repository});
  @override
  Future<Either<Failure, void>> call(DeleteCategoryParams params) async {
    return await repository.deleteCategory(id: params.id);
  }
}

class DeleteCategoryParams extends Equatable {
  final String id;

  DeleteCategoryParams(this.id);
  @override
  List<Object?> get props => [id];
}
