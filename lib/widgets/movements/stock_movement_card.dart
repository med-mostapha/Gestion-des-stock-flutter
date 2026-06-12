import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/stock_movement_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';

class StockMovementCard extends StatelessWidget {
  final StockMovement movement;
  final VoidCallback? onTap;

  const StockMovementCard({super.key, required this.movement, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color typeColor;
    final IconData typeIcon;
    final String quantitySign;

    switch (movement.type) {
      case StockMovementType.IN:
        typeColor = AppColors.success;
        typeIcon = Icons.arrow_downward_rounded;
        quantitySign = '+';
        break;
      case StockMovementType.OUT:
        typeColor = AppColors.error;
        typeIcon = Icons.arrow_upward_rounded;
        quantitySign = '-';
        break;
      case StockMovementType.ADJUSTMENT:
        typeColor = Colors.orange;
        typeIcon = Icons.tune_rounded;
        quantitySign = '±';
        break;
    }

    final String formattedDate =
        "${movement.createdAt.day}/${movement.createdAt.month}/${movement.createdAt.year} "
        "${movement.createdAt.hour.toString().padLeft(2, '0')}:${movement.createdAt.minute.toString().padLeft(2, '0')}";

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.border.withValues(alpha: 0.3)),
      ),
      color: AppColors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: typeColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(typeIcon, color: typeColor, size: 22),
              ),
              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movement.productName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      movement.reason.isNotEmpty
                          ? movement.reason
                          : _getLocalizedType(context, movement.type),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 12,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movement.username,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              Text(
                '$quantitySign${movement.quantity}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: typeColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getLocalizedType(BuildContext context, StockMovementType type) {
    switch (type) {
      case StockMovementType.IN:
        return S.of(context).movements_type_in;
      case StockMovementType.OUT:
        return S.of(context).movements_type_out;
      case StockMovementType.ADJUSTMENT:
        return S.of(context).movements_type_adjustment;
    }
  }
}
