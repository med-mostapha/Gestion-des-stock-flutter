import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/dashboard_provider.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/stats_card.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/today_movements_card.dart';
import 'package:gestion_de_stock_flutter/widgets/charts/category_percentage_pie_chart.dart';
import 'package:gestion_de_stock_flutter/widgets/charts/category_stock_bar_chart.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => context.read<DashboardProvider>().refresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Stats Grid
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: provider.isLoading
                  ? List.generate(4, (_) => _buildCardSkeleton())
                  : provider.hasError
                  ? List.generate(4, (_) => _buildCardError())
                  : provider.hasData
                  ? [
                      StatsCard(
                        title: S.of(context).dashboard_products,
                        subtitle: '',
                        value: provider.stats!.totalProducts.toDouble(),
                        icon: Icons.inventory,
                        iconbg: AppColors.primary,
                      ),
                      StatsCard(
                        title: S.of(context).dashboard_categories,
                        subtitle: '',
                        value: provider.stats!.totalCategories.toDouble(),
                        icon: Icons.category,
                        iconbg: CupertinoColors.activeOrange,
                      ),
                      StatsCard(
                        title: S.of(context).detail_stock_info,
                        subtitle: 'MRU',
                        value: provider.stats!.totalInventoryValue,
                        icon: Icons.account_balance_wallet,
                        iconbg: AppColors.success,
                      ),
                      StatsCard(
                        title: S.of(context).common_low_stock,
                        subtitle: 'alert',
                        value: provider.stats!.lowStockProductsCount.toDouble(),
                        icon: Icons.warning_amber_rounded,
                        iconbg: CupertinoColors.systemRed,
                      ),
                    ]
                  : List.generate(4, (_) => _buildCardSkeleton()),
            ),

            const SizedBox(height: 16),

            //  Today's Movements
            provider.isLoading
                ? _buildChartSkeleton(height: 110)
                : provider.hasData
                ? TodayMovementsCard(
                    inCount: provider.stats!.todayInMovements,
                    outCount: provider.stats!.todayOutMovements,
                  )
                : const SizedBox.shrink(),

            const SizedBox(height: 16),

            //  Error Banner
            if (provider.hasError) _buildErrorBanner(context, provider),

            //  Bar Chart
            provider.isLoading
                ? _buildChartSkeleton(height: 250)
                : provider.hasData
                ? CategoryStockBarChart(
                    data: provider.stats!.categoryStockPercentages,
                  )
                : const SizedBox.shrink(),

            const SizedBox(height: 16),

            //  Pie Chart
            provider.isLoading
                ? _buildChartSkeleton(height: 200)
                : provider.hasData
                ? CategoryPercentagePieChart(
                    data: provider.stats!.categoryStockPercentages,
                  )
                : const SizedBox.shrink(),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSkeleton() {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildCardError() {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.2)),
      ),
      child: const Center(
        child: Icon(Icons.error_outline, color: AppColors.error, size: 24),
      ),
    );
  }

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

  Widget _buildErrorBanner(BuildContext context, DashboardProvider provider) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              provider.errorMessage ?? 'Something went wrong',
              style: const TextStyle(color: AppColors.error, fontSize: 13),
            ),
          ),
          TextButton(
            onPressed: () => context.read<DashboardProvider>().refresh(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
