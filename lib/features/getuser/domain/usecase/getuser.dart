import 'package:solid_p/features/getuser/domain/repo/UserRepostiry.dart';

import '../../../../core/network/ApiResult.dart';
import '../entitys/userEntity.dart';

class GetUser {
  UserRepositry userRepositry;
  GetUser({required this.userRepositry});

  Future<ApiResult<UserEntity>> call({required String id}) {
    return userRepositry.getuser(id: id);
  }
}
