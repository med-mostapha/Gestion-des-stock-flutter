import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';

class AnalyticsService {
  static double getTotalStockValue(List<Product> products) {
    return products.fold(0, (sum, p) => sum + (p.price * p.stock));
  }

  static double getTotalStockValueByCategory(
    List<Product> products,
    String categoryId,
  ) {
    return products
        .where((p) => p.categoryId == categoryId)
        .fold(0, (sum, p) => sum + (p.price * p.stock));
  }

  //  exp : { "Electronics": 1200.0, "Food": 300.0 }
  static Map<String, double> getStockValuePerCategory(
    List<Product> products,
    List<Category> categories,
  ) {
    final Map<String, double> result = {};

    for (final category in categories) {
      result[category.name] = getTotalStockValueByCategory(
        products,
        category.id,
      );
    }

    return result;
  }

  static List<Product> getLowStockProducts(List<Product> products) {
    return products.where((p) => p.stock <= p.minStock && p.stock > 0).toList();
  }

  static List<Product> getOutOfStockProducts(List<Product> products) {
    return products.where((p) => p.stock <= 0).toList();
  }

  static Product? getMostExpensiveProduct(List<Product> products) {
    if (products.isEmpty) return null;
    return products.reduce((a, b) => a.price > b.price ? a : b);
  }
}
