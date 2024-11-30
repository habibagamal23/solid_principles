class UserModelMvc {
  final String name;
  final String phone;
  final String email;

  UserModelMvc({
    required this.name,
    required this.phone,
    required this.email,
  });

  factory UserModelMvc.fromJson(Map<String, dynamic> json) {
    return UserModelMvc(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

