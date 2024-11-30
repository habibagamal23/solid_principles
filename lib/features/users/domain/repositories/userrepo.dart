import 'package:solid_p/core/network/ApiResult.dart';

import '../entity/user_entity.dart';

abstract class UserRepository {
  Future<ApiResult<UserEntity>> getUser({required String id});
}
