import 'package:flutter_test/flutter_test.dart';
import 'package:gestion_de_stock_flutter/data/database/app_database.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/models/app_user_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository_impl.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository_impl.dart';
import 'package:gestion_de_stock_flutter/data/repositories/user_repository.dart';

void main() {
  late AppDatabase database;
  late ProductRepositoryImpl productRepository;
  late CategoryRepositoryImpl categoryRepository;
  late UserRepositoryImpl userRepository;

  setUpAll(() async {
    // Initialize in-memory database for testing
    database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();

    productRepository = ProductRepositoryImpl(database);
    categoryRepository = CategoryRepositoryImpl(database);
    userRepository = UserRepositoryImpl(database);
  });

  tearDownAll(() async {
    await database.close();
  });

  group('Product Repository Tests', () {
    test('Add product to database', () async {
      final product = Product(
        id: '1',
        name: 'Test Product',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: DateTime.now().toIso8601String(),
      );

      await productRepository.addProduct(product);
      final products = await productRepository.getAllProducts();

      expect(products, isNotEmpty);
      expect(products.first.name, 'Test Product');
      expect(products.first.price, 100.0);
    });

    test('Get all products', () async {
      final product1 = Product(
        id: '2',
        name: 'Product 1',
        price: 50.0,
        stock: 30,
        minStock: 5,
        categoryId: 'cat1',
        createdAt: DateTime.now().toIso8601String(),
      );

      final product2 = Product(
        id: '3',
        name: 'Product 2',
        price: 75.0,
        stock: 20,
        minStock: 8,
        categoryId: 'cat2',
        createdAt: DateTime.now().toIso8601String(),
      );

      await productRepository.addProduct(product1);
      await productRepository.addProduct(product2);

      final products = await productRepository.getAllProducts();

      expect(products.length, greaterThanOrEqualTo(2));
    });

    test('Get product by ID', () async {
      final product = Product(
        id: 'prod-123',
        name: 'Unique Product',
        price: 200.0,
        stock: 100,
        minStock: 15,
        categoryId: 'cat1',
        createdAt: DateTime.now().toIso8601String(),
      );

      await productRepository.addProduct(product);
      final retrieved = await productRepository.getProductById('prod-123');

      expect(retrieved, isNotNull);
      expect(retrieved!.name, 'Unique Product');
      expect(retrieved.id, 'prod-123');
    });

    test('Update product', () async {
      final product = Product(
        id: 'prod-update',
        name: 'Original Name',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: DateTime.now().toIso8601String(),
      );

      await productRepository.addProduct(product);

      final updatedProduct = product.copyWith(
        name: 'Updated Name',
        price: 150.0,
        stock: 40,
      );

      await productRepository.updateProduct(updatedProduct);
      final retrieved = await productRepository.getProductById('prod-update');

      expect(retrieved!.name, 'Updated Name');
      expect(retrieved.price, 150.0);
      expect(retrieved.stock, 40);
    });

    test('Delete product', () async {
      final product = Product(
        id: 'prod-delete',
        name: 'To Delete',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: DateTime.now().toIso8601String(),
      );

      await productRepository.addProduct(product);
      await productRepository.deleteProduct('prod-delete');

      final retrieved = await productRepository.getProductById('prod-delete');
      expect(retrieved, isNull);
    });

    test('Product with copyWith preserves all fields', () async {
      final original = Product(
        id: 'copytest',
        name: 'Original',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: '2024-05-16T20:00:00.000Z',
      );

      final copied = original.copyWith(name: 'Changed');

      expect(copied.id, original.id);
      expect(copied.price, original.price);
      expect(copied.stock, original.stock);
      expect(copied.name, 'Changed');
      expect(copied.createdAt, original.createdAt);
    });

    test('Product equality works correctly', () {
      final product1 = Product(
        id: 'p1',
        name: 'Product',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: '2024-05-16T20:00:00.000Z',
      );

      final product2 = Product(
        id: 'p1',
        name: 'Product',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: '2024-05-16T20:00:00.000Z',
      );

      expect(product1, product2);
    });
  });

  group('Category Repository Tests', () {
    test('Add category to database', () async {
      final category = Category(
        id: 'cat-1',
        name: 'Electronics',
        description: 'Electronic items',
      );

      await categoryRepository.addCategory(category);
      final categories = await categoryRepository.getAllCategories();

      expect(categories, isNotEmpty);
      expect(categories.first.name, 'Electronics');
    });

    test('Get all categories', () async {
      final category1 = Category(
        id: 'cat-2',
        name: 'Clothing',
        description: 'Clothes',
      );

      final category2 = Category(
        id: 'cat-3',
        name: 'Food',
        description: 'Food items',
      );

      await categoryRepository.addCategory(category1);
      await categoryRepository.addCategory(category2);

      final categories = await categoryRepository.getAllCategories();

      expect(categories.length, greaterThanOrEqualTo(2));
    });

    test('Get category by ID', () async {
      final category = Category(
        id: 'cat-unique',
        name: 'Unique Category',
        description: 'Description',
      );

      await categoryRepository.addCategory(category);
      final retrieved = await categoryRepository.getCategoryById('cat-unique');

      expect(retrieved, isNotNull);
      expect(retrieved!.name, 'Unique Category');
    });

    test('Update category', () async {
      final category = Category(
        id: 'cat-update',
        name: 'Old Name',
        description: 'Old description',
      );

      await categoryRepository.addCategory(category);

      final updated = category.copyWith(
        name: 'New Name',
        description: 'New description',
      );

      await categoryRepository.updateCategory(updated);
      final retrieved = await categoryRepository.getCategoryById('cat-update');

      expect(retrieved!.name, 'New Name');
      expect(retrieved.description, 'New description');
    });

    test('Delete category', () async {
      final category = Category(id: 'cat-delete', name: 'To Delete');

      await categoryRepository.addCategory(category);
      await categoryRepository.deleteCategory('cat-delete');

      final retrieved = await categoryRepository.getCategoryById('cat-delete');
      expect(retrieved, isNull);
    });

    test('Category nullable description', () async {
      final category = Category(id: 'cat-no-desc', name: 'No Description');

      await categoryRepository.addCategory(category);
      final retrieved = await categoryRepository.getCategoryById('cat-no-desc');

      expect(retrieved!.description, isNull);
    });
  });

  group('User Repository Tests', () {
    test('Add user to database', () async {
      final user = AppUser(
        id: 'user-1',
        email: 'test@example.com',
        name: 'Test User',
        passwordHash: 'hashed_password_123',
        createdAt: DateTime.now().toIso8601String(),
      );

      await userRepository.addUser(user);
      final retrieved = await userRepository.getUserById('user-1');

      expect(retrieved, isNotNull);
      expect(retrieved!.email, 'test@example.com');
    });

    test('Get user by email', () async {
      final user = AppUser(
        id: 'user-email',
        email: 'unique@example.com',
        name: 'Email Test',
        passwordHash: 'hashed',
        createdAt: DateTime.now().toIso8601String(),
      );

      await userRepository.addUser(user);
      final retrieved = await userRepository.getUserByEmail(
        'unique@example.com',
      );

      expect(retrieved, isNotNull);
      expect(retrieved!.name, 'Email Test');
    });

    test('Update user', () async {
      final user = AppUser(
        id: 'user-update',
        email: 'update@example.com',
        name: 'Original Name',
        passwordHash: 'old_hash',
        createdAt: DateTime.now().toIso8601String(),
      );

      await userRepository.addUser(user);

      final updated = user.copyWith(
        name: 'Updated Name',
        passwordHash: 'new_hash',
      );

      await userRepository.updateUser(updated);
      final retrieved = await userRepository.getUserById('user-update');

      expect(retrieved!.name, 'Updated Name');
      expect(retrieved.passwordHash, 'new_hash');
    });

    test('Delete user', () async {
      final user = AppUser(
        id: 'user-delete',
        email: 'delete@example.com',
        name: 'Delete Me',
        passwordHash: 'hash',
        createdAt: DateTime.now().toIso8601String(),
      );

      await userRepository.addUser(user);
      await userRepository.deleteUser('user-delete');

      final retrieved = await userRepository.getUserById('user-delete');
      expect(retrieved, isNull);
    });

    test('Password hash never exposed in toJson', () {
      final user = AppUser(
        id: 'user-json',
        email: 'json@example.com',
        name: 'Json Test',
        passwordHash: 'secret_hash_123',
        createdAt: DateTime.now().toIso8601String(),
      );

      final json = user.toJson();

      expect(json.containsKey('passwordHash'), false);
      expect(json.containsKey('email'), true);
      expect(json.containsKey('name'), true);
    });
  });

  group('DateTime Conversion Tests', () {
    test('Product createdAt is stored as ISO8601 string', () async {
      final now = DateTime.now();
      final product = Product(
        id: 'datetime-test',
        name: 'DateTime Test',
        price: 100.0,
        stock: 50,
        minStock: 10,
        categoryId: 'cat1',
        createdAt: now.toIso8601String(),
      );

      await productRepository.addProduct(product);
      final retrieved = await productRepository.getProductById('datetime-test');

      expect(retrieved!.createdAt, isA<String>());
      // Verify it can be parsed back to DateTime
      final parsedDate = DateTime.parse(retrieved.createdAt);
      expect(parsedDate, isA<DateTime>());
    });

    test('Parse and format datetime correctly', () {
      final isoString = '2024-05-16T20:45:30.000Z';
      final parsed = DateTime.parse(isoString);

      expect(parsed.year, 2024);
      expect(parsed.month, 5);
      expect(parsed.day, 16);
    });
  });

  group('Error Handling Tests', () {
    test('Get non-existent product returns null', () async {
      final product = await productRepository.getProductById('non-existent');
      expect(product, isNull);
    });

    test('Delete non-existent product handles gracefully', () async {
      // Should not throw
      await productRepository.deleteProduct('non-existent');
    });

    test('Get non-existent category returns null', () async {
      final category = await categoryRepository.getCategoryById('non-existent');
      expect(category, isNull);
    });

    test('Get user by non-existent email returns null', () async {
      final user = await userRepository.getUserByEmail('non@existent.com');
      expect(user, isNull);
    });
  });

  group('Database Constraints Tests', () {
    test('Product with all required fields', () async {
      final product = Product(
        id: 'req-test',
        name: 'Required Fields Test',
        price: 99.99,
        stock: 25,
        minStock: 5,
        categoryId: 'cat-required',
        createdAt: DateTime.now().toIso8601String(),
      );

      await productRepository.addProduct(product);
      final retrieved = await productRepository.getProductById('req-test');

      expect(retrieved!.id, isNotEmpty);
      expect(retrieved.name, isNotEmpty);
      expect(retrieved.price, greaterThan(0));
      expect(retrieved.categoryId, isNotEmpty);
    });

    test('Category with null description', () async {
      final category = Category(
        id: 'nullable-test',
        name: 'Nullable Test',
        description: null,
      );

      await categoryRepository.addCategory(category);
      final retrieved = await categoryRepository.getCategoryById(
        'nullable-test',
      );

      expect(retrieved!.description, isNull);
    });

    test('User createdAt is timestamp string', () async {
      final user = AppUser(
        id: 'timestamp-test',
        email: 'timestamp@test.com',
        name: 'Timestamp Test',
        passwordHash: 'hash',
        createdAt: DateTime.now().toIso8601String(),
      );

      await userRepository.addUser(user);
      final retrieved = await userRepository.getUserById('timestamp-test');

      expect(retrieved!.createdAt, isA<String>());
    });
  });
}
