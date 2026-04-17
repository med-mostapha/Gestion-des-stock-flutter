import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  final List<String> items;

  const SearchBarApp({super.key, required this.items});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  late TextEditingController controller;
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    filteredItems = widget.items;
  }

  void onSearch(String query) {
    final results = widget.items.where((item) {
      return item.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredItems = results;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16),
          ),

          leading: const Icon(Icons.search),
          hintText: "Search...",
          onChanged: onSearch,
        ),

        const SizedBox(height: 10),

        Expanded(
          child: filteredItems.isEmpty
              ? const Center(child: Text("No results found"))
              : ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(filteredItems[index]));
                  },
                ),
        ),
      ],
    );
  }
}
