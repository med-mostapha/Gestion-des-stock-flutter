import 'package:gestion_de_stock_flutter/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();
  Future<Category> addCategory(String name, String? description);
  Future<Category> updateCategory(int id, String name, String? description);
  Future<void> deleteCategory(int id);
}
