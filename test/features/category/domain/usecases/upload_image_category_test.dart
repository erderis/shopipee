import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/features/category/domain/repositories/category_image_repository.dart';
import 'package:portfolio/features/category/domain/usecases/upload_category_image.dart';

import 'upload_image_category_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CategoryImageRepository>()])
void main() {
  late UploadCategoryImage usecase;
  late MockCategoryImageRepository mockCategoryImageRepository;

  final tFilePath = 'filepath';
  final tImageURL = 'imageURL';

  setUp(() {
    mockCategoryImageRepository = MockCategoryImageRepository();
    usecase = UploadCategoryImage(repository: mockCategoryImageRepository);
  });

  test('Should get data from the repository', () async {
    //arrange
    when(mockCategoryImageRepository.uploadImage(filePath: tFilePath))
        .thenAnswer((_) async => Right(tImageURL));
    //act
    final result =
        await usecase(UploadCategoriImageParams(filePath: tFilePath));
    //assert
    verify(mockCategoryImageRepository.uploadImage(filePath: tFilePath));
    expect(result, Right(tImageURL));
    verifyNoMoreInteractions(mockCategoryImageRepository);
  });
}
