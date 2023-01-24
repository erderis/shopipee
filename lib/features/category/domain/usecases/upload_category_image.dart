import 'package:equatable/equatable.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/repositories/category_image_repository.dart';

class UploadCategoryImage extends UseCase<String, UploadCategoriImageParams> {
  final CategoryImageRepository repository;

  UploadCategoryImage({required this.repository});
  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.uploadImage(filePath: params.filePath);
  }
}

class UploadCategoriImageParams extends Equatable {
  final String filePath;

  UploadCategoriImageParams({required this.filePath});

  @override
  List<Object?> get props => [filePath];
}
