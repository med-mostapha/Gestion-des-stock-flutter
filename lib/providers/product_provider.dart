import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository;

  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  ProductProvider(this._repository);

  Future<void> loadProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _repository.getAllProducts();
    } catch (e) {
      _error = "Failed to load products: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await _repository.addProduct(product);
      _products.add(product);
      notifyListeners();
    } catch (e) {
      _error = "Failed to add product: $e";
      notifyListeners();
    }
  }

  Future<void> updateProduct(String id, Product updatedProduct) async {
    try {
      await _repository.updateProduct(updatedProduct);
      final index = _products.indexWhere((p) => p.id == id);
      if (index != -1) {
        _products[index] = updatedProduct;
        notifyListeners();
      }
    } catch (e) {
      _error = "Failed to update product: $e";
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _repository.deleteProduct(id);
      _products.removeWhere((p) => p.id == id);
      notifyListeners();
    } catch (e) {
      _error = "Failed to delete product: $e";
      notifyListeners();
    }
  }

  List<Product> search(String query) {
    return _products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  int get totalProducts => _products.length;

  int get lowStockCount =>
      _products.where((p) => p.stock <= p.minStock && p.stock > 0).length;

  int get outOfStockCount => _products.where((p) => p.stock <= 0).length;

  double get totalStockValue =>
      _products.fold(0, (sum, p) => sum + (p.price * p.stock));
}
