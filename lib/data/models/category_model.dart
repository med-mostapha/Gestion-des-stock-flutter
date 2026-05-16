import 'package:floor/floor.dart';

@Entity(tableName: 'categories')
class Category {
  @PrimaryKey()
  final String id;

  final String name;
  final String? description;

  Category({required this.id, required this.name, this.description});

  Category copyWith({String? id, String? name, String? description}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description};
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
    );
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
