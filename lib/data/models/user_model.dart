class AppUser {
  final String id;
  final String email;
  final String name;
  final String role;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });

  AppUser copyWith({String? id, String? email, String? name, String? role}) {
    return AppUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }
}
