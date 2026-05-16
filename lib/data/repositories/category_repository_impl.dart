import 'package:gestion_de_stock_flutter/data/database/app_database.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final AppDatabase database;

  CategoryRepositoryImpl(this.database);

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      return await database.categoryDao.getAllCategories();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  @override
  Future<void> addCategory(Category category) async {
    try {
      await database.categoryDao.insertCategory(category);
    } catch (e) {
      throw Exception('Failed to add category: $e');
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      final category = await database.categoryDao.getCategoryById(id);
      if (category != null) {
        await database.categoryDao.deleteCategory(category);
      }
    } catch (e) {
      throw Exception('Failed to delete category: $e');
    }
  }

  /// Additional method: Update category
  Future<void> updateCategory(Category category) async {
    try {
      await database.categoryDao.updateCategory(category);
    } catch (e) {
      throw Exception('Failed to update category: $e');
    }
  }

  /// Additional method: Get category by id
  Future<Category?> getCategoryById(String id) async {
    try {
      return await database.categoryDao.getCategoryById(id);
    } catch (e) {
      throw Exception('Failed to fetch category: $e');
    }
  }
}
