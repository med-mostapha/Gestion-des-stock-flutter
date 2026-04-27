import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 6,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: Text(
          category.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          category.description ?? "No description",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: Icon(Icons.edit_note, color: AppColors.primary, size: 22),
      ),
    );
  }
}
