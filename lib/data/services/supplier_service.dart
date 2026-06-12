import 'package:gestion_de_stock_flutter/core/network/api_client.dart';
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/data/models/supplier_model.dart';

class SupplierService {
  static final ApiClient _client = ApiClient();

  Future<List<Supplier>> getAllSuppliers() async {
    final data = await _client.get(ApiEndpoints.suppliers);
    if (data is List) {
      return data.map((e) => Supplier.fromJson(e)).toList();
    }
    return [];
  }

  Future<Supplier> createSupplier(Supplier supplier) async {
    final data = await _client.post(ApiEndpoints.suppliers, supplier.toJson());
    return Supplier.fromJson(data);
  }

  Future<Supplier> updateSupplier(int id, Supplier supplier) async {
    final data = await _client.put(
      '${ApiEndpoints.suppliers}/$id',
      supplier.toJson(),
    );
    return Supplier.fromJson(data);
  }

  Future<void> deleteSupplier(int id) async {
    await _client.delete('${ApiEndpoints.suppliers}/$id');
  }
}
