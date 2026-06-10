import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/core/storage/token_storage.dart';

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() => 'ApiException($statusCode): $message';
}

class ApiClient {
  // Build headers — attaches JWT if available
  Future<Map<String, String>> _headers({bool requiresAuth = true}) async {
    final headers = {'Content-Type': 'application/json'};
    if (requiresAuth) {
      final token = await TokenStorage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  // Throws ApiException for non-2xx responses
  void _checkStatus(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      String message = 'Request failed';
      try {
        final body = jsonDecode(response.body);
        message = body['message'] ?? body['error'] ?? message;
      } catch (_) {}
      throw ApiException(response.statusCode, message);
    }
  }

  Future<dynamic> get(String path) async {
    final uri = Uri.parse('${ApiEndpoints.baseUrl}$path');
    final response = await http.get(uri, headers: await _headers());
    _checkStatus(response);
    return jsonDecode(response.body);
  }

  Future<dynamic> post(
    String path,
    Map<String, dynamic> body, {
    bool requiresAuth = true,
  }) async {
    final uri = Uri.parse('${ApiEndpoints.baseUrl}$path');
    final response = await http.post(
      uri,
      headers: await _headers(requiresAuth: requiresAuth),
      body: jsonEncode(body),
    );
    _checkStatus(response);
    return jsonDecode(response.body);
  }

  Future<dynamic> put(String path, Map<String, dynamic> body) async {
    final uri = Uri.parse('${ApiEndpoints.baseUrl}$path');
    final response = await http.put(
      uri,
      headers: await _headers(),
      body: jsonEncode(body),
    );
    _checkStatus(response);
    return jsonDecode(response.body);
  }

  Future<void> delete(String path) async {
    final uri = Uri.parse('${ApiEndpoints.baseUrl}$path');
    final response = await http.delete(uri, headers: await _headers());
    _checkStatus(response);
  }
}
