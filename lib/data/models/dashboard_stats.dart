class DashboardStats {
  final int totalProducts;
  final int totalCategories;
  final int totalSuppliers;
  final double totalInventoryValue;
  final int lowStockProductsCount;
  final int todayInMovements;
  final int todayOutMovements;
  final Map<String, double> categoryStockPercentages;

  DashboardStats({
    required this.totalProducts,
    required this.totalCategories,
    required this.totalSuppliers,
    required this.totalInventoryValue,
    required this.lowStockProductsCount,
    required this.todayInMovements,
    required this.todayOutMovements,
    required this.categoryStockPercentages,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      totalProducts: (json['totalProducts'] as num).toInt(),
      totalCategories: (json['totalCategories'] as num).toInt(),
      totalSuppliers: (json['totalSuppliers'] as num).toInt(),
      totalInventoryValue: (json['totalInventoryValue'] as num).toDouble(),
      lowStockProductsCount: (json['lowStockProductsCount'] as num).toInt(),
      todayInMovements: (json['todayInMovements'] as num).toInt(),
      todayOutMovements: (json['todayOutMovements'] as num).toInt(),
      categoryStockPercentages:
          (json['categoryStockPercentages'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, (value as num).toDouble()),
          ),
    );
  }
}
