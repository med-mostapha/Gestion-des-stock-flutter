import 'package:floor/floor.dart';
import '../../models/product_model.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM products')
  Future<List<Product>> getAllProducts();

  @Query('SELECT * FROM products WHERE id = :id')
  Future<Product?> getProductById(String id);

  @insert
  Future<void> insertProduct(Product product);

  @update
  Future<void> updateProduct(Product product);

  @delete
  Future<void> deleteProduct(Product product);
}
