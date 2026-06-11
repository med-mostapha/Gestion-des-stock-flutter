import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/supplier_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/supplier_provider.dart';
import 'package:provider/provider.dart';

class AddSupplierPage extends StatefulWidget {
  final Supplier? supplier;
  const AddSupplierPage({super.key, this.supplier});

  @override
  State<AddSupplierPage> createState() => _AddSupplierState();
}

class _AddSupplierState extends State<AddSupplierPage> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();

  bool _isSaving = false;
  bool get isEditMode => widget.supplier != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      name.text = widget.supplier!.name;
      phone.text = widget.supplier!.phone ?? '';
      email.text = widget.supplier!.email ?? '';
      address.text = widget.supplier!.address ?? '';
    }
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          isEditMode
              ? s.detail_edit_category.replaceAll('Category', 'Supplier')
              : s.dashboard_suppliers,
        ),
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
              _buildLabel(
                s.add_category_name_label.replaceAll('Category', 'Supplier'),
              ),
              _buildTextField(
                controller: name,
                hint: s.add_category_name_hint.replaceAll(
                  'category',
                  'supplier',
                ),
                icon: Icons.edit_note_rounded,
                validator: (val) =>
                    (val == null || val.isEmpty) ? s.validation_required : null,
              ),

              const SizedBox(height: 20),

              _buildLabel('Phone'),
              _buildTextField(
                controller: phone,
                hint: '00000000',
                icon: Icons.phone_rounded,
                keyboardType: TextInputType.phone,
                validator: (val) =>
                    (val == null || val.isEmpty) ? s.validation_required : null,
              ),

              const SizedBox(height: 20),

              _buildLabel('Email'),
              _buildTextField(
                controller: email,
                hint: 'supplier@email.com',
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              _buildLabel(
                s.add_category_desc_label.replaceAll('Description', 'Address'),
              ),
              _buildTextField(
                controller: address,
                hint: s.add_category_desc_hint.replaceAll(
                  'category description',
                  'physical address',
                ),
                icon: Icons.location_on_rounded,
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
                          isEditMode
                              ? 'Save'
                              : s.add_category_button.replaceAll(
                                  'Category',
                                  'Supplier',
                                ),
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

  // Helper Widgets

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

  void _handleSave() async {
    if (formstate.currentState!.validate()) {
      setState(() => _isSaving = true);

      final supplier = Supplier(
        id: isEditMode ? widget.supplier!.id : 0,
        name: name.text,
        phone: phone.text,
        email: email.text,
        address: address.text,
        createdAt: isEditMode ? widget.supplier!.createdAt : DateTime.now(),
      );

      String? errorMsg;
      if (isEditMode) {
        errorMsg = await context.read<SupplierProvider>().updateSupplier(
          widget.supplier!.id,
          supplier,
        );
      } else {
        errorMsg = await context.read<SupplierProvider>().addSupplier(supplier);
      }

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
