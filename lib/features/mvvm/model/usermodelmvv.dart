class UserModelMvvm {
  final String name;
  final String phone;
  final String email;

  UserModelMvvm({
    required this.name,
    required this.phone,
    required this.email,
  });

  factory UserModelMvvm.fromJson(Map<String, dynamic> json) {
    return UserModelMvvm(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

