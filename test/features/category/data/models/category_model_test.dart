import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';

void main() {
  final tCategoryModel = CategoryModel(
      image: 'image.jpg',
      name: 'Sweater',
      createdAt: Timestamp(1674295838, 392000000).toDate(),
      updatedAt: Timestamp(1674295838, 392000000).toDate());

  test('Should a subclass of the category entity', () {
    //assert
    expect(tCategoryModel, isA<Category>());
  });

  group('fromJson', () {
    test('Should return a valid category model', () {
      //act
      final Map<String, dynamic> jsonMap = {
        "image": "image.jpg",
        "name": "Sweater",
        "createdAt": Timestamp(1674295838, 392000000),
        "updatedAt": Timestamp(1674295838, 392000000),
      };
      final result = CategoryModel.fromJson(jsonMap);
      //assert
      expect(result, equals(tCategoryModel));
    });
  });
  group('toJson', () {
    test('Should return map from category model', () {
      //arrange
      //act

      final result = tCategoryModel.toJson();
      //assert
      final Map<String, dynamic> expectedMap = {
        "image": "image.jpg",
        "name": "Sweater",
        "createdAt": Timestamp(1674295838, 392000000).toDate(),
        "updatedAt": Timestamp(1674295838, 392000000).toDate(),
      };
      expect(result, equals(expectedMap));
    });
  });
}
