import 'package:gestion_de_stock_flutter/data/database/app_database.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final AppDatabase database;

  ProductRepositoryImpl(this.database);

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      return await database.productDao.getAllProducts();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  @override
  Future<void> addProduct(Product product) async {
    try {
      await database.productDao.insertProduct(product);
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      final product = await database.productDao.getProductById(id);
      if (product != null) {
        await database.productDao.deleteProduct(product);
      }
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  /// Additional method: Update product
  Future<void> updateProduct(Product product) async {
    try {
      await database.productDao.updateProduct(product);
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }

  /// Additional method: Get product by id
  Future<Product?> getProductById(String id) async {
    try {
      return await database.productDao.getProductById(id);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }
}
