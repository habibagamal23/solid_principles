import 'package:flutter/material.dart';

import '../../domain/entitys/userEntity.dart';

class UserData extends StatelessWidget {
  const UserData({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          iconColor: Colors.blueAccent,
          title: Text(user.name),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          iconColor: Colors.blueAccent,
          title: Text(user.phone),
        ),
      ],
    );
  }
}