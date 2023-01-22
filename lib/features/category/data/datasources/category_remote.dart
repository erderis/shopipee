import 'package:portfolio/features/category/data/models/category_model.dart';

abstract class CategoryRemote {
  Future<List<CategoryModel>> getCategory();
  Future<void> addCategory();
  Future<CategoryModel> updateCategory(String id);
  Future<CategoryModel> deleteCategory(String id);
}
