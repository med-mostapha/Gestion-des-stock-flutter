class Product {
  final int id;
  final String name;
  final double price;
  final int stock;
  final int minStock;
  final int categoryId;
  final String? categoryName;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.minStock,
    required this.categoryId,
    this.categoryName,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      minStock: (json['minStock'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'stock': stock,
      'minStock': minStock,
      'categoryId': categoryId,
    };
  }
}
