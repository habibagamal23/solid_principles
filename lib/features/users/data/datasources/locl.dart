import 'dart:convert';

import '../../../../core/cachhelper/chachhelpe.dart';
import '../models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedUser";
  UserLocalDataSource({required this.cache});

  cacheUser(UserModel? userToCache) {
    if (userToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          userToCache.toJson(),
        ),
      );
    } else {
      throw Exception( "No Internet Connection");
    }
  }

  Future<UserModel> getLastUser() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw Exception("No Internet Connection");
    }
  }
}