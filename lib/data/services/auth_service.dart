import 'package:gestion_de_stock_flutter/core/network/api_client.dart';
import 'package:gestion_de_stock_flutter/core/network/api_endpoints.dart';
import 'package:gestion_de_stock_flutter/core/storage/token_storage.dart';

class AuthService {
  static final ApiClient _client = ApiClient();

  static Future<String?> login({
    required String username,
    required String password,
  }) async {
    try {
      final data = await _client.post(ApiEndpoints.login, {
        'username': username,
        'password': password,
      }, requiresAuth: false);
      final token = data['token'] as String?;
      if (token == null) return 'Invalid response from server';
      await TokenStorage.saveToken(token);
      return null; // success
    } on ApiException catch (e) {
      if (e.statusCode == 401 || e.statusCode == 403) {
        return 'Invalid username or password';
      }
      return e.message;
    } catch (_) {
      return 'Cannot connect to server. Check your connection.';
    }
  }

  static Future<String?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await _client.post(ApiEndpoints.register, {
        'username': username,
        'email': email,
        'password': password,
      }, requiresAuth: false);
      // Auto-login after successful registration
      return await login(username: username, password: password);
    } on ApiException catch (e) {
      if (e.statusCode == 409) return 'Username or email already exists';
      return e.message;
    } catch (_) {
      return 'Cannot connect to server. Check your connection.';
    }
  }

  static Future<void> logout() async {
    await TokenStorage.clearToken();
  }
}
