import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';
import 'package:portfolio/features/category/domain/usecases/add_category.dart';

import 'get_category_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryRepository>()])
void main() {
  late AddCategory usecase;
  late MockCategoryRepository mockCategoryRepository;
  late Category tCategory;
  late CategoryModel tCategoryModel;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = AddCategory(repository: mockCategoryRepository);
    tCategory = Category(
        image: 'image.jpg',
        name: 'Sweater',
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 1),
        id: 'ncu7v3k7keq3tmz99vEF');
    tCategoryModel = CategoryModel(
        image: 'image.jpg',
        name: 'Sweater',
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 1),
        id: 'ncu7v3k7keq3tmz99vEF');
  });

  test('Should add data from the repository', () async {
    //arrange
    when(mockCategoryRepository.addCategory(dataCategory: tCategoryModel))
        .thenAnswer((_) async => right(tCategory));
    //act
    final result =
        await usecase(AddCategoryParams(dataCategory: tCategoryModel));
    //assert
    expect(result, Right(tCategory));
    verify(mockCategoryRepository.addCategory(dataCategory: tCategoryModel));
    verifyNoMoreInteractions(mockCategoryRepository);
  });
}
