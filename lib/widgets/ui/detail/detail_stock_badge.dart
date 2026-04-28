import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';

class DetailStockBadge extends StatelessWidget {
  final int stock;
  final int minStock;

  const DetailStockBadge({
    super.key,
    required this.stock,
    required this.minStock,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOut = stock <= 0;
    final bool isLow = stock <= minStock && !isOut;

    final Color color = isOut
        ? AppColors.error
        : isLow
        ? AppColors.warning
        : AppColors.success;

    final IconData icon = isOut
        ? Icons.remove_circle_outline
        : isLow
        ? Icons.warning_amber_rounded
        : Icons.check_circle_outline;

    final String label = isOut
        ? "Out of Stock"
        : isLow
        ? "Low Stock — $stock left"
        : "In Stock — $stock units";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        // color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            "Min: $minStock",
            style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
