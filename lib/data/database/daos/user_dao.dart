import 'package:floor/floor.dart';
import '../../models/app_user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users WHERE email = :email')
  Future<AppUser?> getUserByEmail(String email);

  @Query('SELECT * FROM users WHERE id = :id')
  Future<AppUser?> getUserById(String id);

  @insert
  Future<void> insertUser(AppUser user);

  @update
  Future<void> updateUser(AppUser user);

  @delete
  Future<void> deleteUser(AppUser user);
}
