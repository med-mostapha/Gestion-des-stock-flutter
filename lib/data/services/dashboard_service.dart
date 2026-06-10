import 'package:gestion_de_stock_flutter/core/network/api_client.dart';
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/data/models/dashboard_stats.dart';

class DashboardService {
  static final ApiClient _client = ApiClient();

  static Future<DashboardStats> fetchStats() async {
    try {
      final data = await _client.get(ApiEndpoints.dashboard);
      return DashboardStats.fromJson(data as Map<String, dynamic>);
    } on ApiException catch (e) {
      if (e.statusCode == 401 || e.statusCode == 403) {
        throw Exception('Session expired. Please login again.');
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Cannot connect to server. Check your connection.');
    }
  }
}
