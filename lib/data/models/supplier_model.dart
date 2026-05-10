class Supplier {
  final String id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final bool? isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Supplier({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Supplier copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Supplier(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
