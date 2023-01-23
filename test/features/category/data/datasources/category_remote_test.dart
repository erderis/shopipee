import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/category/data/datasources/category_remote.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';

void main() {
  final instance = FakeFirebaseFirestore();
  late CategoryRemoteImpl remote;

  final tCategoryModel = CategoryModel(
      image: 'image.jpg',
      name: 'Sweater',
      createdAt: Timestamp(1674295838, 392000000).toDate(),
      updatedAt: Timestamp(1674295838, 392000000).toDate(),
      id: 'ncu7v3k7keq3tmz99vEF');

  final Map<String, dynamic> jsonMap = {
    "image": "image.jpg",
    "name": "Sweater",
    "createdAt": Timestamp(1674295838, 392000000),
    "updatedAt": Timestamp(1674295838, 392000000),
    "id": "ncu7v3k7keq3tmz99vEF"
  };

  setUp(() {
    remote = CategoryRemoteImpl(db: instance);
  });

  group('GetCategory', () {
    final tListCategoryModel = [tCategoryModel];
    test('Should return List CategoryModel when get data successful', () async {
      //arrange

      await instance.collection(CATEGORY_COLLECTION_NAME).add(jsonMap);
      //act
      final result = await remote.getCategory();
      //assert
      expect(result, equals(tListCategoryModel));
    });

    test(
        'Should throw ServerException data from remote is empty / data type is not proper',
        () async {
      //arrange
      await instance.collection(CATEGORY_COLLECTION_NAME).add({});
      //act
      final call = remote.getCategory;
      //assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });

    //what is firestore exception class?
    // test('Should throw ServerException get data unsuccesful', () async {
    //   //arrange
    // when(instance.collection(CATEGORY_COLLECTION_NAME).add(jsonMap))
    //     .thenThrow(FirebaseException); is that true???
    //   //act
    //   final call = remote.getCategory;
    //   //assert
    //   expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    // });
  });

  group('AddCategory', () {
    test('Should return CategoryModel when add data successful', () async {
      //act
      await remote.addCategory(tCategoryModel);
      //assert
      // verify(instance.collection(CATEGORY_COLLECTION_NAME).add(jsonMap));
    });

    //what is firestore exception class?
    // test('Should throw ServerException add data unsuccesful', () async {
    // arrange
    // when(instance.collection(CATEGORY_COLLECTION_NAME).add(jsonMap))
    //     .thenThrow(FirebaseException); is that true???
    //act
    // final call = remote.addCategory;
    //assert
    // expect(() => call(tCategoryModel), throwsA(const TypeMatcher<ServerException>()));
    // });
  });

  group('UpdateCategory', () {
    test('Should return CategoryModel when update data successful', () async {
      //arrange
      final Map<String, dynamic> jsonMap = {
        "image": "image.jpg",
        "name": "Sweater",
        "createdAt": Timestamp(1674295838, 392000000),
        "updatedAt": Timestamp(1674295838, 392000000),
        "id": "ncu7v3k7keq3tmz99vEF"
      };
      await instance
          .collection(CATEGORY_COLLECTION_NAME)
          .doc('ncu7v3k7keq3tmz99vEF')
          .set(jsonMap);
      //act
      await remote.updateCategory(tCategoryModel);
      //assert
      // verify(instance
      //     .collection(CATEGORY_COLLECTION_NAME)
      //     .doc('ncu7v3k7keq3tmz99vEF')
      //     .update(jsonMap));
    });

    test('Should throw ServerException get update unsuccesful', () async {
      // act
      final call = await remote.updateCategory;
      // assert
      expect(() => call(tCategoryModel),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group('DeleteCategory', () {
    test('Should return CategoryModel when delete data successful', () async {
      //arrange
      final Map<String, dynamic> jsonMap = {
        "image": "image.jpg",
        "name": "Sweater",
        "createdAt": Timestamp(1674295838, 392000000),
        "updatedAt": Timestamp(1674295838, 392000000),
        "id": "ncu7v3k7keq3tmz99vEF"
      };
      await instance
          .collection(CATEGORY_COLLECTION_NAME)
          .doc('ncu7v3k7keq3tmz99vEF')
          .set(jsonMap);
      //act
      await remote.deleteCategory('ncu7v3k7keq3tmz99vEF');
      //assert
      // verify(instance.doc('ncu7v3k7keq3tmz99vEF').delete());
    });

    test('Should throw ServerException get delete unsuccesful', () async {
      // act
      final call = await remote.deleteCategory;
      // assert
      expect(
          () => call('nodata'), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
