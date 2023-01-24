import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/category/data/datasources/category_image_remote.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/features/category/domain/repositories/category_image_repository.dart';

import '../../../../core/network/network_info.dart';

class CategoryImageRepoImpl extends CategoryImageRepository {
  final CategoryImageRemote remote;
  final NetworkInfo networkInfo;

  CategoryImageRepoImpl({required this.remote, required this.networkInfo});

  @override
  Future<Either<Failure, String>> uploadImage(
      {required String filePath}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remote.uploadImage(filePath: filePath));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
