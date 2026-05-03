import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/details/category_detail_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/add_category_page.dart';
import 'package:gestion_de_stock_flutter/widgets/categories/category_card.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().loadCategories();
    });
  }

  void _confirmDelete(Category category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(S.of(context).categories_delete_title),
          content: Text(S.of(context).categories_delete_message(category.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                S.of(context).common_cancel,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
              onPressed: () {
                context.read<CategoryProvider>().deleteCategory(category.id);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).categories_deleted(category.name),
                    ),
                  ),
                );
              },
              child: Text(
                S.of(context).common_delete,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryProvider>();

    return Scaffold(
      body: provider.isLoading
          ? _buildSkeleton()
          : provider.error != null
          ? _buildError(provider.error!)
          : provider.categories.isEmpty
          ? Center(child: Text(S.of(context).categories_empty))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: provider.categories.length,
              itemBuilder: (context, index) {
                final category = provider.categories[index];
                return CategoryCard(
                  category: category,
                  onLongPress: () => _confirmDelete(category),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryDetailPage(category: category),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),

      floatingActionButton: FloatingActionButton(
        heroTag: S.of(context).widget_category_no_desc,
        backgroundColor: AppColors.white,

        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCategoryPage()),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 5,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (_, _) => Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message, style: const TextStyle(color: AppColors.error)),
    );
  }
}
