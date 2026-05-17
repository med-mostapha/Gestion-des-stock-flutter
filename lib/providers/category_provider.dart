import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepository _repository;

  List<Category> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  CategoryProvider(this._repository);

  /// Load all categories from database
  Future<void> loadCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _categories = await _repository.getAllCategories();
    } catch (e) {
      _error = "Failed to load categories: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addCategory(Category category) async {
    try {
      await _repository.addCategory(category);
      _categories.add(category);
      notifyListeners();
    } catch (e) {
      _error = "Failed to add category: $e";
      notifyListeners();
    }
  }

  Future<void> updateCategory(String id, Category updatedCategory) async {
    try {
      await _repository.updateCategory(updatedCategory);
      final index = _categories.indexWhere((c) => c.id == id);
      if (index != -1) {
        _categories[index] = updatedCategory;
        notifyListeners();
      }
    } catch (e) {
      _error = "Failed to update category: $e";
      notifyListeners();
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _repository.deleteCategory(id);
      _categories.removeWhere((c) => c.id == id);
      notifyListeners();
    } catch (e) {
      _error = "Failed to delete category: $e";
      notifyListeners();
    }
  }

  int get totalCategories => _categories.length;
}
