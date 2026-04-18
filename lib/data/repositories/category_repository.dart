import 'package:gestion_de_stock_flutter/data/models/category_model.dart';

import '../dummy/dummy_data.dart';

class CategoryRepository {
  List<Category> getAllCategories() {
    return DummyData.categories;
  }

  List<Category> getCategoryByCategory(String categoryId) {
    return DummyData.categories.where((p) => p.id == categoryId).toList();
  }
}
