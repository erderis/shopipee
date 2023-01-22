import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';

import '../datasources/category_local.dart';
import '../datasources/category_remote.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemote remote;
  final CategoryLocal local;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl(
      {required this.remote, required this.local, required this.networkInfo});

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await remote.getCategory();
        local.cacheCategory(remoteCategory);
        return Right(remoteCategory);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final categoryLocal = await local.getLastCategory();
        return Right(categoryLocal);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> addCategory() async {
    networkInfo.isConnected;
    return Right(await remote.addCategory());
  }

  @override
  Future<Either<Failure, Category>> updateCategory({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Category>> deleteCategory({required String id}) {
    throw UnimplementedError();
  }
}
