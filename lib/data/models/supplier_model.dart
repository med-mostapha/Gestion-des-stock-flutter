class Supplier {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final int? userId;
  final DateTime createdAt;

  Supplier({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.userId,
    required this.createdAt,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    DateTime parsedDate = DateTime.now();
    if (json['created_at'] != null) {
      parsedDate = DateTime.parse(json['created_at'] as String);
    } else if (json['createdAt'] != null) {
      parsedDate = DateTime.parse(json['createdAt'] as String);
    }

    return Supplier(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      userId: json['user_id'] != null
          ? (json['user_id'] as num).toInt()
          : (json['userId'] != null ? (json['userId'] as num).toInt() : null),
      createdAt: parsedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'phone': phone, 'email': email, 'address': address};
  }
}
