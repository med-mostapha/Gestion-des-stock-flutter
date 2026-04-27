import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/stats_card.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;
    final categories = context.watch<CategoryProvider>().categories;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2,

      children: [
        StatsCard(
          title: "Products",
          subtitle: "",
          value: products.length + .0,
          icon: Icons.inventory,
          iconbg: AppColors.primary,
        ),
        StatsCard(
          title: "Category",
          subtitle: "",
          value: categories.length + .0,
          icon: Icons.category,
          iconbg: CupertinoColors.activeOrange,
        ),
        const StatsCard(
          title: "Money",
          subtitle: "",
          value: 12059,
          icon: Icons.money_off_csred,
          iconbg: CupertinoColors.systemPurple,
        ),
        const StatsCard(
          title: "Wallet",
          subtitle: "",
          value: 4568,
          icon: Icons.wallet,
          iconbg: CupertinoColors.activeGreen,
        ),
      ],
    );
  }
}
