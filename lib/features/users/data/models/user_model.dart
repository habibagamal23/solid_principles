import 'package:solid_p/features/users/data/models/submodels/adress.dart';
import 'package:solid_p/features/users/data/models/submodels/company.dart';

import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final Company company;

  UserModel({
    required this.id,
    required this.username,
    required this.website,
    required this.company,
    required String name,
    required String phone,
    required String email,
    required Address address,
  }) : super(
          name: name,
          phone: phone,
          email: email,
          address: address,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': (address as Address).toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
    };
  }
}
