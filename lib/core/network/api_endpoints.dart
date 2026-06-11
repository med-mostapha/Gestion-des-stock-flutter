class ApiEndpoints {
  // Change to your machine's IP if testing on a physical device
  // Android emulator  → 10.0.2.2
  // iOS simulator     → 127.0.0.1
  // Physical device   → your LAN IP e.g. 192.168.1.x
  static const String baseUrl = 'http://10.39.153.122:8081/api';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // Products
  static const String products = '/products';
  static String productById(int id) => '/products/$id';
  static const String lowStockProducts = '/products/minstock';

  // Categories
  static const String categories = '/categories';
  static String categoryById(int id) => '/categories/$id';

  // Dashboard
  static const String dashboard = '/dashboard';
}
