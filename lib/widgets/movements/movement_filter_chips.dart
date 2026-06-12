import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/stock_movement_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';

class MovementFilterChips extends StatelessWidget {
  final StockMovementType? selectedType;
  final ValueChanged<StockMovementType?> onTypeSelected;

  const MovementFilterChips({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final List<Map<String, dynamic>> filters = [
      {'type': null, 'label': 'All'},
      {'type': StockMovementType.IN, 'label': s.movements_type_in},
      {'type': StockMovementType.OUT, 'label': s.movements_type_out},
      {
        'type': StockMovementType.ADJUSTMENT,
        'label': s.movements_type_adjustment,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: filters.map((filter) {
          final type = filter['type'] as StockMovementType?;
          final label = filter['label'] as String;
          final isSelected = selectedType == type;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(label),
              selected: isSelected,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.border.withValues(alpha: 0.5),
                ),
              ),
              showCheckmark: false,
              onSelected: (selected) {
                if (selected) onTypeSelected(type);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
