import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/stock_movement_model.dart';
import 'package:gestion_de_stock_flutter/data/services/stock_movement_service.dart';

class StockMovementProvider extends ChangeNotifier {
  final StockMovementService _service = StockMovementService();

  List<StockMovement> _movements = [];
  bool _isLoading = false;
  String? _error;

  List<StockMovement> get movements => _movements;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadMovements({
    String? productName,
    StockMovementType? type,
    String? reason,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _movements = await _service.getFilteredMovements(
        productName: productName,
        type: type,
        reason: reason,
      );
    } catch (e) {
      _error = "Failed to load stock movements";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> addMovement(StockMovement movement) async {
    try {
      final newMovement = await _service.createMovement(movement);
      _movements.insert(0, newMovement);
      notifyListeners();
      return null;
    } catch (e) {
      return "Failed to register stock movement";
    }
  }
}
