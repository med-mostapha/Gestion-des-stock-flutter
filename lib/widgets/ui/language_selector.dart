import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/providers/language_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);

    Color getStateColor(String selectedLange) {
      return langProvider.locale.languageCode == selectedLange
          ? AppColors.primary
          : AppColors.black;
    }

    return PopupMenuButton<String>(
      icon: Icon(Icons.language_rounded, color: color),
      onSelected: (String code) {
        langProvider.changeLanguage(code);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'en',
          child: Text(
            "English 🇬🇧",
            style: TextStyle(color: getStateColor("en")),
          ),
        ),
        PopupMenuItem(
          value: 'ar',
          enabled: true,
          child: Text(
            "العربية 🇲🇷",
            style: TextStyle(color: getStateColor("ar")),
          ),
        ),
        PopupMenuItem(
          value: 'fr',
          enabled: true,
          child: Text(
            "Français 🇫🇷",
            style: TextStyle(color: getStateColor("fr")),
          ),
        ),
      ],
    );
  }
}
