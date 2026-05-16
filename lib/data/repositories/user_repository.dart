import 'package:gestion_de_stock_flutter/data/database/app_database.dart';
import 'package:gestion_de_stock_flutter/data/models/app_user_model.dart';

abstract class UserRepository {
  Future<AppUser?> getUserByEmail(String email);
  Future<AppUser?> getUserById(String id);
  Future<void> addUser(AppUser user);
  Future<void> updateUser(AppUser user);
  Future<void> deleteUser(String id);
}

class UserRepositoryImpl implements UserRepository {
  final AppDatabase database;

  UserRepositoryImpl(this.database);

  @override
  Future<AppUser?> getUserByEmail(String email) async {
    try {
      return await database.userDao.getUserByEmail(email);
    } catch (e) {
      throw Exception('Failed to fetch user by email: $e');
    }
  }

  @override
  Future<AppUser?> getUserById(String id) async {
    try {
      return await database.userDao.getUserById(id);
    } catch (e) {
      throw Exception('Failed to fetch user by id: $e');
    }
  }

  @override
  Future<void> addUser(AppUser user) async {
    try {
      await database.userDao.insertUser(user);
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }

  @override
  Future<void> updateUser(AppUser user) async {
    try {
      await database.userDao.updateUser(user);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      final user = await database.userDao.getUserById(id);
      if (user != null) {
        await database.userDao.deleteUser(user);
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
