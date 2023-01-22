import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/repositories/category_repository.dart';
import 'package:portfolio/features/category/domain/usecases/delete_category.dart';

import 'get_category_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryRepository>()])
void main() {
  late DeleteCategory usecase;
  late MockCategoryRepository mockCategoryRepository;
  late Category tCategory;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = DeleteCategory(repository: mockCategoryRepository);
    tCategory = Category(
        image: 'image.jpg',
        name: 'Sweater',
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 1));
  });

  test('Should delete data from the repository', () async {
    //arrange
    when(mockCategoryRepository.deleteCategory(id: '1'))
        .thenAnswer((_) async => Right(tCategory));
    //act
    final result = await usecase(CategoryParams('1'));
    //assert
    expect(result, Right(tCategory));
    verify(mockCategoryRepository.deleteCategory(id: '1'));
    verifyNoMoreInteractions(mockCategoryRepository);
  });
}
