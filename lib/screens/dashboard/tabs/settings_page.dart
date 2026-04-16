import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Log out"),
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        },
      ),
    );
  }
}
