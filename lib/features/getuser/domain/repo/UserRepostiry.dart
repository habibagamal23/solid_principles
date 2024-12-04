import 'package:solid_p/core/network/ApiResult.dart';
import 'package:solid_p/features/getuser/domain/entitys/userEntity.dart';

abstract class UserRepositry{
  // dart z
  // solid princple open closed
  Future<ApiResult<UserEntity>> getuser({required String id });
  Future<ApiResult<UserEntity>> createUser({required String name ,required String pass });

}
