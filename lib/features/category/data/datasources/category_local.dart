import 'dart:convert';

import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CategoryLocal {
  Future<List<CategoryModel>> getLastCategory();
  Future<void> cacheListCategory(List<CategoryModel> listCategoryToCache);
}

const CACHED_CATEGORY = 'CACHED_CATEGORY';

class CategoryLocalImpl implements CategoryLocal {
  final SharedPreferences sharedPreferences;

  CategoryLocalImpl({required this.sharedPreferences});
  @override
  Future<void> cacheListCategory(
      List<CategoryModel> listCategoryToCache) async {
    List<String> listCategoryEncoded = listCategoryToCache
        .map((category) => jsonEncode({
              "id": category.id,
              "image": category.image,
              "name": category.name,
              "createdAt": category.createdAt.toIso8601String(),
              "updatedAt": category.updatedAt.toIso8601String(),
            }))
        .toList();
    await sharedPreferences.setStringList(CACHED_CATEGORY, listCategoryEncoded);
  }

  @override
  Future<List<CategoryModel>> getLastCategory() async {
    final jsonString = await sharedPreferences.getStringList(CACHED_CATEGORY);
    if (jsonString != null) {
      List<CategoryModel> listCategory = [];
      jsonString.forEach((category) {
        final newCategory = jsonDecode(category);
        listCategory.add(CategoryModel(
            id: newCategory['id'],
            image: newCategory['image'],
            name: newCategory['name'],
            createdAt: DateTime.parse(newCategory['createdAt']),
            updatedAt: DateTime.parse(newCategory['updatedAt'])));
      });
      return Future.value(listCategory);
    } else {
      throw CacheException();
    }
  }
}
