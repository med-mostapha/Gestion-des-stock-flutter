import 'package:floor/floor.dart';
import 'package:gestion_de_stock_flutter/data/database/daos/category_dao.dart';
import 'package:gestion_de_stock_flutter/data/database/daos/product_dao.dart';
import 'package:gestion_de_stock_flutter/data/database/daos/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import '../models/product_model.dart';
import '../models/category_model.dart';
import '../models/app_user_model.dart';

@Database(version: 1, entities: [Product, Category, AppUser])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
  CategoryDao get categoryDao;
  UserDao get userDao;
}
