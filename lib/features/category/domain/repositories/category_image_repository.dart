import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';

abstract class CategoryImageRepository {
  Future<Either<Failure, String>> uploadImage({required String filePath});
}
