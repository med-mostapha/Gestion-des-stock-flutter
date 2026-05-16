import 'package:floor/floor.dart';

@Entity(tableName: "products")
class Product {
  @PrimaryKey()
  final String id;

  final String name;
  final double price;
  final int stock;
  final int minStock;

  @ColumnInfo(name: 'category_id')
  final String categoryId;

  @ColumnInfo(name: 'created_at')
  final String createdAt;  // ← String بدل DateTime

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.minStock,
    required this.categoryId,
    required this.createdAt,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    int? stock,
    int? minStock,
    String? categoryId,
    String? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      minStock: minStock ?? this.minStock,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'minStock': minStock,
      'categoryId': categoryId,
      'createdAt': createdAt,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int,
      minStock: json['minStock'] as int,
      categoryId: json['categoryId'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, stock: $stock, minStock: $minStock, categoryId: $categoryId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          stock == other.stock &&
          minStock == other.minStock &&
          categoryId == other.categoryId &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      stock.hashCode ^
      minStock.hashCode ^
      categoryId.hashCode ^
      createdAt.hashCode;
}
