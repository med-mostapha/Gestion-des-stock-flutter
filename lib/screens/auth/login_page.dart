import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
          },
        ),
      ),
    );
  }
}
