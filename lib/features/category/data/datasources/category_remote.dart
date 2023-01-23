import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';

abstract class CategoryRemote {
  Future<List<CategoryModel>> getCategory();
  Future<void> addCategory(CategoryModel dataCategory);
  Future<void> updateCategory(CategoryModel dataCategory);
  Future<void> deleteCategory(String id);
}

const CATEGORY_COLLECTION_NAME = 'category';

class CategoryRemoteImpl implements CategoryRemote {
  final FirebaseFirestore db;

  CategoryRemoteImpl({required this.db});

  @override
  Future<List<CategoryModel>> getCategory() async {
    try {
      final response = await db.collection(CATEGORY_COLLECTION_NAME).get();
      final List<CategoryModel> listCategory = response.docs
          .map((category) => CategoryModel.fromJson(category.data()))
          .toList();
      return listCategory;
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<void> addCategory(CategoryModel dataCategory) async {
    try {
      await db
          .collection(CATEGORY_COLLECTION_NAME)
          .doc(dataCategory.id)
          .set(dataCategory.toJson());
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<void> updateCategory(CategoryModel dataCategory) async {
    try {
      await db
          .collection(CATEGORY_COLLECTION_NAME)
          .doc(dataCategory.id)
          .update(dataCategory.toJson());
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      final result =
          await db.collection(CATEGORY_COLLECTION_NAME).doc(id).get();
      if (result.exists) {
        db.collection(CATEGORY_COLLECTION_NAME).doc(id).delete();
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }
}
