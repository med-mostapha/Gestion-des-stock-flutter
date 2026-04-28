import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';

class CategoryDetailPage extends StatefulWidget {
  final Category category;

  const CategoryDetailPage({super.key, required this.category});
  @override
  State<CategoryDetailPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.category.name)),
    );
  }
}
