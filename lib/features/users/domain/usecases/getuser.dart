import 'package:dartz/dartz.dart';

import '../../../../core/error/feliuier.dart';
import '../../../../core/network/ApiResult.dart';
import '../entity/user_entity.dart';
import '../repositories/userrepo.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});

  Future<Either<Failure, UserEntity>> call({required String id}) {
    return repository.getUser(id: id);
  }
}
