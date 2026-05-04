import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/providers/language_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);

    return PopupMenuButton<String>(
      icon: Icon(Icons.language_rounded, color: color),
      onSelected: (String code) {
        langProvider.changeLanguage(code);
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(value: 'en', child: Text("English 🇺🇸")),
        const PopupMenuItem(
          value: 'ar',
          enabled: true,
          child: Text("العربية 🇲🇷"),
        ),
        const PopupMenuItem(
          value: 'fr',
          enabled: false,
          child: Text("Français 🇫🇷"),
        ),
      ],
    );
  }
}
