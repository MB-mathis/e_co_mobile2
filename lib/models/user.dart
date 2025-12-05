class User {
  final String id;
  final String email;
  final String fullName;
  final String role; // 'professor' ou 'participant'
  final String? token;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      role: json['role'] as String,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'role': role,
      'token': token,
    };
  }
}
