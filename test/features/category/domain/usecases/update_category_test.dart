import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';
import 'package:portfolio/features/category/domain/usecases/update_category.dart';

import 'get_category_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryRepository>()])
void main() {
  late UpdateCategory usecase;
  late MockCategoryRepository mockCategoryRepository;
  late Category tCategory;
  late CategoryModel tCategoryModel;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = UpdateCategory(repository: mockCategoryRepository);
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

  test('Should update data from the repository', () async {
    //arrange
    when(mockCategoryRepository.updateCategory(dataCategory: tCategoryModel))
        .thenAnswer((_) async => Right(tCategory));
    //act
    final result = await usecase(UpdateCategoryParams(tCategoryModel));
    //assert
    expect(result, Right(tCategory));
    verify(mockCategoryRepository.updateCategory(dataCategory: tCategoryModel));
    verifyNoMoreInteractions(mockCategoryRepository);
  });
}
