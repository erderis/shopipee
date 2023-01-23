import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
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
        final remoteListCategory = await remote.getCategory();
        local.cacheListCategory(remoteListCategory);
        return Right(remoteListCategory);
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
  Future<Either<Failure, void>> addCategory(
      {required CategoryModel dataCategory}) async {
    if (await networkInfo.isConnected) {
      try {
        final categoryRemote = await remote.addCategory(dataCategory);
        return Right(categoryRemote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(
      {required CategoryModel dataCategory}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategory = await remote.updateCategory(dataCategory);

        return Right(remoteCategory);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remote.deleteCategory(id));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
