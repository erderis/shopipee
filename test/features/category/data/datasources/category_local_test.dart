import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/features/category/data/datasources/category_local.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../overview/data/datasources/traffic_local_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late CategoryLocalImpl local;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    local = CategoryLocalImpl(sharedPreferences: mockSharedPreferences);
  });

  group('Get Last Data', () {
    final tListCategoryModel = [
      CategoryModel(
          image: 'image.jpg',
          name: 'Sweater',
          createdAt: Timestamp(1674295838, 392000000).toDate(),
          updatedAt: Timestamp(1674295838, 392000000).toDate(),
          id: 'ncu7v3k7keq3tmz99vEF')
    ];
    test('Should get last data category from saved data shared preferences',
        () async {
      //arrange
      List<String> listCategoryEncoded = tListCategoryModel
          .map((category) => jsonEncode({
                "id": category.id,
                "image": category.image,
                "name": category.name,
                "createdAt": category.createdAt.toIso8601String(),
                "updatedAt": category.updatedAt.toIso8601String(),
              }))
          .toList();

      when(mockSharedPreferences.getStringList(any))
          .thenReturn(listCategoryEncoded);
      //act
      final result = await local.getLastCategory();
      //assert
      expect(result, equals(tListCategoryModel));
    });

    test(
        'Should throw Cache Exception when get last data category from local unsuccessful / not present',
        () async {
      //arrange

      //act

      //assert
    });
  });

  group('cache data', () {
    final tListCategoryModel = [
      CategoryModel(
          image: 'image.jpg',
          name: 'Sweater',
          createdAt: Timestamp(1674295838, 392000000).toDate(),
          updatedAt: Timestamp(1674295838, 392000000).toDate(),
          id: 'ncu7v3k7keq3tmz99vEF')
    ];
    test('Should cache data category to shared preferences', () async {
      //act
      await local.cacheListCategory(tListCategoryModel);
      //assert
      List<String> listCategoryEncoded = tListCategoryModel
          .map((category) => jsonEncode({
                "id": category.id,
                "image": category.image,
                "name": category.name,
                "createdAt": category.createdAt.toIso8601String(),
                "updatedAt": category.updatedAt.toIso8601String(),
              }))
          .toList();
      verify(mockSharedPreferences.setStringList(
          CACHED_CATEGORY, listCategoryEncoded));
    });
  });
}
