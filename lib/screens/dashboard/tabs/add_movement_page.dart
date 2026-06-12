import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/stock_movement_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/providers/stock_movement_provider.dart';
import 'package:provider/provider.dart';

class AddMovementPage extends StatefulWidget {
  const AddMovementPage({super.key});

  @override
  State<AddMovementPage> createState() => _AddMovementPageState();
}

class _AddMovementPageState extends State<AddMovementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? _selectedProductId;
  StockMovementType _selectedType = StockMovementType.IN;

  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().loadProducts();
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(s.add_movement_title),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel(s.add_movement_product_label),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  final products = productProvider.products;

                  return DropdownButtonFormField<int>(
                    value: _selectedProductId,
                    hint: Text(s.add_movement_product_label),
                    dropdownColor: AppColors.white,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.inventory_2_rounded,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
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
                    items: products.map((product) {
                      return DropdownMenuItem<int>(
                        value: product.id,
                        child: Text(product.name),
                      );
                    }).toList(),
                    validator: (value) =>
                        value == null ? "Please select a product" : null,
                    onChanged: (value) {
                      setState(() {
                        _selectedProductId = value;
                      });
                    },
                  );
                },
              ),

              const SizedBox(height: 24),

              _buildLabel(s.add_movement_type_label),
              Center(
                child: SegmentedButton<StockMovementType>(
                  segments: <ButtonSegment<StockMovementType>>[
                    ButtonSegment<StockMovementType>(
                      value: StockMovementType.IN,
                      label: Text(s.movements_type_in),
                      icon: const Icon(Icons.arrow_downward_rounded),
                    ),
                    ButtonSegment<StockMovementType>(
                      value: StockMovementType.OUT,
                      label: Text(s.movements_type_out),
                      icon: const Icon(Icons.arrow_upward_rounded),
                    ),
                    ButtonSegment<StockMovementType>(
                      value: StockMovementType.ADJUSTMENT,
                      label: Text(s.movements_type_adjustment),
                      icon: const Icon(Icons.tune_rounded),
                    ),
                  ],
                  selected: <StockMovementType>{_selectedType},
                  onSelectionChanged: (Set<StockMovementType> newSelection) {
                    setState(() {
                      _selectedType = newSelection.first;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                      states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        switch (_selectedType) {
                          case StockMovementType.IN:
                            return AppColors.success;
                          case StockMovementType.OUT:
                            return AppColors.error;
                          case StockMovementType.ADJUSTMENT:
                            return Colors.orange;
                        }
                      }
                      return AppColors.white;
                    }),
                    foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                      states,
                    ) {
                      if (states.contains(WidgetState.selected))
                        return Colors.white;
                      return AppColors.textSecondary;
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _buildLabel(s.add_movement_quantity_label),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: '0',
                  prefixIcon: const Icon(
                    Icons.analytics_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
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
                validator: (val) {
                  if (val == null || val.isEmpty) return "Quantity is required";
                  final qty = int.tryParse(val);
                  if (qty == null || qty <= 0)
                    return "Quantity must be greater than 0";
                  return null;
                },
              ),

              const SizedBox(height: 24),

              _buildLabel(s.add_movement_reason_label),
              TextFormField(
                controller: _reasonController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: s.add_movement_reason_hint,
                  prefixIcon: const Icon(
                    Icons.comment_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
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
                          s.add_movement_button,
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

  void _handleSave() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);

      final movement = StockMovement(
        id: 0,
        productId: _selectedProductId!,
        productName: '',
        username: '',
        quantity: int.parse(_quantityController.text),
        type: _selectedType,
        reason: _reasonController.text,
        createdAt: DateTime.now(),
      );

      final errorMsg = await context.read<StockMovementProvider>().addMovement(
        movement,
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
