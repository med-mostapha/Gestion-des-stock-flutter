import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/screens/homePage.dart';
import 'package:gestion_de_stock_flutter/widgets/tabNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Homepage(), bottomNavigationBar: TabNavigationBar()),
    );
  }
}
