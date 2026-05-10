class Product {
  final String id;
  final String name;
  final double price;
  final int stock;
  final int minStock;
  final String categoryId;
  final DateTime createdAt;
  final String? supplierId;
  final String? sku;
  final String? image;
  final bool? isActive;
  final DateTime? updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.minStock,
    required this.categoryId,
    required this.createdAt,
    this.supplierId,
    this.sku,
    this.image,
    this.isActive,
    this.updatedAt,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    int? stock,
    int? minStock,
    String? categoryId,
    DateTime? createdAt,
    String? supplierId,
    String? sku,
    String? image,
    bool? isActive,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      minStock: minStock ?? this.minStock,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      supplierId: supplierId ?? this.supplierId,
      sku: sku ?? this.sku,
      image: image ?? this.image,
      isActive: isActive ?? this.isActive,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
