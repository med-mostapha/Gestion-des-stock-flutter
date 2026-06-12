import 'package:gestion_de_stock_flutter/core/network/api_client.dart';
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';

class ProductService {
  static final ApiClient _client = ApiClient();

  Future<List<Product>> getAllProducts() async {
    final data = await _client.get(ApiEndpoints.products);

    if (data is Map<String, dynamic> && data.containsKey('content')) {
      final List list = data['content'] as List;
      return list.map((e) => Product.fromJson(e)).toList();
    }

    return [];
  }

  Future<Product> createProduct(Product product) async {
    final data = await _client.post(ApiEndpoints.products, product.toJson());
    return Product.fromJson(data);
  }

  Future<Product> updateProduct(int id, Product product) async {
    final data = await _client.put(
      '${ApiEndpoints.products}/$id',
      product.toJson(),
    );
    return Product.fromJson(data);
  }

  Future<void> deleteProduct(int id) async {
    await _client.delete('${ApiEndpoints.products}/$id');
  }
}
