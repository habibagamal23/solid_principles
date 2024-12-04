import 'package:solid_p/features/getuser/domain/repo/UserRepostiry.dart';

import '../../../../core/network/ApiResult.dart';
import '../entitys/userEntity.dart';

class CreatUser {
  UserRepositry userRepositry;

  CreatUser(this.userRepositry);

  Future<ApiResult<UserEntity>>  call({required String name, required String pass}) {
    return userRepositry.createUser(name: name, pass: pass);
  }
}
