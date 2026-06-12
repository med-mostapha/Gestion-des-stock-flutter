import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/dashboard_provider.dart';
import 'package:gestion_de_stock_flutter/providers/stock_movement_provider.dart';
import 'package:gestion_de_stock_flutter/providers/supplier_provider.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/categories_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/index_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/movements_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/products_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/settings_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/suppliers_page.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/language_selector.dart';
import 'package:provider/provider.dart';
import '../../providers/category_provider.dart';
import '../../providers/product_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;

  final pages = [
    const IndexPage(),
    const ProductsPage(),
    const CategoriesPage(),
    const SuppliersPage(),
    const MovementsPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    // Fetch all data once when dashboard opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().fetchStats();
      context.read<ProductProvider>().loadProducts();
      context.read<CategoryProvider>().loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      S.of(context).dashboard_title,
      S.of(context).dashboard_products,
      S.of(context).dashboard_categories,
      S.of(context).dashboard_suppliers,
      S.of(context).movements_title,
      S.of(context).dashboard_settings,
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(titles[index]),
        titleTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        automaticallyImplyLeading: false,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          // نستثني فقط صفحة الإعدادات (index 5) من زر الـ Refresh لتظهر فيها قائمة اللغات
          index != 5
              ? IconButton(
                  onPressed: () {
                    switch (index) {
                      case 0:
                        context.read<DashboardProvider>().fetchStats();
                        context.read<ProductProvider>().loadProducts();
                        context.read<CategoryProvider>().loadCategories();
                        break;
                      case 1:
                        context.read<ProductProvider>().loadProducts();
                        break;
                      case 2:
                        context.read<CategoryProvider>().loadCategories();
                        break;
                      case 3:
                        context.read<SupplierProvider>().loadSuppliers();
                        break;
                      case 4:
                        context.read<StockMovementProvider>().loadMovements();
                        break;
                    }
                  },
                  icon: const Icon(
                    Icons.refresh_rounded,
                    color: AppColors.textPrimary,
                  ),
                )
              : const LanguageSelector(color: AppColors.black),
        ],
      ),

      // IndexedStack keeps the state of each page alive
      body: IndexedStack(index: index, children: pages),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              activeIcon: Icon(Icons.grid_view_rounded),
              label: S.of(context).dashboard_overview,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2_rounded),
              label: S.of(context).dashboard_products,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category_rounded),
              label: S.of(context).dashboard_categories,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping_outlined),
              activeIcon: Icon(Icons.local_shipping),
              label: S.of(context).dashboard_suppliers,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz_rounded),
              activeIcon: Icon(Icons.swap_horiz_rounded),
              label: S.of(context).dashboard_movements,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings_rounded),
              label: S.of(context).dashboard_settings,
            ),
          ],
        ),
      ),
    );
  }
}
