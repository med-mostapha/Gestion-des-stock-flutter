// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductDao? _productDaoInstance;

  CategoryDao? _categoryDaoInstance;

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `products` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `price` REAL NOT NULL, `stock` INTEGER NOT NULL, `minStock` INTEGER NOT NULL, `category_id` TEXT NOT NULL, `created_at` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categories` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `description` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` TEXT NOT NULL, `email` TEXT NOT NULL, `name` TEXT NOT NULL, `passwordHash` TEXT NOT NULL, `created_at` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'products',
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'stock': item.stock,
                  'minStock': item.minStock,
                  'category_id': item.categoryId,
                  'created_at': item.createdAt
                }),
        _productUpdateAdapter = UpdateAdapter(
            database,
            'products',
            ['id'],
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'stock': item.stock,
                  'minStock': item.minStock,
                  'category_id': item.categoryId,
                  'created_at': item.createdAt
                }),
        _productDeletionAdapter = DeletionAdapter(
            database,
            'products',
            ['id'],
            (Product item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'price': item.price,
                  'stock': item.stock,
                  'minStock': item.minStock,
                  'category_id': item.categoryId,
                  'created_at': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  final UpdateAdapter<Product> _productUpdateAdapter;

  final DeletionAdapter<Product> _productDeletionAdapter;

  @override
  Future<List<Product>> getAllProducts() async {
    return _queryAdapter.queryList('SELECT * FROM products',
        mapper: (Map<String, Object?> row) => Product(
            id: row['id'] as String,
            name: row['name'] as String,
            price: row['price'] as double,
            stock: row['stock'] as int,
            minStock: row['minStock'] as int,
            categoryId: row['category_id'] as String,
            createdAt: row['created_at'] as String));
  }

  @override
  Future<Product?> getProductById(String id) async {
    return _queryAdapter.query('SELECT * FROM products WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Product(
            id: row['id'] as String,
            name: row['name'] as String,
            price: row['price'] as double,
            stock: row['stock'] as int,
            minStock: row['minStock'] as int,
            categoryId: row['category_id'] as String,
            createdAt: row['created_at'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertProduct(Product product) async {
    await _productInsertionAdapter.insert(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(Product product) async {
    await _productUpdateAdapter.update(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduct(Product product) async {
    await _productDeletionAdapter.delete(product);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _categoryInsertionAdapter = InsertionAdapter(
            database,
            'categories',
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                }),
        _categoryUpdateAdapter = UpdateAdapter(
            database,
            'categories',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                }),
        _categoryDeletionAdapter = DeletionAdapter(
            database,
            'categories',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Category> _categoryInsertionAdapter;

  final UpdateAdapter<Category> _categoryUpdateAdapter;

  final DeletionAdapter<Category> _categoryDeletionAdapter;

  @override
  Future<List<Category>> getAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as String,
            name: row['name'] as String,
            description: row['description'] as String?));
  }

  @override
  Future<Category?> getCategoryById(String id) async {
    return _queryAdapter.query('SELECT * FROM categories WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as String,
            name: row['name'] as String,
            description: row['description'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _categoryInsertionAdapter.insert(category, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCategory(Category category) async {
    await _categoryUpdateAdapter.update(category, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCategory(Category category) async {
    await _categoryDeletionAdapter.delete(category);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _appUserInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (AppUser item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'name': item.name,
                  'passwordHash': item.passwordHash,
                  'created_at': item.createdAt
                }),
        _appUserUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['id'],
            (AppUser item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'name': item.name,
                  'passwordHash': item.passwordHash,
                  'created_at': item.createdAt
                }),
        _appUserDeletionAdapter = DeletionAdapter(
            database,
            'users',
            ['id'],
            (AppUser item) => <String, Object?>{
                  'id': item.id,
                  'email': item.email,
                  'name': item.name,
                  'passwordHash': item.passwordHash,
                  'created_at': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AppUser> _appUserInsertionAdapter;

  final UpdateAdapter<AppUser> _appUserUpdateAdapter;

  final DeletionAdapter<AppUser> _appUserDeletionAdapter;

  @override
  Future<AppUser?> getUserByEmail(String email) async {
    return _queryAdapter.query('SELECT * FROM users WHERE email = ?1',
        mapper: (Map<String, Object?> row) => AppUser(
            id: row['id'] as String,
            email: row['email'] as String,
            name: row['name'] as String,
            passwordHash: row['passwordHash'] as String,
            createdAt: row['created_at'] as String),
        arguments: [email]);
  }

  @override
  Future<AppUser?> getUserById(String id) async {
    return _queryAdapter.query('SELECT * FROM users WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AppUser(
            id: row['id'] as String,
            email: row['email'] as String,
            name: row['name'] as String,
            passwordHash: row['passwordHash'] as String,
            createdAt: row['created_at'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertUser(AppUser user) async {
    await _appUserInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(AppUser user) async {
    await _appUserUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(AppUser user) async {
    await _appUserDeletionAdapter.delete(user);
  }
}
