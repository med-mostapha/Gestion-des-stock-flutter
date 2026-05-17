import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_theme.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/routes/app_router.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/providers/language_provider.dart';
import 'package:gestion_de_stock_flutter/data/database/app_database.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository_impl.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .build();

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepositoryImpl(database);
    final categoryRepository = CategoryRepositoryImpl(database);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(productRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(categoryRepository),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, langProvider, child) {
          return MaterialApp(
            locale: langProvider.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Gestion des Stock',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.main,
            onGenerateRoute: AppRouter.generateRoute,
            theme: AppTheme.lightTheme,
          );
        },
      ),
    );
  }
}
