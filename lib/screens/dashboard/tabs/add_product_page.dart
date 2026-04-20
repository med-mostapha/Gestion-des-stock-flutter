import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductPage> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController stock = TextEditingController();
  final TextEditingController minStock = TextEditingController();

  String selectedCategory = "c1"; // (Dummy)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Product")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formstate,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              // Name
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Required";
                  if (val.length < 2) return "Min 2 chars";
                  return null;
                },
              ),

              // PRice
              TextFormField(
                controller: price,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: "Price"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Required";
                  final n = double.tryParse(val);
                  if (n == null) return "Invalid number";
                  if (n < 0) return "Must be positive";
                  return null;
                },
              ),

              // stock
              TextFormField(
                controller: stock,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Stock"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Required";
                  final n = int.tryParse(val);
                  if (n == null) return "Invalid number";
                  if (n < 0) return "Must be positive";
                  return null;
                },
              ),

              // Min stock
              TextFormField(
                controller: minStock,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Min Stock"),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Required";
                  final n = int.tryParse(val);
                  if (n == null) return "Invalid number";
                  if (n < 0) return "Must be positive";
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Category
              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                items: const [
                  DropdownMenuItem(value: "c1", child: Text("Electronics")),
                  DropdownMenuItem(value: "c2", child: Text("Food")),
                  DropdownMenuItem(value: "c3", child: Text("Clothes")),
                ],
                onChanged: (val) {
                  setState(() {
                    selectedCategory = val!;
                  });
                },
                decoration: const InputDecoration(labelText: "Category"),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (formstate.currentState!.validate()) {
                    final product = Product(
                      id: DateTime.now().toString(),
                      name: name.text,
                      price: double.parse(price.text),
                      stock: int.parse(stock.text),
                      minStock: int.parse(minStock.text),
                      categoryId: selectedCategory,
                      createdAt: DateTime.now(),
                    );

                    Navigator.pop(context, product);
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
