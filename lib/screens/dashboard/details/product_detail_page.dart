import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/detail/detail_field.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/detail/detail_info_card.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/detail/detail_stock_badge.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _name;
  late final TextEditingController _price;
  late final TextEditingController _stock;
  late final TextEditingController _minStock;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.product.name);
    _price = TextEditingController(text: widget.product.price.toString());
    _stock = TextEditingController(text: widget.product.stock.toString());
    _minStock = TextEditingController(text: widget.product.minStock.toString());
  }

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _stock.dispose();
    _minStock.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      final updated = Product(
        id: widget.product.id,
        name: _name.text,
        price: double.parse(_price.text),
        stock: int.parse(_stock.text),
        minStock: int.parse(_minStock.text),
        categoryId: widget.product.categoryId,
        createdAt: widget.product.createdAt,
      );

      context.read<ProductProvider>().updateProduct(widget.product.id, updated);

      setState(() => _isEditing = false);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Product updated")));
    }
  }

  void _handleDelete() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Delete Product"),
        content: Text("Delete '${widget.product.name}'?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              context.read<ProductProvider>().deleteProduct(widget.product.id);
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
    // for detail stock badge to read updated data.
    final updatedProduct = context.watch<ProductProvider>().products.firstWhere(
      (p) => p.id == widget.product.id,
      orElse: () => widget.product,
    );
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        title: Text(
          widget.product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // Delete
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
            children: [
              //  Stock Alert
              DetailStockBadge(
                stock: updatedProduct.stock,
                minStock: updatedProduct.minStock,
              ),

              const SizedBox(height: 16),

              //  Product Info
              DetailInfoCard(
                title: "PRODUCT INFO",
                child: Column(
                  children: [
                    DetailField(
                      label: "Product Name",
                      controller: _name,
                      icon: Icons.inventory_2_outlined,
                      readOnly: !_isEditing,
                      validator: (v) => v!.isEmpty ? "Required" : null,
                    ),
                    DetailField(
                      label: "Price (MRU)",
                      controller: _price,
                      icon: Icons.attach_money_rounded,
                      readOnly: !_isEditing,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? "Required" : null,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              //  Stock Info
              DetailInfoCard(
                title: "STOCK INFO",
                child: Column(
                  children: [
                    DetailField(
                      label: "Stock Quantity",
                      controller: _stock,
                      icon: Icons.inventory_rounded,
                      readOnly: !_isEditing,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? "Required" : null,
                    ),
                    DetailField(
                      label: "Alert Level",
                      controller: _minStock,
                      icon: Icons.warning_amber_rounded,
                      readOnly: !_isEditing,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? "Required" : null,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              //  Edit | Save Button
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
                    _isEditing ? "Save Changes" : "Edit Product",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
