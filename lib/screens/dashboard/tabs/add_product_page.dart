import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductPage> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stock = TextEditingController();
  final TextEditingController minStock = TextEditingController();

  int? selectedCategoryId;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final categories = context.read<CategoryProvider>().categories;
      if (categories.isNotEmpty) {
        setState(() {
          selectedCategoryId = categories.first.id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(s.add_product_title),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(s.add_product_name_label),
              _buildTextField(
                controller: name,
                hint: s.add_product_name_hint,
                icon: Icons.edit_note_rounded,
                validator: (val) =>
                    (val == null || val.isEmpty) ? s.validation_required : null,
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(s.add_product_price_label),
                        _buildTextField(
                          controller: price,
                          hint: "0.00",
                          icon: Icons.attach_money_rounded,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (val) => (val == null || val.isEmpty)
                              ? s.validation_required
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(s.add_product_category_label),
                        _buildCategoryDropdown(s),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(s.add_product_stock_label),
                        _buildTextField(
                          controller: stock,
                          hint: "0",
                          icon: Icons.inventory_rounded,
                          keyboardType: TextInputType.number,
                          validator: (val) => (val == null || val.isEmpty)
                              ? s.validation_required
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(s.add_product_min_stock_label),
                        _buildTextField(
                          controller: minStock,
                          hint: s.add_product_min_stock_hint,
                          icon: Icons.notification_important_rounded,
                          keyboardType: TextInputType.number,
                          validator: (val) => (val == null || val.isEmpty)
                              ? s.validation_required
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _isSaving ? null : _handleSave,
                  child: _isSaving
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          s.add_product_button,
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

  // --- Helper Widgets ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4, right: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.border.withValues(alpha: 0.5),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.border.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown(S s) {
    final categories = context.watch<CategoryProvider>().categories;

    return DropdownButtonFormField<int>(
      value: selectedCategoryId,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 15,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: categories.map((category) {
        return DropdownMenuItem<int>(
          value: category.id,
          child: Text(category.name),
        );
      }).toList(),
      onChanged: (val) => setState(() => selectedCategoryId = val),
      validator: (val) => val == null ? s.validation_required : null,
    );
  }

  void _handleSave() async {
    if (formstate.currentState!.validate() && selectedCategoryId != null) {
      setState(() => _isSaving = true);

      final product = Product(
        id: 0,
        name: name.text,
        price: double.parse(price.text),
        stock: int.parse(stock.text),
        minStock: int.parse(minStock.text),
        categoryId: selectedCategoryId!,
        createdAt: DateTime.now(),
      );

      final errorMsg = await context.read<ProductProvider>().addProduct(
        product,
      );

      setState(() => _isSaving = false);

      if (mounted) {
        if (errorMsg != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg), backgroundColor: AppColors.error),
          );
        } else {
          Navigator.pop(context);
        }
      }
    }
  }
}
