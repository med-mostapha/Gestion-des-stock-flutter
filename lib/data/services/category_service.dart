import 'package:gestion_de_stock_flutter/core/network/api_client.dart';
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';

class CategoryService implements CategoryRepository {
  static final ApiClient _client = ApiClient();

  @override
  Future<List<Category>> getAllCategories() async {
    final data = await _client.get(ApiEndpoints.categories);
    return (data as List).map((e) => Category.fromJson(e)).toList();
  }

  @override
  Future<Category> addCategory(String name, String? description) async {
    final data = await _client.post(ApiEndpoints.categories, {
      'name': name,
      if (description != null && description.isNotEmpty)
        'description': description,
    });
    return Category.fromJson(data);
  }

  @override
  Future<Category> updateCategory(
    int id,
    String name,
    String? description,
  ) async {
    final data = await _client.put(ApiEndpoints.categoryById(id), {
      'name': name,
      if (description != null && description.isNotEmpty)
        'description': description,
    });
    return Category.fromJson(data);
  }

  @override
  Future<void> deleteCategory(int id) async {
    await _client.delete(ApiEndpoints.categoryById(id));
  }
}
