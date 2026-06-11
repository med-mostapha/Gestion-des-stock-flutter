import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/supplier_model.dart';
import 'package:gestion_de_stock_flutter/data/services/supplier_service.dart';

class SupplierProvider extends ChangeNotifier {
  final SupplierService _service = SupplierService();

  List<Supplier> _suppliers = [];
  bool _isLoading = false;
  String? _error;

  List<Supplier> get suppliers => _suppliers;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadSuppliers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _suppliers = await _service.getAllSuppliers();
    } catch (e) {
      print("🚨 REAL SUPPLIER ERROR: $e");
      _error = "Failed to load suppliers";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> addSupplier(Supplier supplier) async {
    try {
      final newSupplier = await _service.createSupplier(supplier);
      _suppliers.add(newSupplier);
      notifyListeners();
      return null;
    } catch (e) {
      return "Failed to add supplier";
    }
  }

  Future<String?> updateSupplier(int id, Supplier updatedSupplier) async {
    try {
      final updated = await _service.updateSupplier(id, updatedSupplier);
      final index = _suppliers.indexWhere((s) => s.id == id);
      if (index != -1) {
        _suppliers[index] = updated;
        notifyListeners();
      }
      return null;
    } catch (e) {
      return "Failed to update supplier";
    }
  }

  Future<String?> deleteSupplier(int id) async {
    try {
      await _service.deleteSupplier(id);
      _suppliers.removeWhere((s) => s.id == id);
      notifyListeners();
      return null;
    } catch (e) {
      return "Failed to delete supplier";
    }
  }

  List<Supplier> search(String query) {
    return _suppliers
        .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
