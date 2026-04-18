import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  final Function(String query) onChanged;

  const SearchBarApp({super.key, required this.onChanged});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: "Search...",
      leading: const Icon(Icons.search),
      onChanged: widget.onChanged,
    );
  }
}
