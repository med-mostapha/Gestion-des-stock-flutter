import 'package:gestion_de_stock_flutter/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<void> addProduct(Product product);
  Future<void> deleteProduct(String id);
}
