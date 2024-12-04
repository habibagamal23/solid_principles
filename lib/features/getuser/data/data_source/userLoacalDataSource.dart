import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:solid_p/features/getuser/data/model/userModel.dart';

import '../../../../core/cachhelper/chachhelpe.dart';

class UserLocalDataSource {
  final CacheHelper cacheHelper;

  UserLocalDataSource({required this.cacheHelper});

  cachUser(UserModel? user) {
    if (user != null) {
      cacheHelper.saveData(key: "usercach", value: json.encode(user.toJson()));
    } else {
      throw Exception("No save");
    }
  }

  Future<UserModel> getLastUser() {
    final stringuser = cacheHelper.getDataString(key: "usercach");

    if (stringuser != null) {
      return Future.value(UserModel.fromJson(json.decode(stringuser)));
    } else {
      throw Exception("No get user from chach");
    }
  }
}
