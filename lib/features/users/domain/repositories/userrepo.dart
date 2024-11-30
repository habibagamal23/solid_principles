import 'package:dartz/dartz.dart';
import 'package:solid_p/core/network/ApiResult.dart';

import '../../../../core/error/feliuier.dart';
import '../entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>>getUser({required String id});
}
