import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/dashboard_stats.dart';
import 'package:gestion_de_stock_flutter/data/services/dashboard_service.dart';

enum DashboardStatus { initial, loading, success, error }

class DashboardProvider extends ChangeNotifier {
  DashboardStatus _status = DashboardStatus.initial;
  DashboardStats? _stats;
  String? _errorMessage;

  DashboardStatus get status => _status;
  DashboardStats? get stats => _stats;
  String? get errorMessage => _errorMessage;

  bool get isLoading => _status == DashboardStatus.loading;
  bool get hasError => _status == DashboardStatus.error;
  bool get hasData => _status == DashboardStatus.success && _stats != null;

  Future<void> fetchStats() async {
    // Avoid refetch if already loading
    if (_status == DashboardStatus.loading) return;

    _status = DashboardStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _stats = await DashboardService.fetchStats();
      _status = DashboardStatus.success;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _status = DashboardStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _status = DashboardStatus.initial;
    await fetchStats();
  }
}
