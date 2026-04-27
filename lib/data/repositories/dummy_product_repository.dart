import 'package:gestion_de_stock_flutter/data/dummy/dummy_data.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';

class DummyProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getAllProducts() async {
    return DummyData.products;
  }

  @override
  Future<void> addProduct(Product product) async {
    DummyData.products.add(product);
  }

  @override
  Future<void> deleteProduct(String id) async {
    DummyData.products.removeWhere((p) => p.id == id);
  }
}
