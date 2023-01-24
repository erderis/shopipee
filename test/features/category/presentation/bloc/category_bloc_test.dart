import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/constants/apis/bloc_message.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/usecases/add_category.dart';
import 'package:portfolio/features/category/domain/usecases/delete_category.dart';
import 'package:portfolio/features/category/domain/usecases/get_category.dart';
import 'package:portfolio/features/category/domain/usecases/update_category.dart';
import 'package:portfolio/features/category/domain/usecases/upload_category_image.dart';
import 'package:portfolio/features/category/presentation/bloc/category_bloc.dart';

import 'category_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetCategory>(),
  MockSpec<AddCategory>(),
  MockSpec<UpdateCategory>(),
  MockSpec<DeleteCategory>(),
  MockSpec<UploadCategoryImage>()
])
void main() {
  late CategoryBloc categoryBloc;
  late MockGetCategory mockGetCategory;
  late MockAddCategory mockAddCategory;
  late MockUpdateCategory mockUpdateCategory;
  late MockDeleteCategory mockDeleteCategory;
  late MockUploadCategoryImage mockUploadCategoryImage;

  final tListCategory = [
    Category(
        image: 'image.jpg',
        name: 'Sweater',
        createdAt: Timestamp(1674295838, 392000000).toDate(),
        updatedAt: Timestamp(1674295838, 392000000).toDate(),
        id: 'ncu7v3k7keq3tmz99vEF')
  ];

  final tCategoryModel = CategoryModel(
      image: 'image.jpg',
      name: 'Sweater',
      createdAt: Timestamp(1674295838, 392000000).toDate(),
      updatedAt: Timestamp(1674295838, 392000000).toDate(),
      id: 'ncu7v3k7keq3tmz99vEF');

  setUp(() {
    mockGetCategory = MockGetCategory();
    mockAddCategory = MockAddCategory();
    mockUpdateCategory = MockUpdateCategory();
    mockDeleteCategory = MockDeleteCategory();
    mockUploadCategoryImage = MockUploadCategoryImage();
    categoryBloc = CategoryBloc(
        getCategory: mockGetCategory,
        addCategory: mockAddCategory,
        updateCategory: mockUpdateCategory,
        deleteCategory: mockDeleteCategory,
        uploadCategoryImage: mockUploadCategoryImage);
  });

  group('Get Category', () {
    blocTest<CategoryBloc, CategoryState>(
      'Should get data from the getcategory usecase',
      build: (() => categoryBloc),
      setUp: () => when(mockGetCategory(any))
          .thenAnswer((_) async => Right(tListCategory)),
      act: (bloc) => bloc.add(GetCategoryEvent()),
      verify: (bloc) => mockGetCategory(NoParams()),
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, loaded] when data is gotten succesfully',
      build: (() => categoryBloc),
      setUp: () => when(mockGetCategory(any))
          .thenAnswer((_) async => Right(tListCategory)),
      act: (bloc) => bloc.add(GetCategoryEvent()),
      expect: () =>
          <CategoryState>[Loading(), Loaded(listCategory: tListCategory)],
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, error] when data remote is not gotten succesfully',
      build: (() => categoryBloc),
      setUp: () => when(mockGetCategory(any))
          .thenAnswer((_) async => Left(ServerFailure())),
      act: (bloc) => bloc.add(GetCategoryEvent()),
      expect: () =>
          <CategoryState>[Loading(), Error(message: SERVER_FAILURE_MESSAGE)],
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, error] when data local is not gotten succesfully',
      build: (() => categoryBloc),
      setUp: () => when(mockGetCategory(any))
          .thenAnswer((_) async => Left(CacheFailure())),
      act: (bloc) => bloc.add(GetCategoryEvent()),
      expect: () =>
          <CategoryState>[Loading(), Error(message: CACHE_FAILURE_MESSAGE)],
    );
  });

  group('Add Category', () {
    blocTest<CategoryBloc, CategoryState>(
      'Should get data from the getcategory usecase',
      build: (() => categoryBloc),
      setUp: () {
        when(mockUploadCategoryImage(any))
            .thenAnswer((_) async => Right('urlImage'));
        when(mockAddCategory(any))
            .thenAnswer((_) async => Right(tCategoryModel));
      },
      act: (bloc) => bloc.add(AddCategoryEvent(dataCategory: tCategoryModel)),
      verify: (bloc) =>
          mockAddCategory(AddCategoryParams(dataCategory: tCategoryModel)),
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, success] when add data is successful',
      build: (() => categoryBloc),
      setUp: () {
        when(mockUploadCategoryImage(any))
            .thenAnswer((_) async => Right('urlImage'));
        when(mockAddCategory(any))
            .thenAnswer((_) async => Right(tCategoryModel));
      },
      act: (bloc) => bloc.add(AddCategoryEvent(dataCategory: tCategoryModel)),
      expect: () => <CategoryState>[Loading(), Sucess()],
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, error] when add data to remote is not successful',
      build: (() => categoryBloc),
      setUp: () {
        when(mockUploadCategoryImage(any))
            .thenAnswer((_) async => Right('urlImage'));
        when(mockAddCategory(any))
            .thenAnswer((_) async => Left(ServerFailure()));
      },
      act: (bloc) => bloc.add(AddCategoryEvent(dataCategory: tCategoryModel)),
      expect: () =>
          <CategoryState>[Loading(), Error(message: SERVER_FAILURE_MESSAGE)],
    );
  });

  group('Update Category', () {
    group('when with images', () {
      blocTest<CategoryBloc, CategoryState>(
        'Should get data from the getcategory usecase',
        build: (() => categoryBloc),
        setUp: () {
          when(mockUploadCategoryImage(any))
              .thenAnswer((_) async => Right('urlImage'));
          when(mockUpdateCategory(any))
              .thenAnswer((_) async => Right(tCategoryModel));
        },
        act: (bloc) => bloc.add(UpdateCategoryEvent(
            dataCategory: tCategoryModel, withNewImage: true)),
        verify: (bloc) => mockUpdateCategory(
            UpdateCategoryParams(dataCategory: tCategoryModel)),
      );
      blocTest<CategoryBloc, CategoryState>(
        'Should emit [loading, success] when add data is successful',
        build: (() => categoryBloc),
        setUp: () {
          when(mockUploadCategoryImage(any))
              .thenAnswer((_) async => Right('urlImage'));
          when(mockUpdateCategory(any))
              .thenAnswer((_) async => Right(tCategoryModel));
        },
        act: (bloc) => bloc.add(UpdateCategoryEvent(
            dataCategory: tCategoryModel, withNewImage: true)),
        expect: () => <CategoryState>[Loading(), Sucess()],
      );
      blocTest<CategoryBloc, CategoryState>(
        'Should emit [loading, error] when add data to remote is not successful',
        build: (() => categoryBloc),
        setUp: () {
          when(mockUploadCategoryImage(any))
              .thenAnswer((_) async => Right('urlImage'));
          when(mockUpdateCategory(any))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        act: (bloc) => bloc.add(UpdateCategoryEvent(
            dataCategory: tCategoryModel, withNewImage: true)),
        expect: () =>
            <CategoryState>[Loading(), Error(message: SERVER_FAILURE_MESSAGE)],
      );
    });

    group('when without new image', () {
      blocTest<CategoryBloc, CategoryState>(
        'Should get data from the getcategory usecase',
        build: (() => categoryBloc),
        setUp: () {
          when(mockUploadCategoryImage(any))
              .thenAnswer((_) async => Right('urlImage'));
          when(mockUpdateCategory(any))
              .thenAnswer((_) async => Right(tCategoryModel));
        },
        act: (bloc) => bloc.add(UpdateCategoryEvent(
            dataCategory: tCategoryModel, withNewImage: false)),
        verify: (bloc) => mockUpdateCategory(
            UpdateCategoryParams(dataCategory: tCategoryModel)),
      );
      blocTest<CategoryBloc, CategoryState>(
        'Should emit [loading, success] when add data is successful',
        build: (() => categoryBloc),
        setUp: () {
          when(mockUploadCategoryImage(any))
              .thenAnswer((_) async => Right('urlImage'));
          when(mockUpdateCategory(any))
              .thenAnswer((_) async => Right(tCategoryModel));
        },
        act: (bloc) => bloc.add(UpdateCategoryEvent(
            dataCategory: tCategoryModel, withNewImage: false)),
        expect: () => <CategoryState>[Loading(), Sucess()],
      );
      blocTest<CategoryBloc, CategoryState>(
        'Should emit [loading, error] when add data to remote is not successful',
        build: (() => categoryBloc),
        setUp: () {
          when(mockUploadCategoryImage(any))
              .thenAnswer((_) async => Right('urlImage'));
          when(mockUpdateCategory(any))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        act: (bloc) => bloc.add(UpdateCategoryEvent(
            dataCategory: tCategoryModel, withNewImage: false)),
        expect: () =>
            <CategoryState>[Loading(), Error(message: SERVER_FAILURE_MESSAGE)],
      );
    });
  });

  group('Delete Category', () {
    final idKategori = 'ncu7v3k7keq3tmz99vEF';
    blocTest<CategoryBloc, CategoryState>(
      'Should get data from the getcategory usecase',
      build: (() => categoryBloc),
      setUp: () => when(mockDeleteCategory(any))
          .thenAnswer((_) async => Right(tListCategory)),
      act: (bloc) => bloc.add(DeleteCategoryEvent(id: idKategori)),
      verify: (bloc) =>
          mockDeleteCategory(DeleteCategoryParams(id: idKategori)),
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, success] when add data is successful',
      build: (() => categoryBloc),
      setUp: () => when(mockDeleteCategory(any))
          .thenAnswer((_) async => Right(tListCategory)),
      act: (bloc) => bloc.add(DeleteCategoryEvent(id: idKategori)),
      expect: () => <CategoryState>[Loading(), Sucess()],
    );
    blocTest<CategoryBloc, CategoryState>(
      'Should emit [loading, error] when add data to remote is not successful',
      build: (() => categoryBloc),
      setUp: () => when(mockDeleteCategory(any))
          .thenAnswer((_) async => Left(ServerFailure())),
      act: (bloc) => bloc.add(DeleteCategoryEvent(id: idKategori)),
      expect: () =>
          <CategoryState>[Loading(), Error(message: SERVER_FAILURE_MESSAGE)],
    );
  });
}
