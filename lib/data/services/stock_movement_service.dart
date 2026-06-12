import 'package:gestion_de_stock_flutter/core/network/api_client.dart';
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/data/models/stock_movement_model.dart';

class StockMovementService {
  static final ApiClient _client = ApiClient();

  Future<List<StockMovement>> getFilteredMovements({
    String? productName,
    StockMovementType? type,
    String? reason,
  }) async {
    String url = ApiEndpoints.movements;
    List<String> params = [];

    if (productName != null && productName.isNotEmpty) {
      params.add('productName=$productName');
    }
    if (type != null) {
      params.add('type=${type.name}');
    }
    if (reason != null && reason.isNotEmpty) {
      params.add('reason=$reason');
    }

    if (params.isNotEmpty) {
      url += '?${params.join('&')}';
    }

    final data = await _client.get(url);
    if (data is List) {
      return data.map((e) => StockMovement.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<StockMovement>> getMovementsByProductId(int productId) async {
    final data = await _client.get(
      '${ApiEndpoints.movements}/product/$productId',
    );
    if (data is List) {
      return data.map((e) => StockMovement.fromJson(e)).toList();
    }
    return [];
  }

  Future<StockMovement> createMovement(StockMovement movement) async {
    final data = await _client.post(
      ApiEndpoints.movements,
      movement.toJsonRequest(),
    );
    return StockMovement.fromJson(data);
  }
}
