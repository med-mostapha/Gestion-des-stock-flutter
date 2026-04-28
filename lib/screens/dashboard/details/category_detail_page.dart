import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/%20services/analytics_service.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/detail/detail_field.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/detail/detail_info_card.dart';
import 'package:gestion_de_stock_flutter/widgets/products/product_card.dart';

class CategoryDetailPage extends StatefulWidget {
  final Category category;

  const CategoryDetailPage({super.key, required this.category});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _name;
  late final TextEditingController _description;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.category.name);
    _description = TextEditingController(
      text: widget.category.description ?? '',
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      final updated = Category(
        id: widget.category.id,
        name: _name.text,
        description: _description.text,
      );

      context.read<CategoryProvider>().updateCategory(
        widget.category.id,
        updated,
      );

      setState(() => _isEditing = false);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Category updated")));
    }
  }

  void _handleDelete() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete Category"),
        content: Text("Delete '${widget.category.name}'?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              context.read<CategoryProvider>().deleteCategory(
                widget.category.id,
              );
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // provider updated with new value
    final updatedCategory = context
        .watch<CategoryProvider>()
        .categories
        .firstWhere(
          (c) => c.id == widget.category.id,
          orElse: () => widget.category,
        );

    // products fo this category.
    final products = context
        .watch<ProductProvider>()
        .products
        .where((p) => p.categoryId == widget.category.id)
        .toList();

    final totalValue = AnalyticsService.getTotalStockValueByCategory(
      context.read<ProductProvider>().products,
      widget.category.id,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        title: Text(
          updatedCategory.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: _handleDelete,
          ),
        ],
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Analytics Card
              DetailInfoCard(
                child: Row(
                  children: [
                    _buildStatItem(
                      icon: Icons.inventory_2_outlined,
                      label: "Products",
                      value: products.length.toString(),
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 16),
                    _buildStatItem(
                      icon: Icons.account_balance_wallet_outlined,
                      label: "Stock Value",
                      value: "${totalValue.toStringAsFixed(0)} MRU",
                      color: AppColors.success,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //  Category Info
              DetailInfoCard(
                title: "CATEGORY INFO",
                child: Column(
                  children: [
                    DetailField(
                      label: "Category Name",
                      controller: _name,
                      icon: Icons.category_outlined,
                      readOnly: !_isEditing,
                      validator: (v) => v!.isEmpty ? "Required" : null,
                    ),
                    DetailField(
                      label: "Description",
                      controller: _description,
                      icon: Icons.notes_outlined,
                      readOnly: !_isEditing,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //  Edit / Save Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isEditing
                        ? AppColors.success
                        : AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isEditing
                      ? _handleSave
                      : () => setState(() => _isEditing = true),
                  icon: Icon(
                    _isEditing ? Icons.check : Icons.edit,
                    color: Colors.white,
                  ),
                  label: Text(
                    _isEditing ? "Save Changes" : "Edit Category",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              //  Products List
              const Text(
                "PRODUCTS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

              products.isEmpty
                  ? const Center(
                      child: Text(
                        "No products in this category",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.72,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: products[index],
                          onTap: () {},
                          onLongPress: () {},
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: color,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
