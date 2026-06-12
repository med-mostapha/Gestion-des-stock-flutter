import 'package:flutter/material.dart';
import '../data/models/category_model.dart';
import '../data/services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _service = CategoryService();

  List<Category> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _categories = await _service.getAllCategories();
    } catch (e) {
      _error = "Failed to load categories";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> addCategory(String name, String? description) async {
    _isLoading = true;
    notifyListeners();
    try {
      final newCategory = await _service.addCategory(name, description);
      _categories.add(newCategory);
      _error = null;
      return null; // ok
    } catch (e) {
      return "Failed to create category on server";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> updateCategory(
    int id,
    String name,
    String? description,
  ) async {
    try {
      final updated = await _service.updateCategory(id, name, description);
      final index = _categories.indexWhere((c) => c.id == id);
      if (index != -1) {
        _categories[index] = updated;
        notifyListeners();
      }
      return null;
    } catch (e) {
      return "Failed to update category";
    }
  }

  Future<String?> deleteCategory(int id) async {
    try {
      await _service.deleteCategory(id);
      _categories.removeWhere((c) => c.id == id);
      notifyListeners();
      return null;
    } catch (e) {
      return "Failed to delete category";
    }
  }

  int get totalCategories => _categories.length;
}
