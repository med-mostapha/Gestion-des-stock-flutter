import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class AppUser {
  @PrimaryKey()
  final String id;

  final String email;
  final String name;
  final String passwordHash;

  @ColumnInfo(name: 'created_at')
  final String createdAt;  // ← String بدل DateTime

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.passwordHash,
    required this.createdAt,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? name,
    String? passwordHash,
    String? createdAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      passwordHash: passwordHash ?? this.passwordHash,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'createdAt': createdAt,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      passwordHash: json['passwordHash'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? DateTime.now().toIso8601String(),
    );
  }

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, name: $name, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          name == other.name &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^ email.hashCode ^ name.hashCode ^ createdAt.hashCode;
}
