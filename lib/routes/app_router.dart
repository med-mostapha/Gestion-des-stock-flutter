import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/storage/token_storage.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/dashboard_layout.dart';
import 'package:gestion_de_stock_flutter/screens/onboarding/main_page.dart';
import '../screens/auth/login_page.dart';
import '../screens/auth/signup_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainPage());

      case AppRoutes.login:
        return PageRouteBuilder(
          pageBuilder: (_, _, _) => const LoginPage(),
          transitionDuration: Duration.zero,
        );

      case AppRoutes.signup:
        return PageRouteBuilder(
          pageBuilder: (_, _, _) => const SignUpPage(),
          transitionDuration: Duration.zero,
        );

      case AppRoutes.dashboard:
        return PageRouteBuilder(
          pageBuilder: (_, _, _) => const _GuardedDashboard(),
          transitionDuration: Duration.zero,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}

class _GuardedDashboard extends StatefulWidget {
  const _GuardedDashboard();

  @override
  State<_GuardedDashboard> createState() => _GuardedDashboardState();
}

class _GuardedDashboardState extends State<_GuardedDashboard> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final hasToken = await TokenStorage.hasToken();
    if (!mounted) return;
    if (!hasToken) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const DashboardPage();
  }
}
