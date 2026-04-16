import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/categories_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/products_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/settings_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => __DashboardPageState();
}

class __DashboardPageState extends State<DashboardPage> {
  int index = 0;

  final pages = const [ProductsPage(), CategoriesPage(), SettingsPage()];

  final titles = const ["Products", "Categories", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[index])),

      body: IndexedStack(index: index, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
