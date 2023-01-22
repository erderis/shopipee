import 'package:portfolio/features/category/data/models/category_model.dart';

abstract class CategoryLocal {
  Future<List<CategoryModel>> getLastCategory();
  Future<void> cacheCategory(List<CategoryModel> categoryToCache);
}
