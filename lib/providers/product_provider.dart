import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../data/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _service.getAllProducts();
    } catch (e) {
      _error = "Failed to load products from server";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  int get totalProducts => _products.length;

  int get lowStockCount =>
      _products.where((p) => p.stock <= p.minStock && p.stock > 0).length;

  int get outOfStockCount => _products.where((p) => p.stock <= 0).length;

  double get totalStockValue =>
      _products.fold(0, (sum, p) => sum + (p.price * p.stock));

  Future<String?> addProduct(Product product) async {
    try {
      final newProduct = await _service.createProduct(product);
      _products.add(newProduct);
      notifyListeners();
      return null;
    } catch (e) {
      return "Failed to add product to server";
    }
  }

  Future<String?> updateProduct(int id, Product updatedProduct) async {
    try {
      final updated = await _service.updateProduct(id, updatedProduct);
      final index = _products.indexWhere((p) => p.id == id);
      if (index != -1) {
        _products[index] = updated;
        notifyListeners();
      }
      return null;
    } catch (e) {
      return "Failed to update product on server";
    }
  }

  Future<String?> deleteProduct(int id) async {
    try {
      await _service.deleteProduct(id);
      _products.removeWhere((p) => p.id == id);
      notifyListeners();
      return null;
    } catch (e) {
      return "Failed to delete product from server";
    }
  }

  List<Product> search(String query) {
    return _products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
