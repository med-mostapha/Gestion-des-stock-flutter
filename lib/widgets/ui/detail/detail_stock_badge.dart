import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';

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
    final s = S.of(context);
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

    // Use localized strings with arguments
    final String label = isOut
        ? s.stock_status_out
        : isLow
        ? s.stock_status_low(stock)
        : s.stock_status_in(stock);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
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
            "${s.detail_alert_level}: $minStock", // Localized "Min"
            style: TextStyle(color: color.withValues(alpha: 0.8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
