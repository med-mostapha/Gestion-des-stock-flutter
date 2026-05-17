import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/stats_card.dart';
import '../../../widgets/charts/category_percentage_pie_chart.dart';
import '../../../widgets/charts/category_stock_bar_chart.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    // Load data on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  /// Load products and categories from database
  Future<void> _loadData() async {
    if (mounted) {
      await context.read<ProductProvider>().loadProducts();
      await context.read<CategoryProvider>().loadCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final categoryProvider = context.watch<CategoryProvider>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              productProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: S.of(context).dashboard_products,
                      subtitle: "",
                      value: productProvider.totalProducts.toDouble(),
                      icon: Icons.inventory,
                      iconbg: AppColors.primary,
                    ),
              categoryProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: S.of(context).dashboard_categories,
                      subtitle: "",
                      value: categoryProvider.totalCategories.toDouble(),
                      icon: Icons.category,
                      iconbg: CupertinoColors.activeOrange,
                    ),
              productProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: S.of(context).detail_stock_info,
                      subtitle: "MRU",
                      value: productProvider.totalStockValue,
                      icon: Icons.account_balance_wallet,
                      iconbg: AppColors.success,
                    ),
              productProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: S.of(context).common_low_stock,
                      subtitle: "alert",
                      value: productProvider.lowStockCount.toDouble(),
                      icon: Icons.warning_amber_rounded,
                      iconbg: CupertinoColors.systemRed,
                    ),
            ],
          ),

          const SizedBox(height: 20),

          productProvider.isLoading || categoryProvider.isLoading
              ? _buildChartSkeleton(height: 250)
              : productProvider.products.isEmpty
              ? _buildEmptyState()
              : CategoryStockBarChart(
                  products: productProvider.products,
                  categories: categoryProvider.categories,
                ),

          const SizedBox(height: 16),

          productProvider.isLoading || categoryProvider.isLoading
              ? _buildChartSkeleton(height: 200)
              : productProvider.products.isEmpty
              ? _buildEmptyState()
              : CategoryPercentagePieChart(
                  products: productProvider.products,
                  categories: categoryProvider.categories,
                ),
        ],
      ),
    );
  }

  /// Skeleton loader for card
  Widget _buildCardSkeleton() {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// Skeleton loader for chart
  Widget _buildChartSkeleton({required double height}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// Empty state when no data
  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          S.of(context).products_empty,
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ),
    );
  }
}
