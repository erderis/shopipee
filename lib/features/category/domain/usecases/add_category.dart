import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

import '../../data/models/category_model.dart';

class AddCategory implements UseCase<void, AddCategoryParams> {
  final CategoryRepository repository;

  AddCategory({required this.repository});
  @override
  Future<Either<Failure, void>> call(AddCategoryParams params) async {
    return await repository.addCategory(dataCategory: params.dataCategory);
  }
}

class AddCategoryParams extends Equatable {
  final CategoryModel dataCategory;

  AddCategoryParams({required this.dataCategory});
  @override
  List<Object?> get props => [dataCategory];
}
