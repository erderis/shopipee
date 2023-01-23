import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/category/data/datasources/category_local.dart';
import 'package:portfolio/features/category/data/datasources/category_remote.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/data/repositories/category_repository_impl.dart';

import 'category_repository_imp_test.mocks.dart';

@GenerateMocks([CategoryLocal, NetworkInfo])
@GenerateNiceMocks([MockSpec<CategoryRemote>()])
void main() {
  late CategoryRepositoryImpl repository;
  late MockCategoryRemote mockCategoryRemote;
  late MockCategoryLocal mockCategoryLocal;
  late MockNetworkInfo mockNetworkInfo;
  late List<CategoryModel> tListCategoryModel;
  late CategoryModel tCategoryModel;

  setUp(() {
    mockCategoryRemote = MockCategoryRemote();
    mockCategoryLocal = MockCategoryLocal();
    mockNetworkInfo = MockNetworkInfo();
    repository = CategoryRepositoryImpl(
        remote: mockCategoryRemote,
        local: mockCategoryLocal,
        networkInfo: mockNetworkInfo);

    tCategoryModel = CategoryModel(
        image: 'image.jpg',
        name: 'Sweater',
        createdAt: Timestamp(1674295838, 392000000).toDate(),
        updatedAt: Timestamp(1674295838, 392000000).toDate(),
        id: 'ncu7v3k7keq3tmz99vEF');
    tListCategoryModel = [tCategoryModel];
  });

  group('Get Category', () {
    test('Should check internet connection', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      await repository.getCategory();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('Should get data from remote', () async {
        //arrange
        when(mockCategoryRemote.getCategory())
            .thenAnswer((_) async => tListCategoryModel);
        //act
        final result = await repository.getCategory();
        //assert
        expect(result, equals(Right(tListCategoryModel)));
        verify(mockCategoryRemote.getCategory());
      });
      test('Should cache remote data', () async {
        //arrange
        when(mockCategoryRemote.getCategory())
            .thenAnswer((_) async => tListCategoryModel);
        //act
        await repository.getCategory();
        //assert
        verify(mockCategoryRemote.getCategory());
        verify(mockCategoryLocal.cacheListCategory(tListCategoryModel));
      });

      test('Should return Server Failure when get data unsuccessful', () async {
        //arrange
        when(mockCategoryRemote.getCategory()).thenThrow(ServerException());
        //act
        final result = await repository.getCategory();
        //assert
        verify(mockCategoryRemote.getCategory());
        verifyZeroInteractions(mockCategoryLocal);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('Should get data from local', () async {
        //arrange
        when(mockCategoryLocal.getLastCategory())
            .thenAnswer((_) async => tListCategoryModel);
        //act
        final result = await repository.getCategory();
        //assert
        verify(mockCategoryLocal.getLastCategory());
        verifyZeroInteractions(mockCategoryRemote);
        expect(result, Right(tListCategoryModel));
      });

      test(
          'Should return cache failure when get data from local unsucessful/not present',
          () async {
        //arrange
        when(mockCategoryLocal.getLastCategory()).thenThrow(CacheException());
        //act
        final result = await repository.getCategory();
        //assert
        verify(mockCategoryLocal.getLastCategory());
        verifyZeroInteractions(mockCategoryRemote);
        expect(result, equals((Left(CacheFailure()))));
      });
    });
  });

  group('Add Category', () {
    test('Should check internect connection', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      await repository.addCategory(dataCategory: tCategoryModel);
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('Should add category to remote', () async {
        //arrange
        when(mockCategoryRemote.addCategory(tCategoryModel))
            .thenAnswer((_) async => tCategoryModel);
        //act
        final result =
            await repository.addCategory(dataCategory: tCategoryModel);
        //assert
        verify(mockCategoryRemote.addCategory(tCategoryModel));
        expect(result, equals(Right(tCategoryModel)));
      });

      test('Should return Server Failure when add data to remote unsuccessfull',
          () async {
        when(mockCategoryRemote.addCategory(tCategoryModel))
            .thenThrow(ServerException());
        //act
        final result =
            await repository.addCategory(dataCategory: tCategoryModel);
        //assert
        verify(mockCategoryRemote.addCategory(tCategoryModel));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('Should return Server Failure when device offline', () async {
        //act
        final result =
            await repository.addCategory(dataCategory: tCategoryModel);
        //assert
        verifyZeroInteractions(mockCategoryRemote);
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  group('Update Category', () {
    test('Should check internet connection', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      await repository.updateCategory(dataCategory: tCategoryModel);
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('Should update category data to remote', () async {
        //arrange
        when(mockCategoryRemote.updateCategory(any))
            .thenAnswer((_) async => tCategoryModel);
        //act
        final result =
            await repository.updateCategory(dataCategory: tCategoryModel);
        //assert
        verify(mockCategoryRemote.updateCategory(tCategoryModel));
        expect(result, equals(Right(tCategoryModel)));
      });

      test('Should return Server failure when update data unsuccessful',
          () async {
        //arrange
        when(mockCategoryRemote.updateCategory(any))
            .thenThrow(ServerException());
        //act
        final result =
            await repository.updateCategory(dataCategory: tCategoryModel);
        //assert
        verify(mockCategoryRemote.updateCategory(tCategoryModel));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('Should return Server Failure when update data during offline',
          () async {
        when(mockCategoryRemote.updateCategory(any))
            .thenThrow(ServerException());
        //act
        final result =
            await repository.updateCategory(dataCategory: tCategoryModel);
        //assert
        verifyZeroInteractions(mockCategoryRemote);
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  group('Delete Category', () {
    test('Should check internet connection', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      await repository.deleteCategory(id: 'ncu7v3k7keq3tmz99vEF1');
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('Device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('Should delete category remote', () async {
        //arrange
        when(mockCategoryRemote.deleteCategory(any))
            .thenAnswer((_) async => tCategoryModel);
        //act
        final result =
            await repository.deleteCategory(id: 'ncu7v3k7keq3tmz99vEF');
        //assert
        verify(mockCategoryRemote.deleteCategory('ncu7v3k7keq3tmz99vEF'));
        expect(result, equals(Right(tCategoryModel)));
      });

      test('Should return Server Failure when delete category unsuccessful',
          () async {
        //arrange
        when(mockCategoryRemote.deleteCategory(any))
            .thenThrow(ServerException());
        //act
        final result =
            await repository.deleteCategory(id: 'ncu7v3k7keq3tmz99vEF');
        //assert
        verify(mockCategoryRemote.deleteCategory('ncu7v3k7keq3tmz99vEF'));
        expect(result, equals(Left(ServerFailure())));
      });
    });
    group('Device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('Should return Server Failure when device is offline', () async {
        //arrange
        when(mockCategoryRemote.deleteCategory(any))
            .thenThrow(ServerException());
        //act
        final result =
            await repository.deleteCategory(id: 'ncu7v3k7keq3tmz99vEF');
        //assert
        verifyZeroInteractions(mockCategoryRemote);
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}
